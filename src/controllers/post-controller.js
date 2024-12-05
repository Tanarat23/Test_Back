const prisma = require('../models/prisma');

const postController = {};

postController.getPosts = async (req, res, next) => {
  try {
    const posts = await prisma.documents.findMany();
    res.status(200).json({ posts });
  } catch (error) {
    next(error);
  }
};

postController.createPost = async (req, res, next) => {
  try {
    const post = await prisma.documents.create({ data: req.body });

    res.status(201).json({ post });
  } catch (error) {
    next(error);
  }
};

postController.deletePost = async (req, res, next) => {
  try {
    const post = await prisma.documents.delete({
      where: { id: +req.params.id },
    });
    res.status(200).json({ post, message: 'Post deleted successfully' });
  } catch (error) {
    next(error);
  }
};

module.exports = postController;
