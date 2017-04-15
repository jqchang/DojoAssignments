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
  types: [{type: String, maxlength: 20}],
  moves: [{type: String, maxlength: 20}],
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

// GET '/mongooses/edit/:id' Should show a form to edit an existing mongoose.
app.get('/pokemon/edit/:id', function(req, res){
  console.log(req.params.id);
  Pokemon.findOne({_id:req.params.id}, function(err, pkmn) {
    console.log("checkpoint 1")
    if(err) {
      console.log("error in READ:id")
    } else {
      console.log("attempting to send view");
      console.log(pkmn);
      res.render('edit', {pkmn:pkmn});
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
  Pokemon.findOne({_id:req.params.id}, function(err, pkmn) {
    console.log("checkpoint 1")
    if(err) {
      console.log("error in READ:id")
    } else {
      console.log("attempting to send view");
      console.log(pkmn);
      res.render('view', {pkmn:pkmn});
    }
  })
});

// POST '/mongooses' Should be the action attribute for the form in the above route (GET '/mongooses/new').
app.post('/pokemon', function(req, res) {
  console.log("POST DATA", req.body);
      // This is where we would add the user from req.body to the database.
  var pkmn = new Pokemon({name: req.body.name, types: [req.body.type1, req.body.type2], moves:[req.body.move1,req.body.move2,req.body.move3,req.body.move4]});

  pkmn.save(function(err){
    if(err) {
      console.log('something went wrong in post /submit save');
    } else {
      console.log('successfully added a quote!');
      res.redirect('/');
    }
  })
});

// POST '/mongooses/:id' Should be the action attribute for the form in the above route (GET '/mongooses/edit/:id').
app.post('/pokemon/:id', function(req, res) {
  console.log("POST DATA", req.body);
      // This is where we would add the user from req.body to the database.
  Pokemon.findOne({_id:req.params.id}, function(err, pkmn) {
    if(err) {
      console.log("error in UPDATE:id")
    }
    else {
      pkmn.name = req.body.name;
      pkmn.types = [req.body.type1, req.body.type2];
      pkmn.moves = [req.body.move1, req.body.move2, req.body.move3, req.body.move4];
      pkmn.save(function(err) {
        if(err) {
          console.log('error in UPDATE:id post-find')
        }
        else {
          res.redirect(`/pokemon/${req.params.id}`)
        }
      });
    }
  });
});

// POST '/mongooses/destroy/:id' Should delete the mongoose from the database by ID.
app.post('/pokemon/destroy/:id', function(req, res) {
  Pokemon.deleteOne({_id:req.params.id}, function(err, pkmn) {
    if(err) {
      console.log("error in DELETE:id")
    }
    else {
      res.redirect('/')
    }
  })
})


// Setting our Server to Listen on Port: 8000
app.listen(8000, function() {
    console.log("listening on port 8000");
})
