import express from 'express';
import authRouter from './auth.mjs';

const port = 3000;
const app = express();

app.use(express.urlencoded());
app.use(express.json());
app.use('/auth', authRouter, (req, res, next) => {});

app.get('/', (req, res) => {
  res.send('Hello');
});

app.listen(port);
