import { Router } from 'express';
import { getAllUsers } from '../controller';

const userRouter = Router();

userRouter.get('/users', getAllUsers);

export default userRouter;
