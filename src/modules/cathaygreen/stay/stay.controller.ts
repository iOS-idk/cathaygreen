import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { CreateStayDto } from './dto/create-stay.dto';
import { StayService } from './stay.service';

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
