// src/auth/jwt.strategy.ts
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { UsersService } from '../users/users.service';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(private readonly usersService: UsersService) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: process.env.JWT_SECRET || 'super_secret_key',
    });
  }

  // payload: { sub: userId, correo: string, roles: string[] }
  async validate(payload: any) {
    // 1. Buscar usuario real en BD
    const user = await this.usersService.findOne(payload.sub);
    if (!user) throw new UnauthorizedException('Usuario no válido');

    // 2. Cargar roles desde la BD
    const roles = await this.usersService.getUserRoles(user.id);

    // 3. Limpiar datos sensibles
    delete (user as any).passwordHash;

    // 4. Retornar objeto completo que llegar a req.user
    return {
      ...user,
      roles,  // <- ESTO ES LO QUE NECESITA mustHaveRole
    };
  }
}
