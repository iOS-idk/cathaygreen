import {
  Column,
  CreateDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';
import { RecordType } from '../../enums';
@Entity({ name: 'record' })
export class Record {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ enum: RecordType })
  type: RecordType;

  @Column({ type: 'int', default: 0 })
  refId: number;

  @Column({ type: 'int' })
  mile: number;

  @CreateDateColumn({ type: 'timestamp' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedAt: Date;
}
