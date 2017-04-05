var x = [3,5,"Dojo", "rocks", "Michael", "Sensei"]
for (i in x) {
  console.log(x[i]);
}
x.push(100)
x.push(["hello", "world", "JavaScript is Fun"])
console.log(x)

var sum = 0;
for (i = 1; i <=500; i++) {
  sum += i;
}
console.log("sum", sum);

var arr = [1,5,90,25, -3, 0];
var min = arr[0];
for (var i = 1; i < arr.length; i++) {
  if (arr[i] < min) {
    min = arr[i];
  }
}
console.log("min", min);

var sum = 0;
for (var j = 0; j < arr.length; j++) {
  sum += arr[j];
}
console.log(sum/arr.length);

var newNinja = {
  name: "Jessica",
  profession: "coder",
  favorite_language: "JavaScript",
  dojo: "Dallas"
}
for (i in newNinja) {
  console.log(i, ":", newNinja[i]);
}
