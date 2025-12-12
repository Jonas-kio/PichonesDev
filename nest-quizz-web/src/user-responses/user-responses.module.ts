import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { UserResponse } from './entities/user-response.entity';
import { UserResponsesService } from './user-responses.service';
import { UserResponsesController } from './user-responses.controller';
import { UserQuizAttempt } from '../user-quiz-attempts/entities/user-quiz-attempt.entity';

@Module({
  imports: [TypeOrmModule.forFeature([UserResponse, UserQuizAttempt])],
  controllers: [UserResponsesController],
  providers: [UserResponsesService],
})
export class UserResponsesModule {}
