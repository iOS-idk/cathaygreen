import { Explore } from './entities/explore.entity';
import { ExploreController } from './explore.controller';
import { ExploreService } from './explore.service';
import { Module } from '@nestjs/common';
import { RecordModule } from '../record/record.module';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([Explore]), RecordModule],
  controllers: [ExploreController],
  providers: [ExploreService],
  exports: [ExploreService],
})
export class ExploreModule {}
