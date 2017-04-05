function Deck() {
  this.cards = this.createDeck();
  this.shuffle(this.cards);
  if(!(this instanceof Deck)) {
    return new Deck()
  }
}
Deck.prototype.createDeck = function() {
  var newDeck = [];
  for(var i = 0; i < 13; i++) {
    for(var j = 0; j < 4; j++) {
      var suitName = "";
      if(j == 0) { suitName = "Clubs"; }
      else if (j == 1) { suitName = "Diamonds" }
      else if (j == 2) { suitName = "Hearts" }
      else if (j == 3) { suitName = "Spades" }
      newDeck.push(new Card(i, suitName));
    }
  }
  return newDeck;
}
Deck.prototype.shuffle = function(arr) {
  // Adapted from https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
  for(var i = arr.length-1; i >= 1; i--) {
    var j = Math.floor(Math.random() * i)
    var temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}
Deck.prototype.list = function() {
  for(var i = 0; i < this.cards.length; i++) {
    console.log(this.cards[i].toString());
  }
}
Deck.prototype.deal = function(num) {
  if (num === undefined) {
    num = 1;
  }
  var draw = []
  for(var i = 0; i < num; i++) {
    draw.push(this.cards.pop());
  }
  return draw;
}


function Card(num, suit) {
  this.num = num || 2;
  this.suit = suit || "Clubs";
  if(!(this instanceof Card)) {
    return new Card()
  }
}
Card.prototype.toString = function() {
  var numString = this.num;
  if(numString === 1) { numString = "Ace" }
  else if(numString === 11) { numString = "Jack" }
  else if(numString === 12) { numString = "Queen" }
  else if(numString === 13) { numString = "King" }
  return `${numString} of ${this.suit}`
}
Card.prototype.toImg = function() {
  var numString = this.num;
  if(numString === 11) { numString = "j" }
  else if(numString === 12) { numString = "q" }
  else if(numString === 13) { numString = "k" }
  return `<img src='cards-png/${this.suit.toLowerCase()[0]}${numString}.png' alt=${this.toString()}>`;
}

function Player(name) {
  this.name = name;
  this.hand = [];
  if(!(this instanceof Player)) {
    return new Player()
  }
}
Player.prototype.draw = function(deck, num) {
  var newCards = deck.deal(num);
  for(var i = 0; i < newCards.length; i++) {
    if(newCards[i]) {
      this.hand.push(newCards[i]);
    }
  }
}
Player.prototype.discard = function(num) {
  if(num === undefined) { num = 1; }
  for(var i = 0; i < num; i++) {
    this.hand.pop();
  }
}
Player.prototype.showHand = function() {
  console.log(`${this.name}'s hand:`);
  for(var i = 0; i < this.hand.length; i++) {
    console.log(this.hand[i].toString());
  }
}
Player.prototype.handTotal = function() {
  var sum = 0;
  for(var i = 0; i < this.hand.length; i++) {
    sum += this.hand[i].num;
  }
  return sum;
}


var myDeck = new Deck();
var player = new Player("Justin");
function refreshHand() {
  var handString = "";
  for(var i = 0; i < player.hand.length; i++) {
    handString += `<li>${player.hand[i].toImg()}</li>`
  }
  $('#playerHand ul').html(handString);
  $('#total').html(`${player.handTotal()}`);
}
$('#playerHand').append(`<p>${player.name}'s hand (Total: <span id='total'>0</span>):</p>`);
$('#playerHand').append("<ul></ul>")
$('#draw').click(function() {
  player.draw(myDeck);
  refreshHand();
});
$('#discard').click(function() {
  player.discard();
  refreshHand();
})
