import { DataSource } from 'typeorm';
import { User } from './entity/User';

export const MyDataSource = new DataSource({
  type: 'better-sqlite3',
  database: './ussr.db',
  synchronize: true,
  logging: true,
  entities: [User],
});
