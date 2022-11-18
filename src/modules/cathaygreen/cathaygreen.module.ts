import { CathaygreenController } from './cathaygreen.controller';
import { CathaygreenService } from './cathaygreen.service';
import { ExploreModule } from './explore/explore.module';
import { Module } from '@nestjs/common';
import { RecordModule } from './record/record.module';
import { ShopModule } from './shop/shop.module';
import { StayModule } from './stay/stay.module';
import { EatModule } from './eat/eat.module';

@Module({
  controllers: [CathaygreenController],
  providers: [CathaygreenService],
  imports: [StayModule, ExploreModule, ShopModule, RecordModule, EatModule],
})
export class CathaygreenModule {}
