import { IsIn, IsOptional } from 'class-validator';

export class UpdateUserQuizAttemptDto {
  @IsOptional()
  @IsIn(['FINALIZADO', 'CANCELADO'])
  estado?: 'FINALIZADO' | 'CANCELADO';
}
