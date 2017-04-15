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

var mongoose = require("mongoose");
mongoose.connect('mongodb://localhost/message_board')
var Schema = mongoose.Schema;

var PostSchema = new mongoose.Schema({
  name: {type: String, required: true, minlength: 4},
  text: {type: String, required: true},
  comments: [{type: Schema.Types.ObjectId, ref: "Comment"}]
}, {timestamps: true});

var CommentSchema = new mongoose.Schema({
  _post: {type: Schema.Types.ObjectId, ref: 'Post'},
  name: { type: String, required: true, minlength: 4},
  text: { type: String, required: true },
}, {timestamps: true});

mongoose.model('Post', PostSchema);
mongoose.model('Comment', CommentSchema)

var Post = mongoose.model('Post');
var Comment = mongoose.model('Comment');


// Routes
// Root Request
app.get('/', function(req, res) {
  Post.find({}).populate('comments').exec(function(err, posts) {
    res.render('index', {posts:posts});
  });
});

app.post('/msgsubmit', function(req, res) {
  var msg = new Post({name:req.body.msg_name, text:req.body.msg_content});
  msg.save(function(err) {
    if(err) {
      console.log(err);
      Post.find({}).populate('comments').exec(function(err, posts) {
        res.render('index', {errors:msg.errors, posts:posts});
      });
    } else {
      res.redirect('/');
    }
  })
});

app.post('/comment/:id', function(req, res) {
  Post.findOne({_id:req.params.id}, function(err, post) {
    var comment = new Comment({name: req.body.comment_name, text: req.body.comment_text, _post: req.params.id});
    post.comments.push(comment);
    comment.save(function(err) {
      post.save(function(err) {
        if(err) {
          console.log("Error");
          console.log(post.errors);
          console.log(comment.errors);
          res.render('index', {errors:comment.errors, posts:posts});
        }
        else {res.redirect('/'); }
      })
    });
  })
});

// Setting our Server to Listen on Port: 8000
app.listen(8000, function() {
    console.log("listening on port 8000");
})
