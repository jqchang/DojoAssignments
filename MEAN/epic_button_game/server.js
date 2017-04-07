// Initialize Express
var express = require("express");
var app = express();
app.use(express.static(__dirname + '/static'));
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

app.get('/', function(req, res) {
  res.render('index');
});

var server = app.listen(8000, function() {
  console.log("listening on port 8000");
});

var io = require('socket.io').listen(server);
var count = 0;


io.sockets.on('connection', function(socket){
  console.log("Received connection from", socket.id);
  socket.emit("epic_broadcast", {count:count});
  socket.on("epic_pressed", function() {
    count++;
    io.emit("epic_broadcast", {count:count});
  });
  socket.on("reset_pressed", function() {
    count = 0;
    io.emit("reset_broadcast");
  })
});
