import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('usuarios')
export class User {
  @PrimaryGeneratedColumn({ name: 'id_usuario' })
  id: number;

  @Column({ name: 'correo', type: 'varchar', length: 255, nullable: true })
  correo: string | null;

  @Column({ name: 'nombre_completo', type: 'varchar', length: 255, nullable: true })
  nombreCompleto: string | null;

  @Column({ name: 'fecha_registro', type: 'timestamp', nullable: true })
  fechaRegistro: Date | null;

  @Column({ name: 'registrado_por', type: 'int', nullable: true })
  registradoPor: number | null;

  @Column({ name: 'activo', type: 'boolean', nullable: true })
  activo: boolean | null;

  @Column({ name: 'password_hash', type: 'varchar', length: 255, nullable: true, select: false })
  passwordHash: string | null;
}
