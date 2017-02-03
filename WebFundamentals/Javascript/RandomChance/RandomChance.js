function slots(quarters, leave) {
  var timesPlayed = 0;
  if(leave === undefined) {
    leave = Infinity;
  }
  while(quarters > 0 && quarters < leave) {
    var winChance = Math.random()*100;
    if(winChance < 1) {
      var winnings = Math.trunc(Math.random()*50+50);
      quarters += winnings;
      if(leave === Infinity) {
        break;
      }
    }
    quarters--;
    timesPlayed++;
  }
  console.log("You played " + timesPlayed + " times.");
  return quarters;
}

var moneyLeft = slots(100, 300);
console.log("You left with " + moneyLeft + " quarters.");
