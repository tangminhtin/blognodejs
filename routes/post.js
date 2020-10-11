const express = require('express');
const router = express.Router();
const postController = require('../controllers/post');

router.get('/', postController.getIndex);
router.get('/post', postController.getPost);


module.exports = router;
