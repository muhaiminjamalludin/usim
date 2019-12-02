if (process.env.NODE_ENV !== 'production') {
    require('dotenv').config()
}
const express = require('express');
const fileUpload = require('express-fileupload');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');
const app = express();
var fs = require('fs');
const bcrypt = require('bcrypt');
const saltRounds = 5;
const passport = require('passport');
const initializePassport = require('./config/passport-config')
const flash = require('express-flash');
const session = require('express-session');
const methodOverride = require('method-override');
initializePassport(
    passport,
    username => users.find(user => user.username === username),
    id => users.find(user => user.id === id)
)


const { getHomePage, getPublicationPage, getActivityPage, getLoginPage, getRegisterPage, getAdminPage, getAdmin2Page } = require('./routes/index');
const { addPublicationPage, addPublication, deletePublication, editPublication, editPublicationPage, sortPublication, filterPublication } = require('./routes/publication');
const { addActivityPage, addActivity, deleteActivity, editActivity, editActivityPage } = require('./routes/activity');
const port = 5000;

//set up static foldr
app.use(express.static("public"));

const users = [];// user array

// create connection to database
// the mysql.createConnection function takes in a configuration object which contains host, user, password and the database name.
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'inaq'
});

// connect to database
db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('Connected to database');
});
global.db = db;

// configure middleware
app.set('port', process.env.port || port); // set express to use this port
app.set('views', __dirname + '/views'); // set express to look in this folder to render our view
app.set('view engine', 'ejs'); // configure template engine
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json()); // parse form data client
app.use(express.static(path.join(__dirname, 'public'))); // configure express to use public folder
app.use(fileUpload()); // configure fileupload
app.use(flash());
app.use(session({
    secret: process.env.SESSION_SECRET,//key to encrypt our env var
    resave: false,
    saveUninitialized: false
}));
app.use(passport.initialize());
app.use(passport.session());
app.use(methodOverride('_method'));

// routes for the app

app.get('/', getHomePage);
app.get('/login', getLoginPage);
app.post('/login', passport.authenticate('local-login', {
    successRedirect: '/admin',
    failureRedirect: '/login',
    failureFlash: true
}));
app.get('/register', getRegisterPage);
app.post('/register', passport.authenticate('local-signup', {
    successRedirect: '/login',
    failureRedirect: '/register',
    failureFlash: true
}));
// instead of using POST method kite gne delete method so nnti buat form logut gne delete
app.delete('/logout', (req, res) => {
    req.logOut()
    res.redirect('/login')
});
app.get('/admin', checkAunthenticated, getAdminPage);
app.get('/admin-activity', checkAunthenticated, getAdmin2Page);
app.get('/publication', getPublicationPage);
app.get('/add-publication', checkAunthenticated, addPublicationPage);
app.get('/edit-publication/:id', checkAunthenticated, editPublicationPage);
app.get('/delete-publication/:id', checkAunthenticated, deletePublication);
app.post('/add-publication', addPublication);
app.post('/edit-publication/:id', editPublication);
app.get('/activity', getActivityPage);
app.get('/add-activity', checkAunthenticated, addActivityPage);
app.get('/edit-activity/:id', checkAunthenticated, editActivityPage);
app.get('/delete-activity/:id', checkAunthenticated, deleteActivity);
app.get('/filter-publication', filterPublication);
app.get('/sort', sortPublication);
app.post('/add-activity', addActivity);
app.post('/edit-activity/:id', editActivity);
app.post('/filter-publication', filterPublication);


// function utk protect from user x aunthenticate
function checkAunthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return next()
    }
    res.redirect('/login')
}

/*function utk elak bile dh login xbole pegi kat /login page
letak dkt get register, post login, post register.
function checkNotAunthenticated(req, res next){
  if(req.isAunthenticated()){
     return res.redirect('/')
  }
  next()
}*/

// set the app to listen on the port
app.listen(port, () => {
    console.log(`Server running on port: ${port}`);
});
