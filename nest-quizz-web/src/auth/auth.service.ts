// src/auth/auth.service.ts
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcrypt';

import { UsersService } from '../users/users.service';

@Injectable()
export class AuthService {
  constructor(
    private readonly usersService: UsersService,
    private readonly jwtService: JwtService,
  ) {}

  async login(correo: string, password: string) {
    // 1. Buscar usuario con passwordHash
    const user = await this.usersService.findByEmailWithPassword(correo);
    console.log('LOGIN - usuario encontrado:', user);

    if (!user || !user.passwordHash) {
      throw new UnauthorizedException('Credenciales inválidas');
    }

    // 2. Comparar contraseña
    console.log('LOGIN - password recibido:', password);
    console.log('LOGIN - hash guardado:', user.passwordHash);

    const ok = await bcrypt.compare(password, user.passwordHash);
    console.log('LOGIN - bcrypt.compare =', ok);

    if (!ok) {
      throw new UnauthorizedException('Credenciales inválidas');
    }

    // 3. Obtener roles desde privilegios
    const roles = await this.usersService.getUserRoles(user.id);
    console.log('LOGIN - roles:', roles);

    // 4. Generar payload y token
    const payload = {
      sub: user.id,
      correo: user.correo,
      roles,
    };

    const token = await this.jwtService.signAsync(payload);
    console.log('LOGIN - token generado:', token);

    // 5. Limpiar password antes de responder
    delete (user as any).passwordHash;

    return {
      access_token: token,
      user: {
        ...user,
        roles,
      },
    };
  }
}
