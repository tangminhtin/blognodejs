const express = require('express');
const router = express.Router();
const postController = require('../controllers/post');

router.get('/', postController.getIndex);



module.exports = router;
