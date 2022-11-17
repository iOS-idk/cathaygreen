import { Module } from '@nestjs/common';
import { RecordModule } from '../record/record.module';
import { Stay } from './entities/stay.entity';
import { StayController } from './stay.controller';
import { StayService } from './stay.service';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([Stay]), RecordModule],
  controllers: [StayController],
  providers: [StayService],
  exports: [StayService],
})
export class StayModule {}
