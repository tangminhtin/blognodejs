const Post = require('../models/post');
const Image = require('../models/image');
const User = require('../models/user');
const Comment = require('../models/comment');
const { post } = require('../routes/post');

exports.getIndex = (req, res, next) => {
    const account = req.session.user;
    if(!account){
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
    }else{
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
                                        acc: account,
                                        images: images,
                                        comments: comments
                                    });
                                });
                        });
                });
        })
        .catch(err => console.log(err));
    }
    
};

exports.getPost = (req, res, next) => {
    // get postId from link
    const postId = req.params.postId;

    Post.findOne({where: {postId: postId}})
        .then(post => {
            if (post === null) {
                res.status(404).render('404', {
                    pageTitle: 'Page Not Found',
                    path: '/404'
                });
            } else {
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
            }
        })
        .catch(err => console.log(err));
};
exports.doPost = (req,res) => {
    const userIdPost = req.body.userPostId;
    const postTitle = req.body.txtPostTitle;
    const postContent = req.body.txtPostContent;
    const postImageURL = req.body.txtPostImage;
    const datetime = new Date().toISOString().slice(0, 19).replace('T', ' ');
    console.log(userIdPost, postTitle, postContent, postImageURL, datetime);

    Post
        .create({
            title: postTitle,
            content: postContent,
            date: datetime,
            like: 0,
            view: 0,
            active: 1,
            userId: userIdPost
        })
        .then(result => {
            Image
                .create({
                    image: postImageURL,
                    postId: result.postId
                })
                .then(result => {
                    console.log('post was created');
                    res.redirect('/');
                })
                .catch(err => console.log(err));
        })
        .catch(err => console.log(err));
}