import 'reflect-metadata';
import express from 'express';
import { type Express } from 'express';
import authRouter from './routers/auth.js';
import userRouter from './routers/user.js';
import { Request, Response } from 'express';
import { MyDataSource } from './data-source.js';

MyDataSource.initialize()
  .then(() => {
    const port: number = 3000;
    const app: Express = express();
    app.use(express.urlencoded());
    app.use(express.json());
    app.use('/auth', authRouter);
    app.use('/api', userRouter);

    app.get('/', (req: Request, res: Response) => {
      res.send('Hello');
    });
    app.listen(port);
  })
  .catch((err) => console.error(err));
