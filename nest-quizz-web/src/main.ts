// src/main.ts
import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import {
  FastifyAdapter,
  NestFastifyApplication,
} from '@nestjs/platform-fastify';
import * as fs from 'fs';
import * as path from 'path';

async function bootstrap() {
  
  const certDir = path.join(__dirname, '..', 'cert');
  const keyPath = path.join(certDir, 'key.pem');
  const certPath = path.join(certDir, 'cert.pem');

 
  const fastifyAdapter = new FastifyAdapter({
    http2: true, 
    https: {
      allowHTTP1: true, 
      key: fs.readFileSync(keyPath),
      cert: fs.readFileSync(certPath),
    },
  });

  const app = await NestFactory.create<NestFastifyApplication>(
    AppModule,
    fastifyAdapter,
  );

  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
    }),
  );

  await app.listen(Number(process.env.PORT) || 3000, '0.0.0.0');
  console.log('🚀 HTTP/2 + HTTPS en https://localhost:3000');
}

bootstrap();
