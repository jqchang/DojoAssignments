function intToRoman(num) {
  var roman = "";
  var remainder = num;
  var letters = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
  var numbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];

  for(var i = 0; i < numbers.length; i++) {
    var times = Math.floor(remainder/numbers[i]);
    for(var j = 0; j < times; j++) {
      roman += letters[i];
    }
    remainder -= times*numbers[i];
  }
  // Test case: 4
  // 4/5 < 1
  // 4/4 = 1
  // n/Letter < 1 and n/(Letter-1) == 1
  return roman;
}

console.log(intToRoman(1904));
