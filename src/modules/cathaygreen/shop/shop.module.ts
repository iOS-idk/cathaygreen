import { Module } from '@nestjs/common';
import { RecordModule } from '../record/record.module';
import { Shop } from './entities/shop.entity';
import { ShopController } from './shop.controller';
import { ShopService } from './shop.service';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([Shop]), RecordModule],
  controllers: [ShopController],
  providers: [ShopService],
})
export class ShopModule {}
