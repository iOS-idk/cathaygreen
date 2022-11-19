import { ApiTags } from '@nestjs/swagger';
import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { CreateEatDto } from './dto/create-eat.dto';
import { EatService } from './eat.service';
import { Meal } from '../enums';

@ApiTags('Eat')
@Controller('eat')
export class EatController {
  constructor(private readonly eatService: EatService) {}

  @Post()
  create(@Body() createEatDto: CreateEatDto) {
    return this.eatService.create(createEatDto);
  }

  @Get()
  findAll() {
    return this.eatService.findAll();
  }

  @Get('records')
  findAllRecords() {
    return this.eatService.findAllRecords();
  }

  @Get(':meal')
  findAllMeal(@Param('meal') meal: Meal) {
    return this.eatService.findAllMeal(meal);
  }

  @Get('reserve/:id')
  reserve(@Param('id') id: string) {
    return this.eatService.reserve(+id);
  }
}
