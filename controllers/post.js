const Post = require('../models/post');
const Image = require('../models/image');
const User = require('../models/user');
const Comment = require('../models/comment');
const { post } = require('../routes/post');

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
    // get postId from link
    const postId = req.params.postId;

    Post.findOne({where: {postId: postId}})
        .then(post => {
            User.findAll()
                .then(users => {
                    User.findOne({where: {userId: post.userId}})
                        .then(user => {
                            Image.findAll({where: {postId: post.postId}})
                                .then(images => {
                                    Comment.findAll()
                                        .then(comments => {
                                            res.render('post/post', {
                                                pageTitle: post.title,
                                                url: '/post',
                                                post: post,
                                                users: users,
                                                user: user,
                                                images: images,
                                                comments: comments
                                            });
                                        });
                                });
                        });
                });
            
        })
        .catch(err => console.log(err));
}
