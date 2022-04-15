const express = require('express')
const router = express.Router()
const {
    getProfile,   
} = require('../Methods/Profile')
router.get('/getProfile/:mobileNumber', getProfile)
module.exports = router