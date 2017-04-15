var mongoose = require('mongoose');

var PeopleSchema = new mongoose.Schema({
  name: {type: String, required: true},
});

var People = mongoose.model('People', PeopleSchema);
