import { IsBoolean, IsInt, IsOptional, IsString, Min, MinLength } from 'class-validator';

export class CreateQuizDto {
  @IsString()
  @MinLength(3)
  titulo: string;

  @IsOptional()
  @IsString()
  descripcion?: string;

  @IsOptional()
  @IsInt()
  @Min(1)
  duracionMinutos?: number;

  @IsOptional()
  @IsInt()
  @Min(1)
  intentosPermitidos?: number;

  @IsOptional()
  @IsBoolean()
  mostrarResultados?: boolean;

  @IsOptional()
  @IsBoolean()
  aleatorizarPreguntas?: boolean;

  @IsOptional()
  @IsBoolean()
  aleatorizarOpciones?: boolean;

  @IsOptional()
  @IsBoolean()
  activo?: boolean;
}
