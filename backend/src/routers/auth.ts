import { Router } from 'express';
import { login } from '../controller';

const authRouter = Router();

authRouter.post('/login', login);

export default authRouter;
