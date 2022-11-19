import * as Joi from 'joi';
import { ConfigModuleOptions } from '@nestjs/config';
import { NodeEnv } from '@common/enums';
import {
  TypeOrmModuleAsyncOptions,
  TypeOrmModuleOptions,
} from '@nestjs/typeorm';
// import path from 'path';
import path from 'path';

export class AppConfig {
  public static getInitConifg(): ConfigModuleOptions {
    const validNodeEnvList = Object.keys(NodeEnv).map((key) => NodeEnv[key]);
    const validDBTypeList = [
      'mysql',
      'mariadb',
      'postgres',
      'cockroachdb',
      'sqlite',
      'mssql',
      'sap',
      'oracle',
      'cordova',
      'nativescript',
      'react-native',
      'sqljs',
      'mongodb',
      'aurora-data-api',
      'aurora-data-api-pg',
      'expo',
      'better-sqlite3',
      'capacitor',
    ];

    return {
      isGlobal: true,
      validationSchema: Joi.object({
        PORT: Joi.number().min(1).max(65535),
        NODE_ENV: Joi.string().valid(...validNodeEnvList),
        BASE_BATH: Joi.string().allow('').optional(),

        DB_TYPE: Joi.string()
          .valid(...validDBTypeList)
          .required(),
        DB_HOST: Joi.string().required(),
        DB_PORT: Joi.number().min(1).max(65535).required(),
        DB_USERNAME: Joi.string().required(),
        DB_PASSWORD: Joi.string().allow('').required(),
        DB_NAME: Joi.string().allow(''),
      }),
    };
  }

  public static getTypeOrmConfig(): TypeOrmModuleAsyncOptions {
    const migrationsDir = path.join(__dirname, '../', 'database', 'migrations');
    const {
      DB_TYPE,
      DB_HOST,
      DB_PORT,
      DB_USERNAME,
      DB_PASSWORD,
      DB_NAME,
      NODE_ENV,
    } = process.env;
    return {
      useFactory: (): TypeOrmModuleOptions => {
        // if (logger) logger.setContext(TypeOrmModule.name);
        return {
          type: DB_TYPE as any,
          host: DB_HOST,
          port: Number(DB_PORT),
          username: DB_USERNAME,
          password: DB_PASSWORD,
          database: DB_NAME,
          synchronize: NODE_ENV === NodeEnv.LOCAL,
          // entities: ['src/modules/**/*.entity.{ts,js}'],
          // migrations: ['src/database/migrations/*.migration.{ts,js}'],
          entities: [path.join(__dirname, '../modules/**/*.entity.{ts,js}')],
          migrations: [
            path.join(__dirname, migrationsDir, '*.migration.{ts,js}'),
          ],
          retryAttempts: Infinity,
          retryDelay: 10 * 1000,
          // cli: {
          //   entitiesDir: path.join('src', entitiesDir),
          //   migrationsDir: path.join('src', migrationsDir),
          //   subscribersDir: path.join('src', subscribersDir),
          // },
          extra: {
            // For SQL Server that has self signed certificate error, enable below setting
            // trustServerCertificate: true,
          },
        };
      },
      inject: [],
    };
  }
}
