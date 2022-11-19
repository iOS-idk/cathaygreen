import { DataSource } from 'typeorm';
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
  entities: [__dirname + '/../modules/**/*.entity.{ts,js}'],
  migrations: ['src/database/migrations/*.{ts,js}'],
});
