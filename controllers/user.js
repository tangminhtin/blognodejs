const User = require('../models/user');
const Image = require('../models/image');
const Comment = require('../models/comment');
const Post = require('../models/post');

const express = require('express');
const app = express();
const cookieParser = require('cookie-parser');
app.use(cookieParser);

// <<<<<<< HEAD
// handler get profile
// =======
// const mysql = require('mysql');

// exports.getLogin = (req, res, next) => {
//     res.render('user/login', {
//         pageTitle: 'Login',
//         url: '/login',
//     });
// };

// exports.getRegistration = (req, res, next) => {
//     res.render('user/registration', {
//         pageTitle: 'Registration',
//         url: '/registration',
//     });
// };

// exports.login = (req, res, next) => {
//     const email = req.body.txtEmail;
//     const password = req.body.txtPass;

//     User.findOne({ where: { email: email, password: password } })
//         .then(user => {
//             if (user === null) {
//                 res.status(404).render('404', {
//                     pageTitle: 'User not found',
//                     path: '/404'
//                 });
//             } else {
//                 res.cookie('user', user);
//                 res.redirect('/user/successful');
//             }

//         })
//         .catch(err => console.log(err));
// };

// exports.logout = (req, res) => {
//     res.clearCookie('user').send("logout thanh cong");
// }

// >>>>>>> origin
exports.getProfile = (req, res, next) => {
    const userId = req.params.userId;
    User.findOne({ where: { userId: userId } })
        .then(user => {
            if (user === null) {
                res.status(404).render('404', {
                    pageTitle: 'Page Not Found',
                    path: '/404'
                });
            } else {
                Post.findAll({ where: { userId: user.userId } })
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
                                            comments: comments,
                                            acc: req.session.user
                                        });
                                    });
                            });
                    });
            }

        })
        .catch(err => console.log(err));
};

exports.search = (req, res) =>{
    const input = req.body.search;

    User.findOne({where: {fullname: input}})
    .then(user => {
        console.log(user);
        
        Post.findAll({where: {userId: user.userId}})
        .then(result => {
            res.render("/", {
                pageTitle: 'Welcome to Hack Brain Blog',
                url: '/',
                posts: posts
            });
        });
    })
    .catch(err => console.log(err));
};
// <<<<<<< HEAD
// =======

// exports.getSuccessful = (req, res) => {
//     let user = get_cookies(req)['user'];
//     if (user === null) {
//         res.status(404).render('404', {
//             pageTitle: 'User not found',
//             path: '/404'
//         });
//     }else{
//         res.render('user/successful', {
//             pageTitle: '',
//             url: '/successful',
//             user: user
//         });
//     }

// }

// var get_cookies = function(request) {
//     var cookies = {};
//     request.headers && request.headers.cookie.split(';').forEach(function(cookie) {
//       var parts = cookie.match(/(.*?)=(.*)$/)
//       cookies[ parts[1].trim() ] = (parts[2] || '').trim();
//     });
//     return cookies;
//   };
// exports.registration = (req,res) =>{
//     let fullname = req.body.txtName;
//     let email = req.body.txtEmail;
//     let password = req.body.txtPassword;
//     var datetime = new Date();
//     console.log(datetime.toISOString().slice(0, 19).replace('T', ' '));

//     var connection = mysql.createConnection({
//         host     : 'localhost',
//         user     : 'root',
//         password : '',
//         database : 'hack-brain'
//       });
       
//       connection.connect();
       
//       connection.query("INSERT INTO users (fullname, email, password, image, active, createdAt, updatedAt) VALUES ('Tang Minh Tin', 'minhtin@gmail.com', '123', ' ', 1, '2020-10-10 18:57:35', '2020-10-10 18:57:35')",
//       function (error, results, fields) {
//         if (error) throw error;
//         console.log('The solution is: ', results.affectedRows);
//       });
       
//       connection.end();
// }
// >>>>>>> origin
