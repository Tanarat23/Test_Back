const express = require('express');
const postRouter = express.Router();
const postController = require('../controllers/post-controller');

postRouter.get('/', postController.getPosts);
postRouter.post('/create', postController.createPost);
postRouter.delete('/:id', postController.deletePost);

module.exports = postRouter;
