var mongoose = require('mongoose');
var Quote = mongoose.model('Quote');

module.exports = {
  show: function(req, res) {
    Quote.find({}, function(err, quotes) {
      res.render('quotes', {quotes: quotes});
    })
  },
  create: function(req, res) {
    var quote = new Quote({poster: req.body.poster, contents: req.body.contents});
    quote.save(function(err) {
      if(err){
        console.log("something went wrong", err);
      } else {
        res.redirect('/quotes');
      }
    })
  }
}
