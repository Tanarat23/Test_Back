require('dotenv').config();

const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const app = express();
const postRouter = require('./src/routes/post-route');

app.use(cors());
app.use(morgan('dev'));
app.use(express.json());
app.use('/posts', postRouter);

const PORT = process.env.PORT || 8000;
app.listen(PORT, () => console.log(`Server is running on port:${PORT}`));
