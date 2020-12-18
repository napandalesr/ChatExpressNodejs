const express = require('express');
const routes = express.Router();
const passport = require('passport');

const pool = require('../database')
const helpers = require('../lib/helpers')
const time = require('../lib/handlebars')
const {isLoggedIn} = require('../lib/usth')

routes.get('/login', (req, res) => {

    res.render('auth/login')
})

routes.get('/register', async (req, res) => {
    const data = await pool.query('SELECT * FROM roles')
    res.render('auth/register', { data: data })
})

routes.get('/chat',isLoggedIn, async (req, res) => {
    const data = await pool.query('SELECT * FROM roles')
    res.render('auth/chat', { data: data })
})

routes.post('/sendMesagge',isLoggedIn, async (req, res) => {
    const {idUser, message, username,idRole}=req.body
    const data={
        idUser,
        message,
    }
    
    const result= await pool.query('INSERT INTO messages set ?',[data])
    
    const result2= await pool.query('SELECT * FROM messages WHERE id= ?',[result.insertId])
    const result3= await pool.query('SELECT * FROM roles WHERE id= ?',[idRole])
    //console.log(result2[0].created_at)
    //const time1= time.timeago(result2[0].created_at)
    const data2={
        idUser,
        message,
        username,
        role:result3[0].nameRole,
        timestamp:result2[0].created_at
    }
   res.send(data2)
})

routes.post('/updateTime',isLoggedIn, async (req, res) => {
    const {timestamp}=req.body
    const time1= time.timeago(timestamp)
   res.send(time1)
})

routes.post('/register', async (req, res, next) => {
    const {username}=req.body
    console.log(username)
    const resp= await pool.query('SELECT * FROM users WHERE username= ?',[username])
    if(resp.length>0){
        req.flash('err','el usuario ya se encuentra registrado')
        res.redirect('/register')
    }else{
        passport.authenticate('local.signup', {
            successRedirect: '/perfil',
            failureRedirect: '/login',
            failureFlash: true
        })(req, res, next);
    }
    
})

routes.post('/login',
    passport.authenticate('local.signin', {
        successRedirect: '/chat',
        failureRedirect: '/login',
        failureFlash: true
    }))

routes.get('/perfil',isLoggedIn, async (req, res) => {
    const data = await pool.query('SELECT * FROM roles')
    res.redirect('login')
})


routes.get('/camera',isLoggedIn, async (req, res) => {
    res.render('camera')
})

routes.get('/historial',isLoggedIn, async (req, res) => {
    const data = await pool.query('SELECT users.username,roles.nameRole,messages.message FROM users,roles,messages WHERE users.id=messages.idUser AND roles.id=users.idRole ORDER BY users.id')
    res.render('historial',{ data: data })
})

routes.get('/logout',isLoggedIn, async (req, res) => {
    req.logOut()
    res.render('auth/login')
})

module.exports = routes;