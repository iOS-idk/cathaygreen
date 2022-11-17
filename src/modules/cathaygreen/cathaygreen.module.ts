import { Module } from '@nestjs/common';
import { CathaygreenService } from './cathaygreen.service';
import { CathaygreenController } from './cathaygreen.controller';

@Module({
  controllers: [CathaygreenController],
  providers: [CathaygreenService],
  imports: [],
})
export class CathaygreenModule {}
