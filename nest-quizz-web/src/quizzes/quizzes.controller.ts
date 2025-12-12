import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
  Req,
} from '@nestjs/common';
import { QuizzesService } from './quizzes.service';
import { CreateQuizDto } from './dto/create-quiz.dto';
import { UpdateQuizDto } from './dto/update-quiz.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { mustHaveRole } from '../auth/role-check.util';

@UseGuards(JwtAuthGuard)
@Controller('quizzes')
export class QuizzesController {
  constructor(private readonly quizzesService: QuizzesService) {}

  // ADMIN o DOCENTE crean
  @Post()
  create(@Body() dto: CreateQuizDto, @Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE']);
    return this.quizzesService.create(dto, req.user.id);
  }

  // Todos logueados ven
  @Get()
  findAll(@Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE', 'ESTUDIANTE']);
    return this.quizzesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string, @Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE', 'ESTUDIANTE']);
    return this.quizzesService.findOne(+id);
  }

  // ADMIN o DOCENTE editan
  @Patch(':id')
  update(@Param('id') id: string, @Body() dto: UpdateQuizDto, @Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE']);
    return this.quizzesService.update(+id, dto);
  }

  // Solo ADMIN elimina
  @Delete(':id')
  remove(@Param('id') id: string, @Req() req) {
    mustHaveRole(req.user, ['ADMIN']);
    return this.quizzesService.remove(+id);
  }
}
