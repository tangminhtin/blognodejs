const Sequelize = require('sequelize');

const sequelize = new Sequelize('hack-brain', 'root', '', {
    dialect: 'mysql',
    host: 'localhost'
});

module.exports = sequelize;
