import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { UserQuizAttempt } from './entities/user-quiz-attempt.entity';
import { UserQuizAttemptsService } from './user-quiz-attempts.service';
import { UserQuizAttemptsController } from './user-quiz-attempts.controller';
import { Quiz } from '../quizzes/entities/quiz.entity';

@Module({
  imports: [TypeOrmModule.forFeature([UserQuizAttempt, Quiz])],
  controllers: [UserQuizAttemptsController],
  providers: [UserQuizAttemptsService],
})
export class UserQuizAttemptsModule {}
