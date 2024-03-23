import { APP_PIPE } from '@nestjs/core';
import { AppConfig } from './app.config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { Module, ValidationError, ValidationPipe } from '@nestjs/common';
import { PuppeteerModule } from '../puppeteer';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [
    // Validate env variable && use ConfigService globally
    ConfigModule.forRoot(AppConfig.getInitConifg()),
    // Database Module
    TypeOrmModule.forRootAsync(AppConfig.getTypeOrmConfig()),

    PuppeteerModule.forWorker(
      { pipe: false, headless: true }, // optional, any Puppeteer launch options here or leave empty for good defaults */,
      `Browser-1`, // optional, can be useful for using Chrome and Firefox in the same project
    ),
    // Other Modules
  ],
  controllers: [AppController],
  providers: [
    AppService,
    {
      provide: APP_PIPE,
      useValue: new ValidationPipe({
        exceptionFactory: (errors: ValidationError[]) => {
          return errors[0];
        },
      }),
    },

    // { provide: APP_INTERCEPTOR, useClass: ResponseInterceptor },
  ],
})
export class AppModule {}
