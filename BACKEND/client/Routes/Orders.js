const express = require('express')
const router = express.Router()
const {
    placeOrder,
    getOrderDetails,
    orderStatus,    
    getRestaurantOrderDetails,
    // deleteOrder,
} = require('../Methods/Orders')
router.get('/getOrderDetails/:mobileNumber', getOrderDetails)
router.get('/restaurantOrderDetails/:restaurantMobileNumber',getRestaurantOrderDetails)
router.patch('/placeOrder', placeOrder)
router.patch('/orderStatus/:id',orderStatus)

router.get('/', (req, res) => {
    res.send(__dirname)
})
module.exports = router