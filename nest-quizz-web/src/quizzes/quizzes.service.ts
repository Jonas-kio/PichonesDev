import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

import { Quiz } from './entities/quiz.entity';
import { CreateQuizDto } from './dto/create-quiz.dto';
import { UpdateQuizDto } from './dto/update-quiz.dto';

@Injectable()
export class QuizzesService {
  constructor(
    @InjectRepository(Quiz)
    private readonly quizRepo: Repository<Quiz>,
  ) {}

  async create(dto: CreateQuizDto, usuarioId: number) {
    const quiz = this.quizRepo.create({
      ...dto,
      creadoPor: usuarioId,
      fechaCreacion: new Date(),
      activo: dto.activo ?? true,
    });

    return await this.quizRepo.save(quiz);
  }

  async findAll() {
    return await this.quizRepo.find();
  }

  async findOne(id: number) {
    const quiz = await this.quizRepo.findOne({ where: { id } });
    if (!quiz) throw new NotFoundException('Examen no encontrado');
    return quiz;
  }

  async update(id: number, dto: UpdateQuizDto) {
    const quiz = await this.findOne(id);
    Object.assign(quiz, dto);
    return await this.quizRepo.save(quiz);
  }

  async remove(id: number) {
    const quiz = await this.findOne(id);
    return await this.quizRepo.remove(quiz);
  }
}
