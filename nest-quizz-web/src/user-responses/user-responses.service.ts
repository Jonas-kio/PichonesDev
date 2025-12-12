import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

import { UserResponse } from './entities/user-response.entity';
import { CreateUserResponseDto } from './dto/create-user-response.dto';
import { UpdateUserResponseDto } from './dto/update-user-response.dto';
import { UserQuizAttempt } from '../user-quiz-attempts/entities/user-quiz-attempt.entity';

@Injectable()
export class UserResponsesService {
  constructor(
    @InjectRepository(UserResponse)
    private readonly responseRepo: Repository<UserResponse>,

    @InjectRepository(UserQuizAttempt)
    private readonly attemptRepo: Repository<UserQuizAttempt>,
  ) {}

  async create(dto: CreateUserResponseDto) {
    // validar que el intento exista
    const intento = await this.attemptRepo.findOne({
      where: { id: dto.idIntento },
    });

    if (!intento) {
      throw new NotFoundException('Intento no encontrado');
    }

    const response = this.responseRepo.create({
      idIntento: dto.idIntento,
      idPregunta: dto.idPregunta,
      respuesta: dto.respuesta ?? null,
      fechaRespuesta: new Date(),
    });

    return await this.responseRepo.save(response);
  }

  async findByAttempt(idIntento: number) {
    return await this.responseRepo.find({
      where: { idIntento },
    });
  }

  async update(id: number, dto: UpdateUserResponseDto) {
    const response = await this.responseRepo.findOne({ where: { id } });
    if (!response) throw new NotFoundException('Respuesta no encontrada');

    Object.assign(response, dto);
    return await this.responseRepo.save(response);
  }

  async remove(id: number) {
    const response = await this.responseRepo.findOne({ where: { id } });
    if (!response) throw new NotFoundException('Respuesta no encontrada');

    return await this.responseRepo.remove(response);
  }
}
