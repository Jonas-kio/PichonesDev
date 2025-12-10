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
import { QuestionsService } from './questions.service';
import { CreateQuestionDto } from './dto/create-question.dto';
import { UpdateQuestionDto } from './dto/update-question.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { mustHaveRole } from '../auth/role-check.util';

@UseGuards(JwtAuthGuard)
@Controller('questions')
export class QuestionsController {
  constructor(private readonly questionsService: QuestionsService) {}

  // Crear pregunta → ADMIN o DOCENTE
  @Post()
  create(@Body() dto: CreateQuestionDto, @Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE']);
    return this.questionsService.create(dto, req.user.id);
  }

  // Listar preguntas → ADMIN y DOCENTE (banco de preguntas)
  @Get()
  findAll(@Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE']);
    return this.questionsService.findAll();
  }

  // Ver detalle → ADMIN y DOCENTE
  @Get(':id')
  findOne(@Param('id') id: string, @Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE']);
    return this.questionsService.findOne(+id);
  }

  // Actualizar → ADMIN o DOCENTE
  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() dto: UpdateQuestionDto,
    @Req() req,
  ) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE']);
    return this.questionsService.update(+id, dto);
  }

  // Eliminar (soft delete) → solo ADMIN
  @Delete(':id')
  remove(@Param('id') id: string, @Req() req) {
    mustHaveRole(req.user, ['ADMIN']);
    return this.questionsService.remove(+id);
  }
}
