import {Sequelize} from 'sequelize-typescript';
import {config} from './config/config';


export const sequelize = new Sequelize({
  'username': config.username,
  'password': config.password,
  'database': config.database,
  'host': 'postgres.cw9a3mp3kerk.us-east-1.rds.amazonaws.com',

  'dialect': config.dialect,
  'storage': ':memory:',
});
