import { Module } from '@nestjs/common';
import { UserQuizAttemptsService } from './user-quiz-attempts.service';
import { UserQuizAttemptsController } from './user-quiz-attempts.controller';

@Module({
  controllers: [UserQuizAttemptsController],
  providers: [UserQuizAttemptsService],
})
export class UserQuizAttemptsModule {}
