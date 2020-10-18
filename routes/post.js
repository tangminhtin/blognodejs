const express = require('express');
const router = express.Router();
const postController = require('../controllers/post');
const commentController = require('../controllers/comment');

router.get('/', postController.getIndex);
router.get('/updateHeart/:postId', postController.updateLike);
router.get('/post/:postId', postController.getPost);
router.post('/post', postController.doPost);
router.post('/post/:postId', commentController.postComment);
module.exports = router;
