const express = require('express');
const router = express.Router();
const userController = require('../controllers/user');

router.get('/user/profile/:userId', userController.getProfile);
module.exports = router;