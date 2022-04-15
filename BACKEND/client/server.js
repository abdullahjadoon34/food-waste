const express = require('express')
const cors = require('cors');
const bodyParser = require('body-parser');
const morgan = require('morgan')
const passport = require('passport')
const connectDb = require('./config/db');
const OrdersRouter=require('./Routes/Orders')
const ProfileRouter=require('./Routes/Profile')
const UserRouter=require('./Routes/User')
const hotelRouter=require('./Routes/Restaurants')
const index=require('./index')
const app = express()
connectDb()
app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
    extended: false
}))

if (process.env.NODE_ENV === 'development')
    app.use(morgan('dev'))
app.use('/fluttereats',index)
app.use('/fluttereats',OrdersRouter)
app.use('/fluttereats',ProfileRouter)
app.use('/fluttereats',UserRouter)
app.use('/fluttereats',hotelRouter)
app.use(passport.initialize())
require('./config/passport')(passport)
const PORT = process.env.PORT || 3000
app.listen(PORT, console.log(`Server started in ${PORT}`))