import { IsEnum, IsNotEmpty, IsNumber, IsOptional } from 'class-validator';
import { RecordType } from '../../enums';

export class CreateRecordDto {
  @IsEnum(RecordType)
  @IsNotEmpty()
  readonly type: RecordType;

  @IsNumber()
  @IsOptional()
  readonly refId: number;

  @IsNumber()
  @IsOptional()
  readonly mile: number;
}
