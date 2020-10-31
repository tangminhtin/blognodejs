const express = require('express');
const router = express.Router();
const userController = require('../controllers/user');

router.get('/user/profile/:userId', userController.getProfile);
router.post('/search', userController.search);
module.exports = router;