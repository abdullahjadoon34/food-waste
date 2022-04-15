const express = require('express')
const morgan = require('morgan')
const cors = require('cors')
const path = require('path')
const crypto = require('crypto')
const GridFsStorage = require('multer-gridfs-storage')
const Grid = require('gridfs-stream')
const connectDB = require('./config/db')
const passport = require('passport')
const bodyParser = require('body-parser')
const routes = require('./routes/index')
const dotenv = require('dotenv')
const multer = require('multer')
const profileRoute = require('./routes/Profile')
const authRoute = require('./routes/Auth')
const menuRoute = require('./routes/Menu')
connectDB()
const app = express()
if (process.env.NODE_ENV === 'development') {
    app.use(morgan('dev'))
}
app.use(cors())
app.use(bodyParser.urlencoded({
    extended: false,
}))
app.use(bodyParser.json())
app.use(routes)
app.use('/restaurant', authRoute)
app.use('/restaurant', menuRoute)
app.use('/restaurant', profileRoute)
app.use("./uploads", express.static("uploads"));
app.use(passport.initialize())
require('./config/passport')(passport)
const PORT = process.env.PORT || 3001
app.listen(PORT, console.log(`Server running in ${process.env.NODE_ENV} mode on ${PORT}`))