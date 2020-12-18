const express = require('express');
const app = require('express')();
const morgan = require('morgan');
const expressHbs = require('express-handlebars')
const path = require('path')
const flash = require('connect-flash')
const session = require('express-session')
const mysqlStore = require('express-mysql-session')
const passport = require('passport');
const { database } = require('./keys');
const http = require('http').createServer(app)
const io = require('socket.io')(http)

//inicializamos express
require('./lib/passport')
require('./lib/socket')(io)

//Configuraciones
app.set('port', 3000);
app.set('views', path.join(__dirname, 'views'))
app.engine('.hbs', expressHbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}))
app.set('view engine', '.hbs')


//middleware
app.use(session({
    secret: 'secretChatKuepa',
    resave: false,
    saveUninitialized: false,
    store: new mysqlStore(database)
}))
app.use(morgan('dev'))
app.use(express.urlencoded({ extended: true }))
app.use(express.json())
app.use(flash())
app.use(passport.initialize())
app.use(passport.session())

//Variables globales
app.use((req, res, next) => {
    app.locals.success = req.flash('success')
    app.locals.err = req.flash('err')
    app.locals.user = req.user
    next()
})

//Establecer Rutas
app.use(require('./routes/'))
app.use(require('./routes/authentication'))
app.use(require('./routes/links'))

//Direccion publica
app.use(express.static(path.join(__dirname, 'public')))

//running server
  http.listen(app.get('port'), () => {
    console.log('Servidor corriendo')
})