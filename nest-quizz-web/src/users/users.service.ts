import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcrypt';

import { User } from './entities/user.entity';
import { Privilege } from './entities/privilege.entity';
import { UserPrivilege } from './entities/user-privilege.entity';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private readonly repo: Repository<User>,

    @InjectRepository(Privilege)
    private readonly privilegeRepo: Repository<Privilege>,

    @InjectRepository(UserPrivilege)
    private readonly userPrivilegeRepo: Repository<UserPrivilege>,
  ) {}

  // Crear usuario con password hasheado y privilegios opcionales
  async create(dto: CreateUserDto) {
    const passwordHash = await bcrypt.hash(dto.password, 10);

    const user = this.repo.create({
      correo: dto.correo,
      nombreCompleto: dto.nombreCompleto,
      passwordHash,
      fechaRegistro: new Date(),
      activo: dto.activo ?? true,
    });

    const saved = await this.repo.save(user);

    if (dto.privilegiosIds?.length) {
      const now = new Date();
      const registros = dto.privilegiosIds.map((idPrivilegio) =>
        this.userPrivilegeRepo.create({
          usuario: { id: saved.id },
          privilegio: { id: idPrivilegio },
          asignadoPor: null,
          fechaAsignacion: now,
        }),
      );

      await this.userPrivilegeRepo.save(registros);
    }

    delete (saved as any).passwordHash;
    return saved;
  }

  findAll() {
    return this.repo.find();
  }

  async findOne(id: number) {
    const user = await this.repo.findOne({ where: { id } });
    if (!user) throw new NotFoundException('Usuario no encontrado');
    return user;
  }

  async update(id: number, dto: UpdateUserDto) {
    const user = await this.findOne(id);

    let passwordHash: string | undefined;
    if (dto.password) {
      passwordHash = await bcrypt.hash(dto.password, 10);
    }

    await this.repo.update(id, {
      correo: dto.correo ?? user.correo,
      nombreCompleto: dto.nombreCompleto ?? user.nombreCompleto,
      activo: dto.activo ?? user.activo,
      passwordHash: passwordHash ?? user.passwordHash,
    });

    // Actualizar privilegios si vienen en el DTO
    if (dto.privilegiosIds) {
      await this.userPrivilegeRepo.delete({ usuario: { id } });

      const now = new Date();
      const registros = dto.privilegiosIds.map((idPrivilegio) =>
        this.userPrivilegeRepo.create({
          usuario: { id },
          privilegio: { id: idPrivilegio },
          asignadoPor: null,
          fechaAsignacion: now,
        }),
      );
      await this.userPrivilegeRepo.save(registros);
    }

    return this.findOne(id);
  }

  async remove(id: number) {
    await this.findOne(id);
    await this.userPrivilegeRepo.delete({ usuario: { id } });
    return this.repo.delete(id);
  }

  // Para login: buscar usuario por correo incluyendo passwordHash
  async findByEmailWithPassword(correo: string): Promise<User | null> {
    return this.repo
      .createQueryBuilder('u')
      .addSelect('u.passwordHash')
      .where('u.correo = :correo', { correo })
      .getOne();
  }

  // Para roles: obtener nombres de privilegios activos
async getUserRoles(userId: number): Promise<string[]> {
  const privilegios = await this.privilegeRepo
    .createQueryBuilder('p')
    .innerJoin(
      'usuarios_privilegios',
      'up',
      'up.id_privilegio = p.id_privilegio AND up.id_usuario = :userId',
      { userId },
    )
    .where('p.activo = true')
    .getMany();

    
  return privilegios.map((p) => p.nombre);
}
}
