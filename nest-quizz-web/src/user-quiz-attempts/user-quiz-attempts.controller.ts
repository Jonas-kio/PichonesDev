import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';

import { UserQuizAttemptsService } from './user-quiz-attempts.service';
import { CreateUserQuizAttemptDto } from './dto/create-user-quiz-attempt.dto';
import { UpdateUserQuizAttemptDto } from './dto/update-user-quiz-attempt.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { mustHaveRole } from '../auth/role-check.util';

@UseGuards(JwtAuthGuard)
@Controller('user-quiz-attempts')
export class UserQuizAttemptsController {
  constructor(private readonly service: UserQuizAttemptsService) {}

  // ESTUDIANTE crea su intento
  @Post()
  create(@Body() dto: CreateUserQuizAttemptDto, @Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE', 'ESTUDIANTE']);
    return this.service.create(dto, req.user.id);
  }

  // ADMIN/DOCENTE ven todos
  @Get()
  findAll(@Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE']);
    return this.service.findAll();
  }

  // Usuario ve sus intentos
  @Get('mine')
  findMine(@Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE', 'ESTUDIANTE']);
    return this.service.findMine(req.user.id);
  }

  @Get(':id')
  findOne(@Param('id') id: string, @Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE']);
    return this.service.findOne(+id);
  }

  // finalizar o cancelar intento
  @Patch(':id')
  update(@Param('id') id: string, @Body() dto: UpdateUserQuizAttemptDto, @Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE', 'ESTUDIANTE']);
    return this.service.update(+id, dto);
  }

  // solo ADMIN borra
  @Delete(':id')
  remove(@Param('id') id: string, @Req() req) {
    mustHaveRole(req.user, ['ADMIN']);
    return this.service.remove(+id);
  }
}
