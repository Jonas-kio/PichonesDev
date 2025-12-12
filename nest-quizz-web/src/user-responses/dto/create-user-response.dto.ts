import { IsInt, Min, IsString, IsOptional } from 'class-validator';

export class CreateUserResponseDto {
  @IsInt()
  @Min(1)
  idIntento: number;

  @IsInt()
  @Min(1)
  idPregunta: number;

  @IsOptional()
  @IsString()
  respuesta?: string;
}
