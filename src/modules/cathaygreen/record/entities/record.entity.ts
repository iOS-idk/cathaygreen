import {
  Column,
  CreateDateColumn,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';
import { RecordType } from '../../enums';

export class Record {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ enum: RecordType })
  type: RecordType;

  @Column({ type: 'number', default: 0 })
  refId: number;

  @Column({ type: 'number' })
  mile: number;

  @CreateDateColumn({ type: 'timestamp' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedAt: Date;
}
