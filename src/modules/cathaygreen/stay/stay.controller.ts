import { Controller, Get, Post, Body, Param } from '@nestjs/common';
import { StayService } from './stay.service';
import { CreateStayDto } from './dto/create-stay.dto';

@Controller('stay')
export class StayController {
  constructor(private readonly stayService: StayService) {}

  @Post()
  create(@Body() createStayDto: CreateStayDto) {
    return this.stayService.create(createStayDto);
  }

  @Get('reserve/:id')
  researve(@Param('id') id: string) {
    return this.stayService.reserve(+id);
  }
}
