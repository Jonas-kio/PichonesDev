import { IsOptional, IsString } from 'class-validator';

export class UpdateUserResponseDto {
  @IsOptional()
  @IsString()
  respuesta?: string;
}
