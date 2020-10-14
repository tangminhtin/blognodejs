const express = require('express');
const router = express.Router();
const userController = require('../controllers/user');

router.get('/login', userController.getLogin);
router.get('/registration', userController.getRegistration);
router.get('/logout', userController.logout);

router.post('/login', userController.login);



module.exports = router;