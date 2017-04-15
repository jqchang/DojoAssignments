function combinedArray(arr1, arr2) {
  var newArr = [];
  var i1 = 0;
  var i2 = 0;
  while(newArr.length < arr1.length + arr2.length) {
    if(!arr1[i1]) {
      newArr.push(arr2[i2]);
      i2++;
    }
    else if(!arr2[i2]) {
      newArr.push(arr1[i1]);
      i1++;
    }
    else if(arr1[i1]>arr2[i2]) {
      newArr.push(arr2[i2]);
      i2++;
    }
    else {
      newArr.push(arr1[i1]);
      i1++;
    }
  }
  return newArr;
}

function mergeSort(arr) {
  if(arr.length <= 1) {
    return arr;
  }
  else {
    return combinedArray(mergeSort(arr.slice(0,Math.ceil(arr.length/2))), mergeSort(arr.slice(Math.ceil(arr.length/2), arr.length)));
  }
}

// console.log(combinedArray([3,8], [2,4,7,11]));
console.log(mergeSort([3,8,2,4,7,11,-1,22]));
