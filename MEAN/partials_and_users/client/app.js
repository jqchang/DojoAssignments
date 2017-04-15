var app = angular.module('myApp', ['ngRoute']);
app.config(function($routeProvider) {
  $routeProvider
  .when('/', {
    templateUrl: 'partials/players.html'
  })
  .when('/teams', {
    templateUrl: 'partials/teams.html'
  })
  .when('/associations', {
    templateUrl: 'partials/associations.html'
  })
  .otherwise({
    redirectTo: '/'
  });
})
app.factory('userFactory', function() {
  var users = [
    {fName:"Justin",lName:"Chang",lang:"JavaScript"}
  ];
  var factory = {};
  factory.getUsers = function(callback) {
    callback(users);
  }
  factory.addUser = function(user) {
    var errors =[];
    if(user) {
      if(!user.fName) {
        errors.push("First name is required!");
      }
      if(!user.lName) {
        errors.push("Last name is required!");
      }
      if(!user.lang) {
        errors.push("Favorite language is required!");
      }
    }
    else {
      errors.push("First name is required!");
      errors.push("Last name is required!");
      errors.push("Favorite language is required!");
    }
    if(!errors.length) {
      users.push(user);
      return true;
    }
    else {
      return(errors);
    }
  }
  factory.deleteUser = function(user) {
    users.splice(users.indexOf(user), 1);
  }
  return factory;
});

app.controller('CustomizeUsersController',['$scope', 'userFactory', '$location', function($scope, userFactory, $location) {
  $scope.userList = [];
  $scope.errors = [];
  $scope.ordering = "lName";
  userFactory.getUsers(function(data) {
    $scope.userList = data;
  });
  $scope.add = function() {
    var errorcode = userFactory.addUser($scope.newUser);
    if(errorcode !== true) {
      $scope.errors = errorcode;
    }
    else {
      $scope.errors = [];
    }
    $scope.newUser = {};
    $location.url('/userlist');
  }
  $scope.delete = function(user) {
    userFactory.deleteUser(user);
  }
  $scope.order = function(str) {
    if($scope.ordering != str) {
      $scope.ordering = str;
    }
    else {
      $scope.ordering = '-' + str;
    }
  }
}]);

app.controller('UserListsController', ['$scope', 'userFactory', function($scope, userFactory) {
  $scope.userList = [];
  $scope.errors = [];
  $scope.ordering = "lName";
  userFactory.getUsers(function(data) {
    $scope.userList = data;
  });
  $scope.order = function(str) {
    if($scope.ordering != str) {
      $scope.ordering = str;
    }
    else {
      $scope.ordering = '-' + str;
    }
  }
}]);
