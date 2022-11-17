import { Test, TestingModule } from '@nestjs/testing';
import { CathaygreenService } from './cathaygreen.service';

describe('CathaygreenService', () => {
  let service: CathaygreenService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [CathaygreenService],
    }).compile();

    service = module.get<CathaygreenService>(CathaygreenService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
