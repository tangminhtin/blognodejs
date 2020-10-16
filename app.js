// import some lib
const path = require('path');
const express = require('express');
const bodyParser = require('body-parser');
const sequelize = require('./util/database.js');
const session = require('express-session');
const csrf = require('csurf');
const flash = require('connect-flash');

// import controllers
const errorController = require('./controllers/error');

// import model
const User = require('./models/user');
const Post = require('./models/post');
const Image = require('./models/image');
const Comment = require('./models/comment');

const app = express();

const csrfProtection = csrf();

// set dynamic with website with template engine
app.set('view engine', 'ejs');
app.set('views', 'views');

app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(path.join(__dirname, 'public')));

// initialize routes
const postRoutes = require('./routes/post');
const userRoutes = require('./routes/user');
const authRoutes = require('./routes/auth');

app.use(session({
    secret: "my secret",
    resave: false,
    saveUninitialized: false,
}));
// app.use(csrfProtection);
app.use(flash());

app.use(userRoutes);
app.use(postRoutes);
app.use(authRoutes);

app.use(errorController.get404);

// create table of database
sequelize.sync()
    .then(() => {
        app.listen(3000);
    })
    .catch(err => {
        // console.log(err);
    })
