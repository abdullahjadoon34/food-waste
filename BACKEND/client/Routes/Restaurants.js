const express = require('express')
const router = express.Router()
const {
    getHotels,   
} = require('../Methods/Hotel')
router.get('/getHotels', getHotels)
module.exports = router