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
  .when('/showteam/:teamname', {
    templateUrl: 'partials/showteam.html'
  })
  .otherwise({
    redirectTo: '/'
  });
})
app.factory('playerFactory', function() {
  var factory = {};
  var players = [];
  factory.getPlayers = function(callback) {
    callback(players);
  }
  factory.addPlayer = function(player) {
    var errors =[];
    if(player) {
      if(!player.name) {
        errors.push("Name is required!");
      }
    }
    else {
      errors.push("Name is required!");
    }
    if(!errors.length) {
      player.team = "";
      players.push(player);
      return true;
    }
    else {
      return(errors);
    }
  }
  factory.addTeam = function(player, newteam) {
    player.team = newteam;
  }
  factory.clearTeam = function(player) {
    player.team = "";
  }
  factory.deletePlayer = function(player) {
    players.splice(players.indexOf(player), 1);
  }
  return factory;
});

app.factory('teamFactory', function() {
  var factory = {};
  var teams = [];
  factory.getTeams = function(callback) {
    callback(teams);
  }
  factory.addTeam = function(team) {
    var errors =[];
    if(team) {
      if(!team.name) {
        errors.push("Name is required!");
      }
    }
    else {
      errors.push("Name is required!");
    }
    if(!errors.length) {
      teams.push(team);
      return true;
    }
    else {
      return(errors);
    }
  }
  factory.deleteTeam = function(team) {
    teams.splice(teams.indexOf(team), 1);
  }
  return factory;
});

app.controller('PlayersController',['$scope', 'playerFactory', function($scope, playerFactory) {
  $scope.playerList = [];
  $scope.errors = [];
  $scope.ordering = "name";
  playerFactory.getPlayers(function(data) {
    $scope.playerList = data;
  });
  $scope.add = function() {
    var errorcode = playerFactory.addPlayer($scope.newPlayer);
    if(errorcode !== true) {
      $scope.errors = errorcode;
    }
    else {
      $scope.errors = [];
    }
    $scope.newPlayer = {};
  }
  $scope.delete = function(player) {
    playerFactory.deletePlayer(player);
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

app.controller('TeamsController', ['$scope', 'teamFactory', function($scope, teamFactory) {
  $scope.teamList = [];
  $scope.errors = [];
  $scope.ordering = "name";
  teamFactory.getTeams(function(data) {
    $scope.teamList = data;
  });
  $scope.add = function() {
    var errorcode = teamFactory.addTeam($scope.newTeam);
    if(errorcode !== true) {
      $scope.errors = errorcode;
    }
    else {
      $scope.errors = [];
    }
    $scope.newTeam = {};
  }
  $scope.delete = function(player) {
    teamFactory.deleteTeam(player);
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

app.controller('AssociationsController', ['$scope', 'playerFactory', 'teamFactory', function($scope, playerFactory, teamFactory) {
  $scope.teamList = [];
  $scope.playerList = []
  $scope.errors = [];
  $scope.ordering = "name";
  playerFactory.getPlayers(function(data){
    $scope.playerList = data;
  })
  teamFactory.getTeams(function(data) {
    $scope.teamList = data;
  });
  $scope.addToTeam = function() {
    playerFactory.addTeam($scope.player, $scope.team);
  }
  $scope.clear = function(player) {
    playerFactory.clearTeam(player);
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

app.controller('ShowTeamController', ['$scope', 'playerFactory', '$routeParams', function($scope, playerFactory, $routeParams) {
  $scope.playerList = []
  $scope.team = $routeParams
  $scope.ordering = "name";
  playerFactory.getPlayers(function(data){
    $scope.playerList = data;
  });
  $scope.order = function(str) {
    if($scope.ordering != str) {
      $scope.ordering = str;
    }
    else {
      $scope.ordering = '-' + str;
    }
  }
  $scope.clear = function(player) {
    playerFactory.clearTeam(player);
  }
}]);
