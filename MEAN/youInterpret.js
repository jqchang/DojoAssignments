// Problem 1:
// Original:
console.log(first_variable);
var first_variable = "Yipee I was first!";
function firstFunc() {
  first_variable = "Not anymore!!!";
  console.log(first_variable);
}
console.log(first_variable);

// Hoisted:
// var first_variable;
// function firstFunc() {
//   first_variable = "Not anymore!!!";
//   console.log(first_variable);
// }
//
// console.log(first_variable);
// first_variable = "Yipee I was first!";
// console.log(first_variable);

/*
Predicted output:
Not anymore!!!
Yipee I was first!

Actual output:
undefined
Yipee I was first!
(mistake: firstFunc() was never run, so first_variable was never assigned "Not anymore!!!")
*/

// Problem 2:
Original:
var food = "Chicken";
function eat() {
  food = "half-chicken";
  console.log(food);
  var food = "gone";       // CAREFUL!
  console.log(food);
}
eat();
console.log(food);

// Hoisted:
// var food;
// function eat() {
//   var food;
//   food = "half-chicken";
//   console.log(food);
//   food = "gone";       // CAREFUL!
//   console.log(food);
// }
// food = "Chicken";
// eat();
// console.log(food);

// Predicted output:
// half-chicken
// gone
// Chicken

// Actual output:
// half-chicken
// gone
// Chicken

// Problem 3:
// Original:
var new_word = "NEW!";
function lastFunc() {
  new_word = "old";
}
console.log(new_word);

// Hoisted:
// var new_word;
// function lastFunc() {
//   new_word = "old";
// }
// new_word = "NEW!";
// console.log(new_word);

// Predicted output:
// NEW!

// Actual output:
// NEW!
