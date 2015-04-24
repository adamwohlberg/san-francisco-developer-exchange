var myApp = angular.module('myApp', []);

myApp.controller('MyController', function MyController($scope, $http) {
  $http.get('developers.json').success(function(data) {
		$scope.developers = data;
	});
});
