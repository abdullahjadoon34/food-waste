const mongoose = require('mongoose')
const Schema = mongoose.Schema
const customerprofileSchema = new Schema({
    mobileNumber: {
        type: String,
    },
    email: {
        type: String,
    },
    address: {
        type: String,
    },
    member: {
        type: String,
    }
}, {
    timestamps: true
});

module.exports = mongoose.model('customerprofile', customerprofileSchema)
