var mongoose = require('mongoose');

var QuoteSchema = new mongoose.Schema({
  poster: {type: String, required: true},
  contents: {type: String, required: true, maxlength: 100},
}, {timestamps: true});

var Quote = mongoose.model('Quote', QuoteSchema);
