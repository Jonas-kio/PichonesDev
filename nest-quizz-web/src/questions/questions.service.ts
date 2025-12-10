import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

import { Question } from './entities/question.entity';
import { CreateQuestionDto } from './dto/create-question.dto';
import { UpdateQuestionDto } from './dto/update-question.dto';

@Injectable()
export class QuestionsService {
  constructor(
    @InjectRepository(Question)
    private readonly questionRepo: Repository<Question>,
  ) {}

  async create(dto: CreateQuestionDto, userId: number) {
    const now = new Date();

    const question = this.questionRepo.create({
      idSubcategoria: dto.idSubcategoria ?? null,
      idRangoEdad: dto.idRangoEdad ?? null,
      idDificultad: dto.idDificultad ?? null,
      idEstado: dto.idEstado ?? null,
      tipoPregunta: dto.tipoPregunta ?? null,
      tituloPregunta: dto.tituloPregunta,
      idContenidoPregunta: dto.idContenidoPregunta ?? null,
      puntosRecomendados: dto.puntosRecomendados ?? null,
      tiempoEstimado: dto.tiempoEstimado ?? null,
      explicacion: dto.explicacion ?? null,
      fechaCreacion: now,
      fechaModificacion: now,
      creadoPorId: userId,
      activa: true,
    });

    return await this.questionRepo.save(question);
  }

  async findAll() {
    return await this.questionRepo.find({
      where: { activa: true },
      order: { id: 'ASC' },
    });
  }

  async findOne(id: number) {
    const question = await this.questionRepo.findOne({
      where: { id, activa: true },
    });

    if (!question) {
      throw new NotFoundException('Pregunta no encontrada');
    }

    return question;
  }

  async update(id: number, dto: UpdateQuestionDto) {
    const question = await this.findOne(id);

    Object.assign(question, {
      idSubcategoria: dto.idSubcategoria ?? question.idSubcategoria,
      idRangoEdad: dto.idRangoEdad ?? question.idRangoEdad,
      idDificultad: dto.idDificultad ?? question.idDificultad,
      idEstado: dto.idEstado ?? question.idEstado,
      tipoPregunta: dto.tipoPregunta ?? question.tipoPregunta,
      tituloPregunta: dto.tituloPregunta ?? question.tituloPregunta,
      idContenidoPregunta: dto.idContenidoPregunta ?? question.idContenidoPregunta,
      puntosRecomendados: dto.puntosRecomendados ?? question.puntosRecomendados,
      tiempoEstimado: dto.tiempoEstimado ?? question.tiempoEstimado,
      explicacion: dto.explicacion ?? question.explicacion,
      fechaModificacion: new Date(),
    });

    return await this.questionRepo.save(question);
  }

  async remove(id: number) {
    const question = await this.findOne(id);
    question.activa = false;
    question.fechaModificacion = new Date();
    return await this.questionRepo.save(question);
  }
}
