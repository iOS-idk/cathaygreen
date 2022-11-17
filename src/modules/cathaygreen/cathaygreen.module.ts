import { Module } from '@nestjs/common';
import { CathaygreenService } from './cathaygreen.service';
import { CathaygreenController } from './cathaygreen.controller';
import { StayModule } from './stay/stay.module';

@Module({
  controllers: [CathaygreenController],
  providers: [CathaygreenService],
  imports: [StayModule],
})
export class CathaygreenModule {}
