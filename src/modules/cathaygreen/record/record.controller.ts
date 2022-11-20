import { ApiTags } from '@nestjs/swagger';
import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { CreateRecordDto } from './dto/create-record.dto';
import { RecordService } from './record.service';
import { RecordType } from '../enums';

@ApiTags('Record')
@Controller('record')
export class RecordController {
  constructor(private readonly recordService: RecordService) {}

  @Post()
  create(@Body() createRecordDto: CreateRecordDto) {
    return this.recordService.create(createRecordDto);
  }

  @Get(':type')
  findAll(@Param('type') type: RecordType) {
    return this.recordService.findAll(type);
  }

  @Get('')
  getScore() {
    return this.recordService.getScore();
  }
}