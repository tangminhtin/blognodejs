const Sequelize = require('sequelize');
const sequelize = require('../util/database');

const User = sequelize.define('user', {
    userId: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
    },
    fullname: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true,
    },
    email: Sequelize.STRING,
    password: Sequelize.STRING,
    image: Sequelize.STRING,
    active: Sequelize.BOOLEAN
});

module.exports = User;
