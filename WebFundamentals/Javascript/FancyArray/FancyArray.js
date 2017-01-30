function fancyArray(arr, symbol, reversed) {
  if(symbol === undefined) {
    symbol = "->";
  }
  if(reversed === undefined) {
    reversed = false;
  }
  if(reversed) {
    for(var i = arr.length-1; i >= 0; i--) {
        console.log(i + " " + symbol + " " + arr[i]);
    }
  }
  else {
    for(var i = 0; i < arr.length; i++) {
      console.log(i + " " + symbol + " " + arr[i]);
    }
  }
}

var x = ["James","Jill","Jane","Jack"];
fancyArray(x, "~~~~", true);
