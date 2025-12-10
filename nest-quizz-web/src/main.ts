import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as fs from 'fs';

async function bootstrap() {
  const httpsOptions = {
    allowHTTP1: true, //permite que navegadores viejos usen HTTP1, pero activa HTTP/2 si es posible
    key: fs.readFileSync('cert/key.pem'),
    cert: fs.readFileSync('cert/cert.pem'),
  };

  const app = await NestFactory.create(AppModule, {
    httpsOptions,
    http2: true, //Activa HTTP/2
  });

  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
    }),
  );

  await app.listen(process.env.PORT || 3000);
  console.log('🚀 Servidor corriendo con HTTP/2 en https://localhost:3000');
}

bootstrap();
