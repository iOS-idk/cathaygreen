import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsNumber, IsOptional, IsString } from 'class-validator';

export class CreateShopDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  name: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  brand: string;

  @IsString()
  @IsOptional()
  @ApiProperty()
  image: string;

  @IsNumber()
  @IsOptional()
  @ApiProperty()
  mile: number;

  @IsNumber()
  @IsOptional()
  @ApiProperty()
  price: number;
}
