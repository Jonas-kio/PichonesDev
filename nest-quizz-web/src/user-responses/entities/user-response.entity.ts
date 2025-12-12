import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('usuarios_respuestas')
export class UserResponse {
  @PrimaryGeneratedColumn({ name: 'id_respuesta_usuario' })
  id: number;

  @Column({ name: 'id_intento', type: 'int' })
  idIntento: number;

  @Column({ name: 'id_pregunta', type: 'int' })
  idPregunta: number;

  @Column({ name: 'respuesta', type: 'text', nullable: true })
  respuesta: string | null;

  @Column({ name: 'es_correcta', type: 'boolean', nullable: true })
  esCorrecta: boolean | null;

  @Column({ name: 'fecha_respuesta', type: 'timestamp', default: () => 'NOW()' })
  fechaRespuesta: Date;
}
