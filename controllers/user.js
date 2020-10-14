const User = require('../models/user');
const Image = require('../models/image');
// var express = require('express');
// var cookieParser = require('cookie-parser');

// var app = express();
// app.use(cookieParser());

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
            // res.cookie('login', user, {maxAge: 360000});
            res.render('post/successful', {
                pageTitle: 'Successful',
                url: '/successful',
                // user: user,
            });
        })
        .catch(err => console.log(err));
};

// exports.logout = (req,res,next) => {
//     res.clearCookie('login').send('Have logout');
// }

// exports.getCookie = (req,res,next) => {
//     res.cookie
// }