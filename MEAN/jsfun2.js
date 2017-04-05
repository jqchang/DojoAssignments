function arrMath(arr) {
  this.numbers = arr;
  this.sum = function(x, y) {
    var total = 0;
    for(var i = x; i <= y; i++) {
      total += i;
    }
    return total;
  }
  this.min = function() {
    var minVal = this.numbers[0];
    for(var i = 1; i < this.numbers.length; i++) {
      if(this.numbers[i] < minVal) {
        minVal = this.numbers[i]
      }
    }
    return minVal;
  }
  this.avg = function() {
    var sum = 0;
    for(var i = 0; i < this.numbers.length; i++) {
      sum += this.numbers[i];
    }
    return sum/this.numbers.length;
  }
}

function personConstructor(name) {
  var dude = {
    name: name,
    distance_traveled: 0,
    say_name: function() {
      console.log(this.name);
      return this;
    },
    say_something: function(str) {
      console.log(`${this.name} says '${str}'`);
      return this;
    },
    walk: function() {
      this.distance_traveled += 3
      console.log(`${this.name} is walking`);
      return this;
    },
    run: function() {
      this.distance_traveled += 10
      console.log(`${this.name} is running`);
      return this;
    },
    crawl: function() {
      this.distance_traveled += 1
      console.log(`${this.name} is crawling`);
      return this;
    }
  }
  return dude;
}

function ninjaConstructor(name, cohort) {
  var shinobi = {
    name: name,
    cohort: cohort,
    belt: "yellow",
    levelUp: function() {
      if(this.belt == "yellow") {
        this.belt = "red";
      } else if (this.belt == "red") {
        this.belt = "black";
      }
      return this;
    }
  }
  return shinobi;
}

var test = new arrMath([1,3,5]);
console.log("sum:", test.sum(1,2));
console.log("min:", test.min());
console.log("avg:", test.avg());
var guy = personConstructor("Guy")
guy.say_name();
guy.run().walk().say_something("YAY");

var assassin = ninjaConstructor("Koroshi", "Jan17");
console.log(assassin.belt);
console.log(assassin.levelUp().belt);
