const express = require('express');
const cors = require('cors');

const app = express();

const userRouter = require('./routes/user');
const communityRouter = require('./routes/community');
const postCategoryRouter = require('./routes/post_category');
const postRouter = require('./routes/post');

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
// TODO: configure cors
app.use(cors());

// TODO: add your routes here
app.use('/api/user', userRouter);
app.use('/api/community', communityRouter);
app.use('/api/post_category', postCategoryRouter);
app.use('/api/post', postRouter);

module.exports = app;
