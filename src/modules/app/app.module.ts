import { APP_INTERCEPTOR, APP_PIPE } from '@nestjs/core';
import { AppConfig } from './app.config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CathaygreenModule } from '@mod/cathaygreen/cathaygreen.module';
import { ConfigModule } from '@nestjs/config';
import { Module, ValidationError, ValidationPipe } from '@nestjs/common';
import { ResponseInterceptor } from '@/interceptors/response.interceptor';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [
    // Validate env variable && use ConfigService globally
    ConfigModule.forRoot(AppConfig.getInitConifg()),
    // Database Module
    TypeOrmModule.forRootAsync(AppConfig.getTypeOrmConfig()),
    // Other Modules
    CathaygreenModule,
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
