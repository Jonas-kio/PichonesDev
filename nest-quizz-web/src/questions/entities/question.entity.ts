import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from 'typeorm';
import { User } from '../../users/entities/user.entity';

@Entity('preguntas')
export class Question {
  @PrimaryGeneratedColumn({ name: 'id_pregunta' })
  id: number;

  @Column({ name: 'id_subcategoria', type: 'int', nullable: true })
  idSubcategoria: number | null;

  @Column({ name: 'id_rango_edad', type: 'int', nullable: true })
  idRangoEdad: number | null;

  @Column({ name: 'id_dificultad', type: 'int', nullable: true })
  idDificultad: number | null;

  @Column({ name: 'id_estado', type: 'int', nullable: true })
  idEstado: number | null;

  @Column({ name: 'tipo_pregunta', type: 'varchar', length: 255, nullable: true })
  tipoPregunta: string | null;

  @Column({ name: 'titulo_pregunta', type: 'varchar', length: 255 })
  tituloPregunta: string;

  @Column({ name: 'id_contenido_pregunta', type: 'int', nullable: true })
  idContenidoPregunta: number | null;

  @Column({ name: 'puntos_recomendados', type: 'numeric', precision: 10, scale: 2, nullable: true })
  puntosRecomendados: number | null;

  @Column({ name: 'tiempo_estimado', type: 'int', nullable: true })
  tiempoEstimado: number | null;

  @Column({ name: 'explicacion', type: 'text', nullable: true })
  explicacion: string | null;

  @Column({ name: 'fecha_creacion', type: 'timestamp', nullable: true })
  fechaCreacion: Date | null;

  @Column({ name: 'fecha_modificacion', type: 'timestamp', nullable: true })
  fechaModificacion: Date | null;

  @Column({ name: 'creado_por', type: 'int', nullable: true })
  creadoPorId: number | null;

  @ManyToOne(() => User, { nullable: true })
  @JoinColumn({ name: 'creado_por' })
  creadoPor: User | null;

  @Column({ name: 'votos_requeridos', type: 'int', nullable: true })
  votosRequeridos: number | null;

  @Column({ name: 'votos_positivos', type: 'int', nullable: true })
  votosPositivos: number | null;

  @Column({ name: 'votos_negativos', type: 'int', nullable: true })
  votosNegativos: number | null;

  @Column({ name: 'fecha_publicacion', type: 'timestamp', nullable: true })
  fechaPublicacion: Date | null;

  @Column({ name: 'activa', type: 'boolean', default: true })
  activa: boolean;
}
