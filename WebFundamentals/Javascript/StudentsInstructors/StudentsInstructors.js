var students = [
     {first_name:  'Michael', last_name : 'Jordan'},
     {first_name : 'John', last_name : 'Rosales'},
     {first_name : 'Mark', last_name : 'Guillen'},
     {first_name : 'KB', last_name : 'Tonel'}
]
var users = {
 'Students': [
     {first_name:  'Michael', last_name : 'Jordan'},
     {first_name : 'John', last_name : 'Rosales'},
     {first_name : 'Mark', last_name : 'Guillen'},
     {first_name : 'KB', last_name : 'Tonel'}
  ],
 'Instructors': [
     {first_name : 'Michael', last_name : 'Choi'},
     {first_name : 'Martin', last_name : 'Puryear'}
  ]
 }

function printRoster(arr) {
  for(var student in arr) {
    console.log(arr[student].first_name, arr[student].last_name);
  }
}

function printUsers(arr) {
  for (var category in arr) {
    console.log(category);
    for(var i = 0; i < arr[category].length; i++) {
      console.log(i+1 + " - " + arr[category][i].first_name.toUpperCase() + " " + arr[category][i].last_name.toUpperCase() + " - " + (arr[category][i].first_name.length+arr[category][i].last_name.length));
    }
  }
}

printRoster(students);
console.log("----");
printUsers(users);
