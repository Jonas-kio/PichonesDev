import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('examenes')
export class Quiz {
  @PrimaryGeneratedColumn({ name: 'id_examen' })
  id: number;

  @Column({ name: 'titulo', type: 'varchar', length: 255, nullable: true })
  titulo: string;

  @Column({ name: 'descripcion', type: 'text', nullable: true })
  descripcion: string | null;

  @Column({ name: 'duracion_minutos', type: 'int', nullable: true })
  duracionMinutos: number | null;

  @Column({ name: 'intentos_permitidos', type: 'int', nullable: true })
  intentosPermitidos: number | null;

  @Column({ name: 'mostrar_resultados', type: 'boolean', default: true })
  mostrarResultados: boolean;

  @Column({ name: 'aleatorizar_preguntas', type: 'boolean', default: true })
  aleatorizarPreguntas: boolean;

  @Column({ name: 'aleatorizar_opciones', type: 'boolean', default: true })
  aleatorizarOpciones: boolean;

  @Column({ name: 'activo', type: 'boolean', default: true })
  activo: boolean;

  @Column({ name: 'fecha_creacion', type: 'timestamp', nullable: true })
  fechaCreacion: Date | null;

  @Column({ name: 'creado_por', type: 'int', nullable: true })
  creadoPor: number | null;
}
