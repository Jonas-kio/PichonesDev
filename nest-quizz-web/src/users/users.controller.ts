// src/users/users.controller.ts
import {
  Controller,
  Get,
  Post,
  Patch,
  Delete,
  Body,
  Param,
  UseGuards,
  Req,
} from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { mustHaveRole } from '../auth/role-check.util';

@UseGuards(JwtAuthGuard) // todo el controller requiere estar logueado
@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  // Solo ADMIN crea usuarios
  @Post()
  create(@Body() dto: CreateUserDto, @Req() req) {
    mustHaveRole(req.user, ['ADMIN']);
    return this.usersService.create(dto);
  }

  // Solo ADMIN lista todos los usuarios
  @Get()
  findAll(@Req() req) {
    mustHaveRole(req.user, ['ADMIN']);
    return this.usersService.findAll();
  }

  // Solo ADMIN ve un usuario por id
  @Get(':id')
  findOne(@Param('id') id: string, @Req() req) {
    mustHaveRole(req.user, ['ADMIN']);
    return this.usersService.findOne(+id);
  }

  // Solo ADMIN actualiza usuarios
  @Patch(':id')
  update(@Param('id') id: string, @Body() dto: UpdateUserDto, @Req() req) {
    mustHaveRole(req.user, ['ADMIN']);
    return this.usersService.update(+id, dto);
  }

  // Solo ADMIN elimina usuarios
  @Delete(':id')
  remove(@Param('id') id: string, @Req() req) {
    mustHaveRole(req.user, ['ADMIN']);
    return this.usersService.remove(+id);
  }
}
