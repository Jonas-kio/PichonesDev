import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('usuarios')
export class User {
  @PrimaryGeneratedColumn({ name: 'id_usuario' })
  id: number;

  @Column({ name: 'correo', length: 255, nullable: true })
  correo: string;

  @Column({ name: 'nombre_completo', length: 255, nullable: true })
  nombreCompleto: string;

  @Column({ name: 'fecha_registro', type: 'timestamp', nullable: true })
  fechaRegistro: Date;

  @Column({ name: 'registrado_por', nullable: true })
  registradoPor: number;

  @Column({ name: 'activo', type: 'boolean', nullable: true })
  activo: boolean;
}
