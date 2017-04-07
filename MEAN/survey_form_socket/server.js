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

io.sockets.on('connection', function(socket){
  console.log("Received connection from", socket.id);
  socket.on("posting_form", function(data) {
    var lucky = Math.floor(Math.random()*1000+1);
    socket.emit("updated_message", {
      name: data.name,
      location: data.location,
      language: data.language,
      comment: data.comment,
    });
    socket.emit("random_number", {lucky:lucky});
  })
});
