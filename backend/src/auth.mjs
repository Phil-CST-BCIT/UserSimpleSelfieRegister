import { Router } from 'express';
import { ExpressAuth } from '@auth/express';
import Credentials from '@auth/express/providers/credentials';

const authRouter = Router();

authRouter.post(
  '/login',
  ExpressAuth({
    providers: [
      Credentials({
        credentials: {
          username: {},
          password: {},
        },
        authorize: async (credentials) => {
          return credentials.username === 'admin' && credentials.password === 'admin';
        },
      }),
    ],
  })
);

authRouter.post('/logout', (req, res) => {
  res.send('logout!');
});

export default authRouter;
