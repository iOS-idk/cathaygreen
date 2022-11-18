import { ApiTags } from '@nestjs/swagger';
import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { CreateShopDto } from './dto/create-shop.dto';
import { ShopService } from './shop.service';

@ApiTags('Shop')
@Controller('shop')
export class ShopController {
  constructor(private readonly shopService: ShopService) {}

  @Post()
  create(@Body() createShopDto: CreateShopDto) {
    return this.shopService.create(createShopDto);
  }

  @Get('records')
  findAllRecords() {
    return this.shopService.findAllRecords();
  }
  @Get('reserve/:id')
  reserve(@Param('id') id: string) {
    return this.shopService.reserve(+id);
  }
}
