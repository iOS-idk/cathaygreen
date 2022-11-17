import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateStayDto } from './dto/create-stay.dto';
import { Stay } from './entities/stay.entity';

@Injectable()
export class StayService {
  constructor(
    @InjectRepository(Stay)
    private stayRepo: Repository<Stay>,
  ) {}

  reserve(id: number) {
    const stay = this.stayRepo.findOneBy({ id });
    return 'This action adds a new stay';
  }

  create(createStayDto: CreateStayDto): Promise<Stay> {
    const stay = this.stayRepo.create(createStayDto);
    return this.stayRepo.save(stay);
  }
}
