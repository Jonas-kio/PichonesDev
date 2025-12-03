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
    const user = await this.usersService.findByEmailWithPassword(correo);
    console.log('LOGIN - usuario encontrado:', user);

    if (!user || !user.passwordHash) {
      throw new UnauthorizedException('Credenciales inválidas');
    }

    console.log('LOGIN - password recibido:', password);
    console.log('LOGIN - hash guardado:', user.passwordHash);

    const isMatch = await bcrypt.compare(password, user.passwordHash);
    console.log('LOGIN - bcrypt.compare =', isMatch);

    if (!isMatch) {
      throw new UnauthorizedException('Credenciales inválidas');
    }

    const roles = await this.usersService.getUserRoles(user.id);
    console.log('LOGIN - roles:', roles);

    const payload = {
      sub: user.id,
      correo: user.correo,
      roles,
    };

    const token = this.jwtService.sign(payload);
    console.log('LOGIN - token generado:', token);

    return {
      access_token: token,
      user: {
        id: user.id,
        correo: user.correo,
        roles,
      },
    };
  }
}
