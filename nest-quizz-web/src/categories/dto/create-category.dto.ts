import { IsString, MinLength, MaxLength, Matches } from 'class-validator';

export class CreateCategoryDto {
    @IsString({ message: 'El nombre debe ser un texto.' })
    @MinLength(3, { message: 'El nombre debe tener mínimo 3 caracteres.' })
    @MaxLength(50, { message: 'El nombre no puede superar los 50 caracteres.' })
    @Matches(/^[A-Za-zÁÉÍÓÚÑáéíóúñ\s]+$/, { message: 'El nombre solo puede contener letras y espacios.'})
    name: string;

    @IsString({ message: 'La descripción debe ser un texto.' })
    @MinLength(5, { message: 'La descripción debe tener mínimo 5 caracteres.' })
    @MaxLength(200, { message: 'La descripción no puede superar 200 caracteres.' })
    description: string;
}
