// Require the Express Module
var express = require('express');
// Create an Express App
var app = express();
// Require body-parser (to receive post data from clients)
var bodyParser = require('body-parser');
// Integrate body-parser with our App
app.use(bodyParser.urlencoded({ extended: true }));
// Require path
var path = require('path');
// Setting our Static Folder Directory
app.use(express.static(path.join(__dirname, './static')));
// Setting our Views Folder Directory
app.set('views', path.join(__dirname, './views'));
// Setting our View Engine set to EJS
app.set('view engine', 'ejs');
// Routes
// Root Request

var mongoose = require("mongoose");
mongoose.connect('mongodb://localhost/quoting_dojo_redux')

var QuoteSchema = new mongoose.Schema({
  poster: {type: String, required: true},
  contents: {type: String, required: true, maxlength: 100},
}, {timestamps: true});

mongoose.model('Quote', QuoteSchema);
var Quote = mongoose.model('Quote');

app.get('/', function(req, res) {
  res.render('index');
})

app.get('/quotes', function(req, res) {
    // This is where we will retrieve the users from the database and include them in the view page we will be rendering.
    Quote.find({}).sort({createdAt:-1}).exec(function(err, quotes) {
      if(err) {
        console.log('something went wrong in get / save')
      }
      else {
        res.render('quotes', {quotes:quotes});
      }
    })
})
//Add Quote Request
app.post('/submit', function(req, res) {
    console.log("POST DATA", req.body);
    // This is where we would add the user from req.body to the database.
    var quote = new Quote({poster: req.body.poster, contents: req.body.contents});

    quote.save(function(err){
      if(err) {
        console.log('something went wrong in post /submit save');
      } else {
        console.log('successfully added a quote!');
        res.redirect('/quotes');
      }
    })
})
// Setting our Server to Listen on Port: 8000
app.listen(8000, function() {
    console.log("listening on port 8000");
})
