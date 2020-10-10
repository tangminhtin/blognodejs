const Sequelize = require('sequelize');
const sequelize = require('../util/database');

const Post = sequelize.define('post', {
    postId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
    },
    title: Sequelize.STRING,
    content: Sequelize.TEXT,
    date: Sequelize.DATE,
    like: Sequelize.INTEGER,
    view: Sequelize.INTEGER,
    userId: Sequelize.INTEGER
})

module.exports = Post;
