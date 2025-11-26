import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('categorias')
export class Category {
  @PrimaryGeneratedColumn({ name: 'id_categoria' })
  id: number;

  @Column({ name: 'nombre_categoria', type: 'varchar', length: 255 })
  nombreCategoria: string;

  @Column({ name: 'descripcion', type: 'varchar', length: 255, nullable: true })
  descripcion: string;

  @Column({ name: 'activo', type: 'boolean', default: true })
  activo: boolean;
}