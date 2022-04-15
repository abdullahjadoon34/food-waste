const CustomerOrder = require('../Models/Orders')
exports.placeOrder = (req, res) => {
    const customerOrder = new CustomerOrder(
        req.body
    );
    customerOrder.save().then(() => {
        res.json({
            success: true,
            msg: customerOrder
        })
    }).catch((err) => {
        res.json({
            success: false, msg: err
        })
    })
}
exports.getOrderDetails = (req, res) => {
    CustomerOrder.find({ mobileNumber: req.params.mobileNumber }, (err, result) => {
        if (err)
            return res.json({
                err: "Not able to fetch orders"
            })
        else
            return res.json({
                result
            })
    })
}
exports.deleteOrder = (req, res) => {
    CustomerOrder.findOneAndUpdate(
        {id:req.params.id},{new:true},
        {status:"canceled"},(err,result)=>{
            if(err)
            res.send(err)
            else
            res.send(result)
        }
    );
}
exports.orderStatus = (req, res) => {
    CustomerOrder.findOneAndUpdate(
        {_id:req.params.id},
        {$set:{status:req.body.status}},{new:true},(err,result)=>{
               
            if(err)
            res.send(err)
            else
            res.send(result)
        }
    );
}
exports.getRestaurantOrderDetails=(req,res)=>{
    CustomerOrder.find({restaurantMobileNumber:req.params.restaurantMobileNumber},(err,result)=>{
        if(err)
        return res.send({
            success:false,
            msg:err        
        })
        else
        return res.send({
            result
        })
    })
}
