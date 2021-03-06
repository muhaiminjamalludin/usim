const fs = require('fs');

module.exports = {
    addActivityPage: (req, res) => {
        let titles = "Add INAQ Activity & Training";
        res.render('add-activity.ejs', {
            title: titles,
            message: ''
        });
    },
    addActivity: (req, res) => {
        if (!req.files) {
            return res.status(400).send("No files were uploaded.");
        }

        let message = '';
        let name = req.body.name;
        let date = req.body.bdaytime;
        let location = req.body.location;
        let organiser = req.body.organiser;
        let description = req.body.description;
        let uploadedFile = req.files.image;
        let image_name = uploadedFile.name;
        let fileExtension = uploadedFile.mimetype.split('/')[1];
        image_name = name + '.' + fileExtension;

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

        let titleQuery = "SELECT * FROM `activity` WHERE name = '" + mysql_real_escape_string(name) + "'";

        db.query(titleQuery, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }
            if (result.length > 0) {
                message = 'Name already exists';
                res.render('add-activity.ejs', {
                    message,
                    title: "Activity"
                });
            } else {

                if (uploadedFile.mimetype === 'image/png' || uploadedFile.mimetype === 'image/jpeg' || uploadedFile.mimetype === 'image/gif') {

                    uploadedFile.mv(`public/assets/img2/${image_name}`, (err) => {
                        if (err) {
                            return res.status(500).send(err);
                        }
                        // send the publication's details to the database
                        let query = "INSERT INTO `activity` (name, date, location, organiser, image, description) VALUES ('" +
                            mysql_real_escape_string(name) + "', '" + date + "', '" + location + "', '" + mysql_real_escape_string(organiser) + "', '" + mysql_real_escape_string(image_name) + "', '" + mysql_real_escape_string(description) + "')";
                        db.query(query, (err, result) => {
                            if (err) {
                                return res.status(500).send(err);
                            }
                            res.redirect('/admin-activity');
                        });
                    });
                } else {
                    message = "Jenis fail yang tidak dibenarkan. Hanya 'gif', 'jpeg' dan 'png' dibenarkan.";
                    res.render('add-activity.ejs', {
                        message,
                        title: Welcome
                    });
                }
            }
        });
    },
    editActivityPage: (req, res) => {
        let activityId = req.params.id;
        let query = "SELECT id, name, date, location, organiser, image, description  FROM `activity` WHERE id = '" + activityId + "' ";
        db.query(query, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }
            res.render('edit-activity.ejs', {
                title: 'Edit'
                , activity: result[0]
                , message: ''
            });
        });
    },
    editActivity: (req, res) => {
        let activityId = req.params.id;
        let name = req.body.name;
        let date = req.body.bdaytime;
        let location = req.body.location;
        let organiser = req.body.organiser;
        let description = req.body.description;

        let query = "UPDATE `activity` SET `name` = '" + name + "', `date` = '" + date + "', `location` = '" + location + "', `organiser` = '" + organiser + "', `description` = '" + description + "' WHERE `activity`.`id` = '" + activityId + "'";
        db.query(query, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }
            res.redirect('/admin-activity');
        });
    },
    deleteActivity: (req, res) => {
        let activityId = req.params.id;
        let getImageQuery = 'SELECT image FROM `activity` WHERE id = "' + activityId + '"';
        let deleteActivityQuery = 'DELETE FROM `activity` WHERE id = "' + activityId + '"';

        db.query(getImageQuery, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }

            let image = result[0].image;

            fs.unlink(`public/assets/img2/${image}`, (err) => {
                if (err) {
                    return res.status(500).send(err);
                }
                db.query(deleteActivityQuery, (err, result) => {
                    if (err) {
                        return res.status(500).send(err);
                    }
                    res.redirect('/admin');
                });
            });
        });
    }
};