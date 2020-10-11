const Post = require('../models/post');
const Image = require('../models/image');
const User = require('../models/user');
const Comment = require('../models/comment');

exports.getIndex = (req, res, next) => {
    Post.findAll()
        .then(posts => {
            User.findAll()
                .then(users => {
                    Image.findAll()
                        .then(images => {
                            Comment.findAll()
                                .then(comments => {
                                    res.render('post/index', {
                                        pageTitle: 'Welcome to Hack Brain Blog',
                                        url: '/',
                                        posts: posts,
                                        users: users,
                                        images: images,
                                        comments: comments
                                    });
                                });
                        });
                });
        })
        .catch(err => console.log(err));
};

exports.getPost = (req, res, next) => {
    Comment.findAndCountAll()
        .then(({count, rows}) => {
            console.log(count);
        })
        .then(() => {
            res.render('post/post', {
                pageTitle: 'Welcome to Hack Brain Blog',
                url: '/post'
            });
        })
        .catch(err => console.log(err));
}
