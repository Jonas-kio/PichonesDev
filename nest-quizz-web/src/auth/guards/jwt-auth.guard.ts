import {
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';

@Injectable()
export class JwtAuthGuard extends AuthGuard('jwt') {
  handleRequest(err, user, info) {
    if (err || !user) {
      // info.message contiene mensajes como:
      // "invalid token", "jwt expired", "jwt malformed"...
      const mensaje =
        info?.message === 'jwt expired'
          ? 'Token expirado'
          : info?.message === 'invalid signature'
          ? 'Token con firma inválida'
          : info?.message?.includes('malformed')
          ? 'Token malformado'
          : 'Token inválido';

      throw new UnauthorizedException(mensaje);
    }

    return user;
  }
}
