import { INestApplication } from '@nestjs/common';

export const initialize = (app: INestApplication) => {
  app.enableVersioning();

  // Enable CORS by default because Swagger UI required
  app.enableCors();

  app.setGlobalPrefix(process.env.BASE_PATH);
};
