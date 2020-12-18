module.exports=function(io){
    io.on('connection', (socket) => {
        console.log('Nuevo usuario conectado');
        socket.on('send message',function(data){
            io.sockets.emit('new message',data)
        })
        socket.on('streaming', (image) => {
            io.emit('play stream', image)
            //console.log(image)
        })
      });
}