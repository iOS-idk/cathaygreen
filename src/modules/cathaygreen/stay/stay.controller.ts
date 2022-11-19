import { ApiTags } from '@nestjs/swagger';
import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { CreateStayDto } from './dto/create-stay.dto';
import { Record } from '../record/entities/record.entity';
import { Stay } from './entities/stay.entity';
import { StayService } from './stay.service';
@ApiTags('Stay')
@Controller('stay')
export class StayController {
  constructor(private readonly stayService: StayService) {}

  @Post()
  create(@Body() createStayDto: CreateStayDto): Promise<Stay> {
    return this.stayService.create(createStayDto);
  }

  @Get()
  findAll() {
    return this.stayService.findAll();
  }

  @Get('records')
  findAllRecords(): Promise<Record[]> {
    return this.stayService.findAllRecords();
  }

  @Get('reserve/:id')
  reserve(@Param('id') id: string): Promise<Record> {
    return this.stayService.reserve(+id);
  }
}
