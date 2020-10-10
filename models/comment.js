const Sequelize = require('sequelize');
const sequelize = require('../util/database');

const Comment = sequelize.define('comment', {
    commentId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
    },
    content: Sequelize.TEXT,
    date: Sequelize.DATE,
    userId: Sequelize.INTEGER,
    postId: Sequelize.INTEGER
});

module.exports = Comment;
