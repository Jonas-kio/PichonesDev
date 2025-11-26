import { IsString, IsOptional, IsBoolean } from 'class-validator';

export class CreateCategoryDto {
    @IsString()
    nombreCategoria: string;

    @IsString()
    @IsOptional()
    descripcion?: string;

    @IsBoolean()
    @IsOptional()
    activo?: boolean;
}