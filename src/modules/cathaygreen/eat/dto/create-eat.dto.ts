import { ApiProperty } from '@nestjs/swagger';
import {
  IsEnum,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsString,
} from 'class-validator';
import { Meal } from '../../enums';

export class CreateEatDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  name: string;

  @IsEnum(Meal)
  @IsNotEmpty()
  @ApiProperty()
  meal: Meal;

  @IsString()
  @IsOptional()
  @ApiProperty()
  image: string;

  @IsNumber()
  @IsOptional()
  @ApiProperty()
  mile: number;
}
