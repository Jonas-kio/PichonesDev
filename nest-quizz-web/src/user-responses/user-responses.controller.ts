import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { UserResponsesService } from './user-responses.service';
import { CreateUserResponseDto } from './dto/create-user-response.dto';
import { UpdateUserResponseDto } from './dto/update-user-response.dto';

@Controller('user-responses')
export class UserResponsesController {
  constructor(private readonly userResponsesService: UserResponsesService) {}

  @Post()
  create(@Body() createUserResponseDto: CreateUserResponseDto) {
    return this.userResponsesService.create(createUserResponseDto);
  }

  @Get()
  findAll() {
    return this.userResponsesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.userResponsesService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateUserResponseDto: UpdateUserResponseDto) {
    return this.userResponsesService.update(+id, updateUserResponseDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.userResponsesService.remove(+id);
  }
}
