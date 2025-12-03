import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import { User } from './user.entity';
import { Privilege } from './privilege.entity';

@Entity('usuarios_privilegios')
export class UserPrivilege {
  @PrimaryGeneratedColumn({ name: 'id_usuario_privilegio' })
  id: number;

  @ManyToOne(() => User)
  @JoinColumn({ name: 'id_usuario' })
  usuario: User;

  @ManyToOne(() => Privilege)
  @JoinColumn({ name: 'id_privilegio' })
  privilegio: Privilege;

  @Column({ name: 'asignado_por', type: 'int', nullable: true })
  asignadoPor: number | null;

  @Column({ name: 'fecha_asignacion', type: 'timestamp', nullable: true })
  fechaAsignacion: Date | null;
}
