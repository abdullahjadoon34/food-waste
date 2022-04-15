const Profile = require('../Models/Profile')
const User = require('../Models/User')
const Order = require('../Models/Orders')
const config = require('../config/dbConfig')
const jwt = require('jwt-simple')
exports.register = (req, res) => {
    const customerUser = User(
        req.body
    );
    customerUser.save().then(() => {        
          var token = jwt.encode(customerUser, config.secret);
          res.send({ success: true, msg: token })
    }).catch((err) => {
        res.send({ success: false, msg: err });
    });
}
exports.login = (req, res) => {
    User.findOne({
        mobileNumber: req.body.mobileNumber
    }, (err, user) => {
        if (err) {
            throw err
        }
        if (!user) {
            res.status(403).send({
                success: false,
                msg: 'Failed to authenticate,User not found' + req.body.mobileNumber
            })
        }
        else {
            user.comparePassword(req.body.password, (err, isMatch) => {
                if (isMatch && !err) {
                    Profile.findOne({ mobileNumber: req.body.mobileNumber }, (err, result) => {
                        var token = jwt.encode(user, config.secret);
                        res.send({
                            success: true,
                            msg: token,
                        })
                    })
                
                }
                else {
                    res.status(404).send({ success: false, msg: "Invalid details" })
                }
            })
        }
    })
}