import { Test, TestingModule } from '@nestjs/testing';
import { EatController } from './eat.controller';
import { EatService } from './eat.service';

describe('EatController', () => {
  let controller: EatController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [EatController],
      providers: [EatService],
    }).compile();

    controller = module.get<EatController>(EatController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
