import { CreateExploreDto } from './dto/create-explore.dto';
import { Explore } from './entities/explore.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Injectable } from '@nestjs/common';
import { RecordService } from '../record/record.service';
import { RecordType } from '../enums';
import { Repository } from 'typeorm';

@Injectable()
export class ExploreService {
  constructor(
    @InjectRepository(Explore)
    private exploreRepo: Repository<Explore>,

    private readonly recordService: RecordService,
  ) {}

  private recordType = RecordType.EXPLORE;

  create(createExploreDto: CreateExploreDto): Promise<Explore> {
    const explore = this.exploreRepo.create(createExploreDto);
    return this.exploreRepo.save(explore);
  }

  async findAllRecords() {
    return this.recordService.findAll(this.recordType);
  }

  async reserve(id: number) {
    const explore = await this.exploreRepo.findOneBy({ id });
    const record = this.recordService.create({
      type: this.recordType,
      refId: explore.id,
      mile: explore.mile,
    });
    return record;
  }
}
