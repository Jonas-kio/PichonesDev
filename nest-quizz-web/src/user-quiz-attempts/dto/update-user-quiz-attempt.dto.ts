import { PartialType } from '@nestjs/mapped-types';
import { CreateUserQuizAttemptDto } from './create-user-quiz-attempt.dto';

export class UpdateUserQuizAttemptDto extends PartialType(CreateUserQuizAttemptDto) {}
