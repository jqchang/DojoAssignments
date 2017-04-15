var prodModule = angular.module('products', []);
prodModule.factory('productFactory', function() {
  var products = [
    {name: 'Ninja', price:64.99, qty:3},
    {name: 'Samurai', price:49.99, qty: 50}
  ];
  var factory = {};
  factory.getProducts = function(callback) {
    callback(products);
  }
  factory.deleteProduct = function(prod) {
    products.splice(products.indexOf(prod), 1);
  }
  factory.addProduct = function(prod) {
    if(prod) {
      if(prod.name && prod.price) {
        if(isNaN(Number(prod.price))) {
          return "Price must be a number!";
        }
        else {
          prod.qty = 50;
          prod.price = Number(prod.price);
          console.log(prod);
          products.push(prod);
          return false;
        }
      }
      else return "Please enter a product!"
    }
    else return "Please enter a product!"
  }
  factory.buyProduct = function(prod) {
    if(prod.qty > 0) {
      prod.qty--;
      return true;
    }
    else return prod.name;
  }
  return factory;
});
prodModule.controller('productController', ['$scope', 'productFactory', function($scope, productFactory) {
  $scope.productList = [{name:"Loading...", price:0}];
  $scope.ordering = "price";
  productFactory.getProducts(function(data) {
    $scope.productList = data;
  });
  $scope.add = function() {
    $scope.nanError = productFactory.addProduct($scope.newProduct);
    $scope.newProduct = {};
  }
  $scope.remove = function(prod) {
    productFactory.deleteProduct(prod);
  };
  $scope.order = function(str) {
    if($scope.ordering != str) {
      $scope.ordering = str;
    }
    else {
      $scope.ordering = '-' + str;
    }
  }
}]);
prodModule.controller('orderController', ['$scope', 'productFactory', function($scope, productFactory) {
  $scope.productList = [[{name:"Loading...", price:0}]];
  $scope.errors = [];
  $scope.ordering = "price";
  productFactory.getProducts(function(data) {
    $scope.productList = data;
  });
  $scope.buy = function(prod) {
    var errorcode = productFactory.buyProduct(prod);
    if(errorcode !== true) {
      $scope.errors = [`'${prod.name}' out of stock!`];
    }
    else {
      $scope.errors = [];
    }
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
