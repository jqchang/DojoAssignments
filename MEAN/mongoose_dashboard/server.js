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
mongoose.connect('mongodb://localhost/mongoose_dashboard')

var PokemonSchema = new mongoose.Schema({
  name: {type: String, required: true},
  type: {type: String, required: true, maxlength: 100},
}, {timestamps: true});

mongoose.model('Pokemon', PokemonSchema);
var Pokemon = mongoose.model('Pokemon');

// GET '/' Displays all of the mongooses.
app.get('/', function(req, res) {
  Pokemon.find({}, function(err, pkmn) {
    if(err) {
      console.log("error in root")
    } else {
      res.render('index', {pkmn:pkmn});
    }
  })
});

// GET '/mongooses/new' Displays a form for making a new mongoose.
app.get('/pokemon/new', function(req, res) {
  res.render('new');
});

// GET '/mongooses/:id' Displays information about one mongoose.
app.get('/pokemon/:id', function(req, res){
  console.log(req.params.id);
});



/*
POST '/mongooses' Should be the action attribute for the form in the above route (GET '/mongooses/new').
GET '/mongooses/edit/:id' Should show a form to edit an existing mongoose.
POST '/mongooses/:id' Should be the action attribute for the form in the above route (GET '/mongooses/edit/:id').
POST '/mongooses/destroy/:id' Should delete the mongoose from the database by ID.
*/

// Setting our Server to Listen on Port: 8000
app.listen(8000, function() {
    console.log("listening on port 8000");
})
