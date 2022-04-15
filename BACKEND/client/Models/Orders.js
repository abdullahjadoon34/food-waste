const mongoose = require('mongoose')
const Schema = mongoose.Schema
const cartSchema = new Schema({   
    foodName: {
        type: String,
    },
    price: {
        type: String
    }
}, {
    timestamps: true,
});
const customerorderSchema = new Schema({    
    mobileNumber: {
        type: String,    
    },
    restaurantMobileNumber:{
        type:String,        
    },
    orderItems: [
        cartSchema
    ],
    pincode:{
        type:String,
    },
    state:{
        type:String,
    }, 
    district:{
        type:String,
    },
    address:{
        type:String,
    },
    status:{
        type:String,
        default:"Pending"
    }
}, {
    timestamps: true,
});
module.exports = mongoose.model('CustomerOrder', customerorderSchema)