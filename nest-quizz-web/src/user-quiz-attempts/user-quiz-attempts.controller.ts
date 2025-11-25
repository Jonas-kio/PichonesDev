import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { UserQuizAttemptsService } from './user-quiz-attempts.service';
import { CreateUserQuizAttemptDto } from './dto/create-user-quiz-attempt.dto';
import { UpdateUserQuizAttemptDto } from './dto/update-user-quiz-attempt.dto';

@Controller('user-quiz-attempts')
export class UserQuizAttemptsController {
  constructor(private readonly userQuizAttemptsService: UserQuizAttemptsService) {}

  @Post()
  create(@Body() createUserQuizAttemptDto: CreateUserQuizAttemptDto) {
    return this.userQuizAttemptsService.create(createUserQuizAttemptDto);
  }

  @Get()
  findAll() {
    return this.userQuizAttemptsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.userQuizAttemptsService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateUserQuizAttemptDto: UpdateUserQuizAttemptDto) {
    return this.userQuizAttemptsService.update(+id, updateUserQuizAttemptDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.userQuizAttemptsService.remove(+id);
  }
}
