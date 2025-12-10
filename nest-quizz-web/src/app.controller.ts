import { Controller, Get } from '@nestjs/common';

@Controller()
export class AppController {
  @Get()
  getRoot() {
    return {
      ok: true,
      message: 'API Quizz corriendo ✅ (HTTP/2 + HTTPS)',
    };
  }
}
