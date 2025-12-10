import {
  IsInt,
  IsOptional,
  IsString,
  MinLength,
  MaxLength,
  IsNumber,
} from 'class-validator';

export class CreateQuestionDto {
  @IsOptional()
  @IsInt({ message: 'idSubcategoria debe ser entero.' })
  idSubcategoria?: number;

  @IsOptional()
  @IsInt({ message: 'idRangoEdad debe ser entero.' })
  idRangoEdad?: number;

  @IsOptional()
  @IsInt({ message: 'idDificultad debe ser entero.' })
  idDificultad?: number;

  @IsOptional()
  @IsInt({ message: 'idEstado debe ser entero.' })
  idEstado?: number;

  @IsOptional()
  @IsString()
  @MaxLength(255)
  tipoPregunta?: string;

  @IsString({ message: 'El título debe ser un texto.' })
  @MinLength(5, { message: 'El título debe tener mínimo 5 caracteres.' })
  @MaxLength(255, { message: 'El título no puede superar 255 caracteres.' })
  tituloPregunta: string;

  @IsOptional()
  @IsInt({ message: 'idContenidoPregunta debe ser entero.' })
  idContenidoPregunta?: number;

  @IsOptional()
  @IsNumber({}, { message: 'puntosRecomendados debe ser numérico.' })
  puntosRecomendados?: number;

  @IsOptional()
  @IsInt({ message: 'tiempoEstimado debe ser entero (minutos).' })
  tiempoEstimado?: number;

  @IsOptional()
  @IsString()
  explicacion?: string;
}
