import {
  Column,
  CreateDateColumn,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

export class Stay {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'varchar', length: 255 })
  name: string;

  @Column({ nullable: true })
  description: string;

  @Column({ type: 'number', default: 1000 })
  price: number;

  @Column()
  location: string;

  @Column({ type: 'varchar2', length: 1000, nullable: true })
  image: string;

  @Column({ type: 'number', default: 30 })
  mile: number;

  @CreateDateColumn({ type: 'timestamp' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedAt: Date;
}
