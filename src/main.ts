import { NestFactory } from '@nestjs/core';
import { AppModule } from '@mod/app/app.module';
import { initialize } from '@util/helper';
const { PORT } = process.env;

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  initialize(app);

  await app.listen(PORT);
}
bootstrap();
