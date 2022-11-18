import { Eat } from './entities/eat.entity';
import { EatController } from './eat.controller';
import { EatService } from './eat.service';
import { Module } from '@nestjs/common';
import { RecordModule } from '../record/record.module';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([Eat]), RecordModule],
  controllers: [EatController],
  providers: [EatService],
})
export class EatModule {}
