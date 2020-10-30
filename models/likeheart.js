const Sequelize = require('sequelize');
const sequelize = require('../util/database');

const likeheart = sequelize.define('likeheart', {
    likeheartId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
    },
    userId: Sequelize.INTEGER,
    postId: Sequelize.INTEGER,
    status: Sequelize.BOOLEAN
});

module.exports = likeheart;