import { CreateShopDto } from './dto/create-shop.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Injectable } from '@nestjs/common';
import { RecordService } from '../record/record.service';
import { RecordType } from '../enums';
import { Repository } from 'typeorm';
import { Shop } from './entities/shop.entity';

@Injectable()
export class ShopService {
  constructor(
    @InjectRepository(Shop)
    private shopRepo: Repository<Shop>,
    private readonly recordService: RecordService,
  ) {}

  private recordType = RecordType.SHOP;

  create(createShopDto: CreateShopDto) {
    const shop = this.shopRepo.create(createShopDto);
    return this.shopRepo.save(shop);
  }

  async findAll() {
    const shops = await this.shopRepo.find();
    return shops;
  }

  async findAllRecords() {
    return this.recordService.findAll(this.recordType);
  }

  async reserve(id: number) {
    const shop = await this.shopRepo.findOneBy({ id });
    const record = this.recordService.create({
      type: this.recordType,
      refId: shop.id,
      mile: shop.mile,
    });
    return record;
  }

  async remove(id: number) {
    const shop = await this.shopRepo.findOneBy({ id });
    await this.shopRepo.remove(shop);
  }
}
