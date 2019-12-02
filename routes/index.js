
module.exports = {
    getHomePage: (req, res) => {
        let query = "SELECT id,title, type, year, author, image, language, institution, Publication, pages, edition, link, topic FROM `publication`"; // query database
        let titles = "iNaQ";
        // execute query
        db.query(query, (err, result) => {
            if (err) {
                console.log("error1")
                res.redirect('/');
            };
            res.render('index.ejs', {
                title: titles,
                publications: result
            });
        });
    },
    getPublicationPage: (req, res) => {
        let query = "SELECT id,title, type, year, author, image, language, institution, Publication, pages, edition, link, topic FROM `publication`"; // query database
        let titles = "INAQ Publication";
        // execute query
        db.query(query, (err, result) => {
            if (err) {
                console.log("error1")
                res.redirect('/');
            };
            res.render('publication.ejs', {
                title: titles,
                publications: result
            });
        });
    },
    getActivityPage: (req, res) => {
        let query = "SELECT id, name, date, location, organiser, image, description  FROM `activity`"; // query database
        let titles = "INAQ Activity & Training";
        // execute query
        db.query(query, (err, result) => {
            if (err) {
                console.log("erroractivity")
                res.redirect('/');
            };
            res.render('activity.ejs', {
                title: titles,
                activities: result
            });
        });
    },
    getLoginPage: (req, res) => {
        let titles = "Login";
        res.render('login.ejs', {
            title: titles,
        });

    },
    getRegisterPage: (req, res) => {
        let titles = "Register";
        res.render('register.ejs', {
            title: titles,
        });
    },
    getAdminPage: (req, res) => {
        let query = "SELECT id,title, type, year, author, image, language, institution, Publication, pages, edition FROM `publication`"; // query database
        let titles = "INAQ Publication";
        // execute query
        db.query(query, (err, result) => {
            if (err) {
                console.log("error1")
                res.redirect('/');
            };
            res.render('admin.ejs', {
                title: titles,
                publications: result
            });
        });
    },
    getAdmin2Page: (req, res) => {
        let query = "SELECT id, name, date, location, organiser, image, description  FROM `activity`"; // query database
        let titles = "INAQ Activity & Training";
        // execute query
        db.query(query, (err, result) => {
            if (err) {
                console.log("erroractivity")
                res.redirect('/');
            };
            res.render('admin2.ejs', {
                title: titles,
                activities: result
            });
        });
    },

};
