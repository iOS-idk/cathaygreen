import { Test, TestingModule } from '@nestjs/testing';
import { CathaygreenController } from './cathaygreen.controller';
import { CathaygreenService } from './cathaygreen.service';

describe('CathaygreenController', () => {
  let controller: CathaygreenController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CathaygreenController],
      providers: [CathaygreenService],
    }).compile();

    controller = module.get<CathaygreenController>(CathaygreenController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
