const Hotel = require('../Models/Hotel')
exports.getHotels = (req, res) => {
    Hotel.find({},(err,result)=>{
        if(err)
        throw err;
        res.send({result:result});
    })
}