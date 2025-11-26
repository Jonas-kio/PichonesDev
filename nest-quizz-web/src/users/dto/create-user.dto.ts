import { IsBoolean, IsOptional, IsString } from 'class-validator';

export class CreateUserDto {
  @IsString()
  correo: string;

  @IsString()
  nombreCompleto: string;

  @IsOptional()
  @IsBoolean()
  activo?: boolean;
}
