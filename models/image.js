const Sequelize = require('sequelize');
const sequelize = require('../util/database');

const Image = sequelize.define('image', {
    imageId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
    },
    image: Sequelize.STRING,
    postId: Sequelize.INTEGER
});

module.exports = Image;
