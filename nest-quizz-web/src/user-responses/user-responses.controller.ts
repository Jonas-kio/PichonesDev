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

import { UserResponsesService } from './user-responses.service';
import { CreateUserResponseDto } from './dto/create-user-response.dto';
import { UpdateUserResponseDto } from './dto/update-user-response.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { mustHaveRole } from '../auth/role-check.util';

@UseGuards(JwtAuthGuard)
@Controller('user-responses')
export class UserResponsesController {
  constructor(private readonly service: UserResponsesService) {}

  // ESTUDIANTE responde preguntas
  @Post()
  create(@Body() dto: CreateUserResponseDto, @Req() req) {
    mustHaveRole(req.user, ['ESTUDIANTE']);
    return this.service.create(dto);
  }

  // Ver respuestas de un intento
  @Get('attempt/:id')
  findByAttempt(@Param('id') id: string, @Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE', 'ESTUDIANTE']);
    return this.service.findByAttempt(+id);
  }

  // Actualizar respuesta (si cambió)
  @Patch(':id')
  update(@Param('id') id: string, @Body() dto: UpdateUserResponseDto, @Req() req) {
    mustHaveRole(req.user, ['ESTUDIANTE']);
    return this.service.update(+id, dto);
  }

  // ADMIN borra
  @Delete(':id')
  remove(@Param('id') id: string, @Req() req) {
    mustHaveRole(req.user, ['ADMIN']);
    return this.service.remove(+id);
  }
}
