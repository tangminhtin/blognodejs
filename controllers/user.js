const User = require('../models/user');
const Image = require('../models/image');
const Comment = require('../models/comment');
let express = require('express');
let cookieParser = require('cookie-parser');
const Post = require('../models/post');

let app = express();
app.use(cookieParser());

exports.getLogin = (req,res,next) => {
    res.render('user/login', {
        pageTitle: 'Login',
        url: '/login',
    });
};

exports.getRegistration = (req,res,next) => {
    res.render('user/registration', {
        pageTitle: 'Registration',
        url: '/registration',
    });
};

exports.login = (req,res,next) => {
    const email = req.body.txtEmail;
    const password = req.body.txtPass;

    User.findOne({where: {email: email, password: password}})
        .then(user => {
            res.cookie('login', user, {maxAge: 360000}).send(res.render('user/successful', {
                pageTitle: 'Successful',
                url: '/successful',
            }));
            
        })
        .catch(err => console.log(err));
};

exports.logout = (req,res) => {
    res.clearCookie('login').send("logout thanh cong");   
}

exports.getProfile = (req, res, next) => {
    const userId = req.params.userId;
    User.findOne({where: {userId: userId}})
        .then(user => {
            if (user === null) {
                res.status(404).render('404', {
                    pageTitle: 'Page Not Found',
                    path: '/404'
                });
            } else {
                Post.findAll({where: {userId: user.userId}})
                .then(posts => {
                    Image.findAll()
                        .then(images => {
                            Comment.findAll()
                                .then(comments => {
                                    res.render('user/profile', {
                                        pageTitle: 'User Profile',
                                        url: '/profile',
                                        user: user,
                                        posts: posts,
                                        images: images,
                                        comments: comments
                                    });
                                });
                        });
                }) ;
            }
            
        })
        .catch(err => console.log(err));
};
