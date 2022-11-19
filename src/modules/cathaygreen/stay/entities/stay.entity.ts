import {
  Column,
  CreateDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity()
export class Stay {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'varchar', length: 255 })
  name: string;

  @Column({ nullable: true })
  description: string;

  @Column({ type: 'int', default: 1000 })
  price: number;

  @Column()
  location: string;

  @Column({ type: 'varchar', length: 1000, nullable: true })
  image: string;

  @Column({ type: 'int', default: 30 })
  mile: number;

  @CreateDateColumn({ type: 'timestamp' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedAt: Date;
}