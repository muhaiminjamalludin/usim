const fs = require('fs');

module.exports = {
    addPublicationPage: (req, res) => {
        let titles = "INAQ";
        res.render('add-publication.ejs', {
            title: titles,
            message: ''
        });
    },
    addPublication: (req, res) => {
        if (!req.files) {
            return res.status(400).send("No files were uploaded.");
        }

        let message = '';
        let title = req.body.title;
        let type = req.body.type;
        let year = req.body.year;
        let author = req.body.author;
        let language = req.body.language;
        let institution = req.body.institution;
        let Publication = req.body.publication;
        let pages = req.body.pages;
        let edition = req.body.edition;
        let link = req.body.link;
        let topic = req.body.topic;
        let uploadedFile = req.files.image;
        let image_name = uploadedFile.name;
        let fileExtension = uploadedFile.mimetype.split('/')[1];
        image_name = author + '.' + fileExtension;

        function mysql_real_escape_string(str) {
            return str.replace(/[\0\x08\x09\x1a\n\r"'\\\%]/g, function (char) {
                switch (char) {
                    case "\0":
                        return "\\0";
                    case "\x08":
                        return "\\b";
                    case "\x09":
                        return "\\t";
                    case "\x1a":
                        return "\\z";
                    case "\n":
                        return "\\n";
                    case "\r":
                        return "\\r";
                    case "\"":
                    case "'":
                    case "\\":
                    case "%":
                        return "\\" + char; // prepends a backslash to backslash, percent,
                    // and double/single quotes
                }
            });
        }

        let titleQuery = "SELECT * FROM `publication` WHERE title = '" + mysql_real_escape_string(title) + "'";

        db.query(titleQuery, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }
            if (result.length > 0) {
                message = 'Title already exists';
                res.render('add-publication.ejs', {
                    message,
                    title: Welcome
                });
            } else {

                if (uploadedFile.mimetype === 'image/png' || uploadedFile.mimetype === 'image/jpeg' || uploadedFile.mimetype === 'image/gif') {

                    uploadedFile.mv(`public/assets/img/${image_name}`, (err) => {
                        if (err) {
                            return res.status(500).send(err);
                        }
                        // send the publication's details to the database
                        let query = "INSERT INTO `publication` (title, type, year, author, image, language, institution, Publication, pages, edition, link, topic) VALUES ('" +
                            mysql_real_escape_string(title) + "', '" + type + "', '" + year + "', '" + mysql_real_escape_string(author) + "', '" + image_name + "', '" + language + "','" + institution + "','" + Publication + "','" + pages + "','" + edition + "','" + link + "','" + topic + "')";
                        db.query(query, (err, result) => {
                            if (err) {
                                return res.status(500).send(err);
                            }
                            res.redirect('/admin');
                        });
                    });
                } else {
                    message = "Invalid File format. Only 'gif', 'jpeg' and 'png' images are allowed.";
                    res.render('add-publication.ejs', {
                        message,
                        title: Welcome
                    });
                }
            }
        });
    },
    editPublicationPage: (req, res) => {
        let publicationId = req.params.id;
        let query = "SELECT id,title, type, year, author, image, language, institution, Publication, pages, edition, link, topic FROM `publication` WHERE id = '" + publicationId + "' ";
        db.query(query, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }
            res.render('edit-publication.ejs', {
                title: 'Edit'
                , publications: result[0]
                , message: ''
            });
        });
    },
    editPublication: (req, res) => {
        let publicationId = req.params.id;
        let title = req.body.title;
        let type = req.body.type
        let year = req.body.year;
        let author = req.body.author;
        let language = req.body.language;
        let institution = req.body.institution;
        let Publication = req.body.publication;
        let pages = req.body.pages;
        let edition = req.body.edition;
        let link = req.body.link;
        let topic = req.body.topic;

        let query = "UPDATE `publication` SET `title` = '" + title + "', `type` = '" + type + "', `year` = '" + year + "', `author` = '" + author + "', `language` = '" + language + "', `institution` = '" + institution + "', `Publication` = '" + Publication + "', `pages` = '" + pages + "', `edition` = '" + edition + "', `link` = '" + link + "', `topic` = '" + topic + "' WHERE `publication`.`id` = '" + publicationId + "'";
        db.query(query, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }
            res.redirect('/admin');
        });
    },
    deletePublication: (req, res) => {
        let publicationId = req.params.id;
        let getImageQuery = 'SELECT image FROM `publication` WHERE id = "' + publicationId + '"';
        let deleteUserQuery = 'DELETE FROM `publication` WHERE id = "' + publicationId + '"';

        db.query(getImageQuery, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }

            let image = result[0].image;

            fs.unlink(`public/assets/img/${image}`, (err) => {
                if (err) {
                    return res.status(500).send(err);
                }
                db.query(deleteUserQuery, (err, result) => {
                    if (err) {
                        return res.status(500).send(err);
                    }
                    res.redirect('/admin');
                });
            });
        });
    },
    sortPublication: (req, res) => {
        let titles = "INAQ Publication";
        let sort = 'SELECT id,title, type, year, author, image, language, institution, Publication, pages, edition, link, topic FROM `publication` ORDER BY `year` DESC';
        db.query(sort, function (err, result) {
            if (err) {
                throw err;
            }
            res.render('publication.ejs', {
                title: titles,
                publications: result
            });
        })
    },
    filterPublication: async (req, res) => {
        let titles = "INAQ Publication";
        let sci = req.body.science;
        //  let check = req.body.science[checked];
        let reli = req.body.religion;
        let hp = req.body.hp;
        let edu = req.body.edu;
        //
        let book = req.body.book;
        let research = req.body.research;
        let con = req.body.conference;
        let journal = req.body.journal;



        let temp = 'SELECT id,title, type, year, author, image, language, institution, Publication, pages, edition, link, topic FROM `publication` WHERE (topic =';
        //let filter = `${temp}"${sci}"OR topic ="${reli}" OR topic="${hp}" OR topic="${edu}"`;
        let topic = `"${sci}" OR topic ="${reli}" OR topic="${hp}" OR topic="${edu}")`;
        let type = `(type="${book}" OR type="${research}" OR type="${con}" OR type="${journal}" )`;
        let filter = `${temp}${topic} AND ${type}`;
        console.log(filter);
        db.query(filter, function (err, result) {
            if (err) {
                console.log("Salah kat sini");
            } res.render('publication.ejs', {
                title: titles,
                publications: result
            });
        })



    }
};