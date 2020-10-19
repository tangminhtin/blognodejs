const User = require('../models/user');
const bcrypt = require('bcryptjs');

// handler registration
exports.getRegistration = (req, res, next) => {
    let errorMessage = req.flash('error');

    if (errorMessage.length > 0) {
        errorMessage = errorMessage[0];
    } else {
        errorMessage = null;
    }

    res.render('auth/registration', {
        pageTitle: 'Registration',
        url: '/registration',
        errorMessage: errorMessage
    });
};

exports.postRegistration = (req, res, next) => {
    const fullname = req.body.fullname
    const email = req.body.email;
    const password = req.body.password;
    const confirm = req.body.confirm;
    const image = req.file.path;

    User.findOne({ where: {email: email}})
        .then(user => {
            if (user) {
                req.flash('error', 'Email exists already, please pick a different one.');
                return res.redirect('/registration');
            }

            if (password !== confirm) {
                req.flash('error', 'Password not match!');
                return res.redirect('/registration');
            }

            return bcrypt
                .hash(password, 12)
                .then(hashedPassword => {
                    User
                        .create({
                            fullname: fullname,
                            email: email,
                            password: hashedPassword,
                            image: image,
                            active: 1
                        })  
                        .then(result => {
                            console.log('User was created!');
                            res.redirect('/login');
                        }) 
                        .catch(err => console.log(err));          
                })
        })
        .catch(err => console.log(err));
};

// handler login
exports.getLogin = (req, res, next) => {
    let errorMessage = req.flash('error');

    if (errorMessage.length > 0) {
        errorMessage = errorMessage[0];
    } else {
        errorMessage = null;
    }
    
    res.render('auth/login', {
        pageTitle: 'Login',
        url: '/login',
        errorMessage: errorMessage
    });
};

exports.postLogin = (req, res, next) => {
    const email = req.body.txtEmail;
    const password = req.body.txtPass;

    User.findOne({ where: { email: email } })
        .then(user => {
            if (!user) {
                req.flash('error', 'Invalid email or password.');
                return res.redirect('/login');
            }
            bcrypt
                .compare(password, user.password)
                .then(doMatch => {
                    if (doMatch) {
                        req.session.isLoggedIn = true;
                        req.session.user = user;
                        return req.session.save(err => {
                            console.log(err);
                            res.redirect('/');
                        });
                    }
                    req.flash('error', 'Invalid email or password.');
                    res.redirect('/login');
                })
                .catch(err => {
                    console.log(err);
                    res.redirect('/login');
                });
        })
        .catch(err => console.log(err));
};

// handler logout
exports.logout = (req, res) => {
    if (req.session.user) {
        req.session.destroy(err => {
            console.log(err);
            res.redirect('/');
        })
    }
}

exports.getSuccessful = (req, res) => {
    let user = get_cookies(req)['user'];
    if (user === null) {
        res.status(404).render('404', {
            pageTitle: 'User not found',
            path: '/404'
        });
    }else{
        res.render('auth/successful', {
            pageTitle: '',
            url: '/successful',
            user: user
        });
    }

}

var get_cookies = function(request) {
    var cookies = {};
    request.headers && request.headers.cookie.split(';').forEach(function(cookie) {
      var parts = cookie.match(/(.*?)=(.*)$/)
      cookies[ parts[1].trim() ] = (parts[2] || '').trim();
    });
    return cookies;
  };
