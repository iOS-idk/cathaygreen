import { ResponseInterceptor } from '@/interceptors/response.interceptor';
import { Module, ValidationError, ValidationPipe } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { APP_PIPE, APP_INTERCEPTOR } from '@nestjs/core';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppConfig } from './app.config';
import { AppController } from './app.controller';
import { AppService } from './app.service';

@Module({
  imports: [
    // Validate env variable && use ConfigService globally
    ConfigModule.forRoot(AppConfig.getInitConifg()),
    // Database Module
    TypeOrmModule.forRootAsync(AppConfig.getTypeOrmConfig()),
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

    { provide: APP_INTERCEPTOR, useClass: ResponseInterceptor },
  ],
})
export class AppModule {}
