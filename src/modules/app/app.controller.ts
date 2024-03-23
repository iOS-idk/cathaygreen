import { ApiTags } from '@nestjs/swagger';
import { AppService } from './app.service';
import { Controller, Get } from '@nestjs/common';

@ApiTags('System')
@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('bot')
  bot() {
    return this.appService.bot();
  }
}
