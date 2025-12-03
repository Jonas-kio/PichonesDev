import {
  IsArray,
  IsBoolean,
  IsEmail,
  IsNotEmpty,
  IsOptional,
  IsString,
  IsNumber,
} from 'class-validator';

export class CreateUserDto {
  @IsEmail()
  correo: string;

  @IsString()
  @IsNotEmpty()
  nombreCompleto: string;

  @IsString()
  @IsNotEmpty()
  password: string;

  @IsOptional()
  @IsBoolean()
  activo?: boolean;

  // IDs de privilegios 
  @IsOptional()
  @IsArray()
  @IsNumber({}, { each: true })
  privilegiosIds?: number[];
}
