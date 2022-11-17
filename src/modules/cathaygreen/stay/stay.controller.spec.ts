import { Test, TestingModule } from '@nestjs/testing';
import { StayController } from './stay.controller';
import { StayService } from './stay.service';

describe('StayController', () => {
  let controller: StayController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [StayController],
      providers: [StayService],
    }).compile();

    controller = module.get<StayController>(StayController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
