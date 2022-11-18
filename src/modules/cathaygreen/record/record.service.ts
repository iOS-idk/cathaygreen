import { CreateRecordDto } from './dto/create-record.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Injectable } from '@nestjs/common';
import { Record } from './entities/record.entity';
import { RecordType } from '../enums';
import { Repository } from 'typeorm';

@Injectable()
export class RecordService {
  constructor(
    @InjectRepository(Record)
    private recordRepo: Repository<Record>,
  ) {}

  create(createRecordDto: CreateRecordDto): Promise<Record> {
    const record = this.recordRepo.create(createRecordDto);

    return this.recordRepo.save(record);
  }

  findAll(type: RecordType): Promise<Record[]> {
    const records = this.recordRepo.findBy({ type });

    return records;
  }

  async getScore(): Promise<number> {
    const records = await this.recordRepo.find();
    // Sum all records of miles
    const score = records.reduce((acc, record) => acc + record.mile, 0);

    return score;
  }
}
