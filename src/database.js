const mysql = require('mysql')
const {promisify} = require('util')

const {database}=require('./keys')

const pool= mysql.createPool(database)

pool.getConnection((err,connection)=>{
    if(err){
        if(err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.err("Conexion A bases de datos detenida")
        }if(err.code === 'ER_CON_COUNT_ERROR') {
            console.err("Número de conexiones a bases de datos superada")
        }if(err.code === 'ECONNREFUSED') {
            console.err("Conexion A bases de datos rechazada")
        }
    }

    if(connection) connection.release();
    console.log('Conexión a bases de datos exitosa')
    return;
})
pool.query = promisify(pool.query)

module.exports=pool