import { IsInt, Min } from 'class-validator';

export class CreateUserQuizAttemptDto {
  @IsInt()
  @Min(1)
  idExamen: number;
}
