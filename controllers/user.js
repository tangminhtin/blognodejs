const User = require('../models/user');
const Image = require('../models/image');
let express = require('express');
let cookieParser = require('cookie-parser');

let app = express();
app.use(cookieParser());

exports.getLogin = (req,res,next) => {
    res.render('post/login', {
        pageTitle: 'Login',
        url: '/login',
    });
};

exports.getRegistration = (req,res,next) => {
    res.render('post/registration', {
        pageTitle: 'Registration',
        url: '/registration',
    });
};

exports.login = (req,res,next) => {
    const email = req.body.txtEmail;
    const password = req.body.txtPass;

    User.findOne({where: {email: email, password: password}})
        .then(user => {
            res.cookie('login', user, {maxAge: 360000}).send(res.render('post/successful', {
                pageTitle: 'Successful',
                url: '/successful',
            }));
            
        })
        .catch(err => console.log(err));
};

exports.logout = (req,res) => {
    res.clearCookie('login').send("logout thanh cong");   
}

// exports.getUserAfterLogin()