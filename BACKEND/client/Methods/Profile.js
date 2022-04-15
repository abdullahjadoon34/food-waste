const CustomerProfile=require('../Models/Profile')
exports.getProfile = (req, res) => {
   CustomerProfile.findOne({
       mobileNumber:req.params.mobileNumber
   },(err,result)=>{
       if(err)
       {
           res.json(
               err
           )
       }
       else{
           res.json(
               result
           )
       }
   })
}
