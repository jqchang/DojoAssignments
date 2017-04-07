// Initialize Express
var express = require("express");
var app = express();
var bodyParser = require('body-parser');
app.use(express.static(__dirname + '/static'));
app.use(bodyParser.urlencoded({extended:true}));
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

var user;

app.get('/', function(req, res) {
  res.render('index');
});
app.post('/result', function(req, res) {
  console.log(req.body);
  user = req.body;
  res.render('result', {user: user});
});


app.listen(8000);
