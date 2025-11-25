import { Injectable } from '@nestjs/common';
import { CreateUserQuizAttemptDto } from './dto/create-user-quiz-attempt.dto';
import { UpdateUserQuizAttemptDto } from './dto/update-user-quiz-attempt.dto';

@Injectable()
export class UserQuizAttemptsService {
  create(createUserQuizAttemptDto: CreateUserQuizAttemptDto) {
    return 'This action adds a new userQuizAttempt';
  }

  findAll() {
    return `This action returns all userQuizAttempts`;
  }

  findOne(id: number) {
    return `This action returns a #${id} userQuizAttempt`;
  }

  update(id: number, updateUserQuizAttemptDto: UpdateUserQuizAttemptDto) {
    return `This action updates a #${id} userQuizAttempt`;
  }

  remove(id: number) {
    return `This action removes a #${id} userQuizAttempt`;
  }
}
