import { ForbiddenException, Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

import { UserQuizAttempt } from './entities/user-quiz-attempt.entity';
import { CreateUserQuizAttemptDto } from './dto/create-user-quiz-attempt.dto';
import { UpdateUserQuizAttemptDto } from './dto/update-user-quiz-attempt.dto';
import { Quiz } from '../quizzes/entities/quiz.entity';

@Injectable()
export class UserQuizAttemptsService {
  constructor(
    @InjectRepository(UserQuizAttempt)
    private readonly intentoRepo: Repository<UserQuizAttempt>,

    @InjectRepository(Quiz)
    private readonly quizRepo: Repository<Quiz>,
  ) {}

  // Crear intento: respeta el limite del quiz
  async create(dto: CreateUserQuizAttemptDto, idUsuario: number) {
    const quiz = await this.quizRepo.findOne({ where: { id: dto.idExamen } });
    if (!quiz) throw new NotFoundException('Examen no encontrado');

    // contar intentos existentes del usuario en ese examen
    const intentosUsados = await this.intentoRepo.count({
      where: { idUsuario, idExamen: dto.idExamen },
    });

    // si el quiz tiene limite, validar
    if (quiz.intentosPermitidos !== null && intentosUsados >= quiz.intentosPermitidos) {
      throw new ForbiddenException('Has alcanzado el límite de intentos para este examen');
    }

    // numeroIntento = intentosUsados + 1
    const intento = this.intentoRepo.create({
      idUsuario,
      idExamen: dto.idExamen,
      numeroIntento: intentosUsados + 1,
      estado: 'EN_PROGRESO',
      fechaInicio: new Date(),
      fechaFin: null,
    });

    return await this.intentoRepo.save(intento);
  }

  async findAll() {
    return await this.intentoRepo.find({
      order: { id: 'DESC' as any },
    });
  }

  async findMine(idUsuario: number) {
    return await this.intentoRepo.find({
      where: { idUsuario },
      order: { id: 'DESC' as any },
    });
  }

  async findOne(id: number) {
    const intento = await this.intentoRepo.findOne({ where: { id } });
    if (!intento) throw new NotFoundException('Intento no encontrado');
    return intento;
  }

  async update(id: number, dto: UpdateUserQuizAttemptDto) {
  const intento = await this.findOne(id);

  if (dto.estado) {
    intento.estado = dto.estado;
    intento.fechaFin = new Date(); 
  }

  return await this.intentoRepo.save(intento);
}


  async remove(id: number) {
    const intento = await this.findOne(id);
    return await this.intentoRepo.remove(intento);
  }
}
