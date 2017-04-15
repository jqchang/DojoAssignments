var mongoose = require('mongoose');
var People = mongoose.model('People');

module.exports = {
  show: function(req, res) {
    People.find({}, function(err, ppl) {
      if(err) {
        console.log("error in root")
      } else {
        res.json({people:ppl});
      }
    })
  },
  create: function(req, res) {
    console.log("GET DATA", req.params.name);
        // This is where we would add the user from req.body to the database.
    var ppl = new People({name: req.params.name});

    ppl.save(function(err){
      if(err) {
        console.log('something went wrong in post /submit save');
      } else {
        console.log('successfully added an animal!');
        res.json({people:ppl});
      }
    })
  },
  view: function(req, res) {
    People.findOne({name:req.params.name}, function(err, ppl) {
      console.log("checkpoint 1")
      if(err) {
        console.log("error in READ:id")
      } else {
        console.log("attempting to send view");
        console.log(ppl);
        res.json({people:ppl});
      }
    });
  },
  destroy: function(req, res) {
    People.deleteOne({name:req.params.name}, function(err, ppl) {
      if(err) {
        console.log("error in DELETE:id")
      }
      else {
        res.redirect('/')
      }
    });
  }
}
