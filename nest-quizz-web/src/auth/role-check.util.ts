// src/auth/role-check.util.ts
import { ForbiddenException } from '@nestjs/common';

export function mustHaveRole(user: any, allowedRoles: string[]) {
  const roles: string[] = user?.roles ?? [];

  const ok = allowedRoles.some((r) => roles.includes(r));
  if (!ok) {
    throw new ForbiddenException(
      `No tienes permisos. Se requiere uno de: ${allowedRoles.join(', ')}`,
    );
  }
}
