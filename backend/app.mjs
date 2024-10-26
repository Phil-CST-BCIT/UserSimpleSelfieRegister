import express from 'express';
const port = 3000;

const app = express();

app.use(express.urlencoded());
app.use(express.json());

app.get('/', (req, res) => {
  res.send('Hello');
});

app.post('/auth', (req, res) => {
  const { username, password } = req?.body;
  res.json({ username, password });
});

app.listen(port);
