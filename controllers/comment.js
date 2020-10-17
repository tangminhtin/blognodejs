const Post = require('../models/post');
const Image = require('../models/image');
const User = require('../models/user');
const Comment = require('../models/comment');
const { post } = require('../routes/post');

exports.postComment = (req,res) => {
    const account = req.session.user;
    if(account){
        const commentContent = req.body.commentContent;
        const userId = account.userId;
        const postId = req.body.postId;
        const datetime = new Date().toISOString().slice(0, 19).replace('T', ' ');
        
        Comment
            .create({
                content: commentContent,
                date: datetime,
                userId: userId,
                postId: postId
            })
            .then(result => {
                console.log('Post was created');
                res.redirect('/post/' + postId + '#comment');
            })
            .catch(err => console.log(err));
    }
}