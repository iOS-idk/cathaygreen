import { CreateEatDto } from './dto/create-eat.dto';
import { Eat } from './entities/eat.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Injectable } from '@nestjs/common';
import { Meal, RecordType } from '../enums';
import { RecordService } from '../record/record.service';
import { Repository } from 'typeorm';

@Injectable()
export class EatService {
  constructor(
    @InjectRepository(Eat)
    private eatRepo: Repository<Eat>,
    private readonly recordService: RecordService,
  ) {}
  private recordType = RecordType.EAT;

  create(createEatDto: CreateEatDto) {
    const eat = this.eatRepo.create(createEatDto);
    return this.eatRepo.save(eat);
  }

  async findAll() {
    const eats = await this.eatRepo.find();
    return eats;
  }

  async findAllRecords() {
    return this.recordService.findAll(this.recordType);
  }

  async findAllMeal(meal: Meal) {
    return this.eatRepo.findBy({ meal });
  }

  async reserve(id: number) {
    const eat = await this.eatRepo.findOneBy({ id });
    const record = this.recordService.create({
      type: this.recordType,
      refId: eat.id,
      mile: eat.mile,
    });
    return record;
  }
}
