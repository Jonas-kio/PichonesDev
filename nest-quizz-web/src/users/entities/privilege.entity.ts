import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('privilegios')
export class Privilege {
  @PrimaryGeneratedColumn({ name: 'id_privilegio' })
  id: number;

  @Column({ name: 'nombre_privilegio', length: 255, nullable: true })
  nombre: string;

  @Column({ name: 'descripcion', length: 255, nullable: true })
  descripcion: string;

  @Column({ name: 'activo', type: 'boolean', nullable: true })
  activo: boolean | null;
}
