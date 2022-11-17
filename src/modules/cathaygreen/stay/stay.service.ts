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

  async reserve(id: number) {
    const stay = await this.stayRepo.findOneBy({ id });
    const record = this.recordService.create({
      type: RecordType.STAY,
      refId: stay.id,
      mile: stay.mile,
    });
    return record;
  }

  create(createStayDto: CreateStayDto): Promise<Stay> {
    const stay = this.stayRepo.create(createStayDto);
    return this.stayRepo.save(stay);
  }
}
