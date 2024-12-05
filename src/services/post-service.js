const prisma = require('../models/prisma');

const postService = {};

postService.getPosts = () => prisma.document.findMany();

module.exports = postService;
