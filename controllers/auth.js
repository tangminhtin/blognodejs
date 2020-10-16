const User = require('../models/user');

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
    const fullname = req.body.fullname;
    const email = req.body.email;
    const password = req.body.password;
    const confirm = req.body.confirm;
    const image = req.body.image;
    console.log(fullname, email, password, confirm, image);

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
                            password: password,
                            image: image,
                            active: 1
                        })  
                        .then(result => {
                            console.log('User was created!');
                            res.redirect('/');
                        })           
                })
        })
        .catch(err => console.log(err));
    
};

// handler login
exports.getLogin = (req, res, next) => {
    res.render('auth/login', {
        pageTitle: 'Login',
        url: '/login',
    });
};

exports.postLogin = (req, res, next) => {
    const email = req.body.txtEmail;
    const password = req.body.txtPass;

    User.findOne({ where: { email: email, password: password } })
        .then(user => {
            if (user === null) {
                res.status(404).render('404', {
                    pageTitle: 'User not found',
                    path: '/404'
                });
            } else {
                // res.cookie('user', user);
                // res.redirect('../user/successful');
                res.redirect("/");
            }

        })
        .catch(err => console.log(err));
};

// handler logout
exports.logout = (req, res) => {
    res.clearCookie('user').send("logout thanh cong");
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
