import { Request, Response } from 'express';
import { MyDataSource } from './data-source';
import { User } from './entity/User';

export function login(req: Request, res: Response) {
  const { username, password } = req.body;
  if (username === 'admin' && password === 'admin') {
    res.status(200).json({ message: 'success' });
  } else {
    res.status(400).json({ message: 'wrong credential' });
  }
}

export async function getAllUsers(_: Request, res: Response) {
  const repo = MyDataSource.getRepository(User);
  const users = await repo.find();
  res.json(users);
}
