import { ApiTags } from '@nestjs/swagger';
import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { CreateExploreDto } from './dto/create-explore.dto';
import { ExploreService } from './explore.service';

@ApiTags('Explore')
@Controller('explore')
export class ExploreController {
  constructor(private readonly exploreService: ExploreService) {}

  @Post()
  create(@Body() createExploreDto: CreateExploreDto) {
    return this.exploreService.create(createExploreDto);
  }

  @Get()
  findAll() {
    return this.exploreService.findAll();
  }

  @Get('records')
  findAllRecords() {
    return this.exploreService.findAllRecords();
  }
  @Get('reserve/:id')
  reserve(@Param('id') id: string) {
    return this.exploreService.reserve(+id);
  }
}
