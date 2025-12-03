import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule } from '@nestjs/config';

import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { QuestionsModule } from './questions/questions.module';
import { AnswersModule } from './answers/answers.module';
import { CategoriesModule } from './categories/categories.module';


@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: '.env',
    }),

    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DB_HOST,
      port: Number(process.env.DB_PORT),
      username: process.env.DB_USERNAME,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_DATABASE,
      autoLoadEntities: true,
      synchronize: process.env.DB_SYNC === 'true',
      logging: process.env.DB_LOGGING === 'true',
    }),
  ],
      synchronize: false, 

      logging: true, 
    }),

    
    UsersModule,
    QuestionsModule,
    AnswersModule,
    CategoriesModule,
    AuthModule,

  ],

  controllers: [],
  providers: [],
})
export class AppModule {}
