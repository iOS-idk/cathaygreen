import { ApiProperty } from '@nestjs/swagger';
import { IsEnum, IsNotEmpty, IsNumber, IsOptional } from 'class-validator';
import { RecordType } from '../../enums';

export class CreateRecordDto {
  @IsEnum(RecordType)
  @IsNotEmpty()
  @ApiProperty()
  readonly type: RecordType;

  @IsNumber()
  @IsOptional()
  @ApiProperty()
  readonly refId: number;

  @IsNumber()
  @IsOptional()
  @ApiProperty()
  readonly mile: number;
}
