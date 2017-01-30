var total = 0;
var nextPay = 0.01;
var billion = false;

var i = 1;
while(total < Infinity) {
  total += nextPay;
  if(i === 30) {
    console.log("$" + total + " after 30 days.");
  }
  if(total >= 1000000000 && !billion) {
    console.log(i + " days to be a billionaire.");
    billion = true;
  }
  i++;
  nextPay *= 2;
}

console.log(i + " days before infinite money.");
