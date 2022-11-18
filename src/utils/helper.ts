import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { INestApplication } from '@nestjs/common';

export const initialize = (app: INestApplication) => {
  app.enableVersioning();

  // Enable CORS by default because Swagger UI required
  app.enableCors();

  app.setGlobalPrefix(process.env.BASE_PATH);
};

export function setupSwagger(app: INestApplication) {
  const builder = new DocumentBuilder();
  const config = builder
    .setTitle('TodoList')
    .setDescription('This is a basic Swagger document.')
    .setVersion('1.0')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);
}
