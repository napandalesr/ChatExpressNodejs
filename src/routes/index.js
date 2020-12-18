const express = require('express');
const routes= express.Router();
//Ruta principal
routes.get('/',(req,res)=>{
    res.send("Hola mundo")
})

module.exports=routes;