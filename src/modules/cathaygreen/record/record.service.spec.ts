import { RecordService } from './record.service';
import { Test, TestingModule } from '@nestjs/testing';

describe('RecordService', () => {
  let service: RecordService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [RecordService],
    }).compile();

    service = module.get<RecordService>(RecordService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
