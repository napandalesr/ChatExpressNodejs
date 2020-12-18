const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy

const pool = require('../database')
const helpers = require('../lib/helpers')

passport.use('local.signin', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async (req, username, password, done) => {
    const rows = await pool.query('SELECT * FROM users   WHERE username = ?', [username])
    if (rows.length > 0) {
        const user = rows[0]
        const valid = await helpers.matchPassword(password, user.password)
        if (valid) {
            done(null, user, req.flash('success', 'Bienvenido ' + user.name))
        } else {
            done(null, false, req.flash('err', 'Contraseña incorrecta'))
        }
    } else {
        done(null, false, req.flash('err', 'El usuario no existe'))
    }
}))

passport.use('local.signup', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async (req, username, password, done) => {
    const { name, lastname, idRole } = req.body
    console.log(req.body)
    const newUser = {
        username,
        password,
        name,
        lastname,
        idRole
    }
    newUser.password = await helpers.encryptPassword(password)
    const result = await pool.query('INSERT INTO users set ?', [newUser])
    newUser.id = result.insertId
    return done(null, newUser)
}))

passport.serializeUser((user, done) => {
    done(null, user.id)
})

passport.deserializeUser(async (id, done) => {
    const rows = await pool.query('SELECT * FROM users where id = ?', [id])
    done(null, rows[0])
})