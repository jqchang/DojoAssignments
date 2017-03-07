var rotate = [1,2,3,4,5,6,7,8,9,0]

function minRotated(arr) {
  var first = 0;
  var last = arr.length-1;

  while(first < last) {
    var mid = Math.floor((first+last)/2);
    if(arr[last]<arr[mid]) {
      first = mid+1;
    }
    else {
      last = mid;
    }
  }
  return arr[mid];
}

console.log(rotate);
console.log(minRotated(rotate));
