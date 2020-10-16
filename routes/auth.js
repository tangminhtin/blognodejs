const express = require('express');
const router = express.Router();
const authController = require('../controllers/auth');

router.get('/login', authController.getLogin);
router.post('/login', authController.postLogin);

router.get('/registration', authController.getRegistration);
router.post('/registration', authController.postRegistration);

router.get('/logout', authController.logout);
router.get('/user/successful', authController.getSuccessful);

module.exports = router;
