import { DataSource } from 'typeorm';
import { Eat } from '@/modules/cathaygreen/eat/entities/eat.entity';
import { Explore } from '@/modules/cathaygreen/explore/entities/explore.entity';
import { Record } from '@/modules/cathaygreen/record/entities/record.entity';
import { Shop } from '@/modules/cathaygreen/shop/entities/shop.entity';
import { Stay } from '@/modules/cathaygreen/stay/entities/stay.entity';
import { config } from 'dotenv';

config();

const { DB_TYPE, DB_HOST, DB_PORT, DB_USERNAME, DB_PASSWORD, DB_NAME } =
  process.env;

export default new DataSource({
  type: DB_TYPE as any,
  host: DB_HOST,
  port: Number(DB_PORT),
  username: DB_USERNAME,
  password: DB_PASSWORD,
  database: DB_NAME,
  entities: [Record, Stay, Explore, Shop, Eat],
  migrations: ['src/database/migrations/*.{ts,js}'],
});
