import { CreateStayDto } from './dto/create-stay.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Injectable } from '@nestjs/common';
import { RecordService } from '../record/record.service';
import { RecordType } from '../enums';
import { Repository } from 'typeorm';
import { Stay } from './entities/stay.entity';

@Injectable()
export class StayService {
  constructor(
    @InjectRepository(Stay)
    private stayRepo: Repository<Stay>,
    private readonly recordService: RecordService,
  ) {}

  private recordType = RecordType.STAY;

  create(createStayDto: CreateStayDto): Promise<Stay> {
    const stay = this.stayRepo.create(createStayDto);
    return this.stayRepo.save(stay);
  }

  async findAll() {
    const stays = await this.stayRepo.find();
    return stays;
  }

  async findAllRecords() {
    return this.recordService.findAll(this.recordType);
  }

  async reserve(id: number) {
    const stay = await this.stayRepo.findOneBy({ id });
    const record = this.recordService.create({
      type: this.recordType,
      refId: stay.id,
      mile: stay.mile,
    });
    return record;
  }

  async remove(id: number) {
    const stay = await this.stayRepo.findOneBy({ id });
    await this.stayRepo.remove(stay);
  }
}
