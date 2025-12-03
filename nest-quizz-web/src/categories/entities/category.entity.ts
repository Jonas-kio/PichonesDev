// src/categories/entities/category.entity.ts
import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('categorias')
export class Category {
  @PrimaryGeneratedColumn({ name: 'id_categoria' })
  id: number;

  @Column({ name: 'nombre_categoria', length: 50 })
  name: string;

  @Column({ name: 'descripcion', length: 200, nullable: true })
  description: string;

  @Column({ name: 'activo', type: 'boolean', default: true })
  active: boolean;
}
