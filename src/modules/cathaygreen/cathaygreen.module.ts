import { Module } from '@nestjs/common';
import { CathaygreenService } from './cathaygreen.service';
import { CathaygreenController } from './cathaygreen.controller';
import { StayModule } from './stay/stay.module';
import { RecordModule } from './record/record.module';

@Module({
  controllers: [CathaygreenController],
  providers: [CathaygreenService],
  imports: [StayModule, RecordModule],
})
export class CathaygreenModule {}
