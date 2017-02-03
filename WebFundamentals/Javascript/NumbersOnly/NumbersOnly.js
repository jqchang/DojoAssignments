var oldArray = [1, "apple", -3, "orange", 0.5];

function numbersOnly(arr) {
  var newArr = [];
  for(var i = 0; i < arr.length; i++) {
    if(typeof arr[i] === "number") {
      newArr.push(arr[i]);
    }
  }
  return newArr;
}

function numbersPurge(arr) {
  var i = 0;
  while(i < arr.length) {
    if(typeof arr[i] === "number") {
      i++;
    }
    else {
      arr.splice(i, 1);
    }
  }
}

console.log("Numbers Only:");
console.log(numbersOnly(oldArray));

console.log("Numbers Purge:");
numbersPurge(oldArray);
console.log(oldArray);
