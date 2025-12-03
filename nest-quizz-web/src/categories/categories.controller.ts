// src/categories/categories.controller.ts
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
import { CategoriesService } from './categories.service';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { mustHaveRole } from '../auth/role-check.util';

@UseGuards(JwtAuthGuard)
@Controller('categories')
export class CategoriesController {
  constructor(private readonly categoriesService: CategoriesService) {}

  // ADMIN o DOCENTE pueden crear
  @Post()
  create(@Body() dto: CreateCategoryDto, @Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE']);
    return this.categoriesService.create(dto);
  }

  // Cualquiera logueado (ADMIN, DOCENTE, ESTUDIANTE) puede visualizar
  @Get()
  findAll(@Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE', 'ESTUDIANTE']);
    return this.categoriesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string, @Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE', 'ESTUDIANTE']);
    return this.categoriesService.findOne(+id);
  }

  // Solo ADMIN o DOCENTE actualizan
  @Patch(':id')
  update(@Param('id') id: string, @Body() dto: UpdateCategoryDto, @Req() req) {
    mustHaveRole(req.user, ['ADMIN', 'DOCENTE']);
    return this.categoriesService.update(+id, dto);
  }

  // Solo ADMIN elimina
  @Delete(':id')
  remove(@Param('id') id: string, @Req() req) {
    mustHaveRole(req.user, ['ADMIN']);
    return this.categoriesService.remove(+id);
  }
}
