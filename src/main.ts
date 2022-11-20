import { AppModule } from '@mod/app/app.module';
import { NestFactory } from '@nestjs/core';
import { initialize, setupSwagger } from '@util/helper';
const { PORT } = process.env;

async function bootstrap() {
  process.setMaxListeners(0);
  const app = await NestFactory.create(AppModule);
  initialize(app);
  setupSwagger(app);

  await app.listen(PORT);
}
bootstrap();
