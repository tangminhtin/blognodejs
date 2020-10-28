// import some lib
const path = require('path');
const express = require('express');
const bodyParser = require('body-parser');
const sequelize = require('./util/database.js');
const session = require('express-session');
const SequelizeStore = require('connect-session-sequelize')(session.Store);
const csrf = require('csurf');
const flash = require('connect-flash');
const multer = require('multer');

// import controllers
const errorController = require('./controllers/error');

// import model
const User = require('./models/user');
const Post = require('./models/post');
const Image = require('./models/image');
const Comment = require('./models/comment');

const app = express();
const csrfProtection = csrf();

// store images
const fileStorage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads')
    },
    filename: (req, file, cb) => {
        // cb(null, new Date().toISOString() + '-' + file.originalname);
        cb(null, file.originalname);
    }
});

const fileFilter = (req, file, cb) => {
    if (file.mimetype === 'image/png' || file.mimetype === 'image/jpg' || file.mimetype === 'image/jpeg') {
        cb(null, true);
    } else {
        cb(null, false);
    }
}

// set dynamic with website with template engine
app.set('view engine', 'ejs');
app.set('views', 'views');

app.use(bodyParser.urlencoded({extended: true}));
app.use(multer({ storage: fileStorage, fileFilter: fileFilter }).single('image'));
app.use(express.static(path.join(__dirname, 'public')));
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// initialize routes
const postRoutes = require('./routes/post');
const userRoutes = require('./routes/user');
const authRoutes = require('./routes/auth');

// store session in to database
app.use(session({
    secret: "keyboard cat",
    resave: false,
    saveUninitialized: false,
    store: new SequelizeStore({
        db: sequelize,
        checkExpirationInterval: 15 * 60 * 1000,
        expiration: 24 * 60 * 60 * 1000
    })
}));

app.use(csrfProtection);
app.use(flash());

// store user session
app.use((req, res, next) => {
    if (!req.session.user) {
        return next();
    } 
    User.findByPk(req.session.user.userId)
        .then(user => {
            req.user = user;
            next();
        })
        .catch(err => console.log(err));
})

// create locals variable
app.use((req, res, next) => {
    res.locals.isAuthenticated = req.session.isLoggedIn;
    res.locals.csrfToken = req.csrfToken();
    next();
});

// routing was started
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
