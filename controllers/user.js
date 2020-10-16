const User = require('../models/user');
const Image = require('../models/image');
const Comment = require('../models/comment');
const Post = require('../models/post');

const express = require('express');
const app = express();
const cookieParser = require('cookie-parser');
app.use(cookieParser);

// handler get profile
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
                                            comments: comments
                                        });
                                    });
                            });
                    });
            }

        })
        .catch(err => console.log(err));
};
