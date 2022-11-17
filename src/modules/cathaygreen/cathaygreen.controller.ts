import { Controller } from '@nestjs/common';
import { CathaygreenService } from './cathaygreen.service';

@Controller('cathaygreen')
export class CathaygreenController {
  constructor(private readonly cathaygreenService: CathaygreenService) {}
}
