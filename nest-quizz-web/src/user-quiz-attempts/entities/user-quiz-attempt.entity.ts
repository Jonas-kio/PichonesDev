import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('usuarios_intentos_examen')
export class UserQuizAttempt {
  @PrimaryGeneratedColumn({ name: 'id_intento' })
  id: number;

  @Column({ name: 'id_usuario', type: 'int' })
  idUsuario: number;

  @Column({ name: 'id_examen', type: 'int' })
  idExamen: number;

  @Column({ name: 'numero_intento', type: 'int' })
  numeroIntento: number;

  @Column({ name: 'fecha_inicio', type: 'timestamp', default: () => 'NOW()' })
  fechaInicio: Date;

  @Column({ name: 'fecha_fin', type: 'timestamp', nullable: true })
  fechaFin: Date | null;

  @Column({ name: 'estado', type: 'varchar', length: 20, default: 'EN_PROGRESO' })
  estado: 'EN_PROGRESO' | 'FINALIZADO' | 'CANCELADO';
}
