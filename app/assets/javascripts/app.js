var myApp = angular.module('myApp', [
	'ngRoute',
	'templates',
	'developerControllers',
	'contractControllers',
	'ngTouch',
	'ngAnimate'
	]);

myApp.config(['$routeProvider', function($routeProvider) {
	$routeProvider.
	when('/list_developers/:id', {
		templateUrl: 'developers/list_developers.html',
		controller: 'ListDevelopersController'
	}).
	when('/list_contracts/:id', {
		templateUrl: 'contracts/list_contracts.html',
		controller: 'ListContractsController'
	}).
	when('/list_developers', {
		templateUrl: 'developers/list_developers.html',
		controller: 'ListDevelopersController'
	}).
	when('/list_developers/', {
		templateUrl: 'developers/list_developers.html',
		controller: 'ListDevelopersController'
	}).
	when('/list_contracts', {
		templateUrl: 'contracts/list_contracts.html',
		controller: 'ListContractsController'
	}).
	when('/list_contracts/', {
		templateUrl: 'contracts/list_contracts.html',
		controller: 'ListContractsController'
	}).
	when('my_contracts/', {
		templateUrl: 'contracts/list_contracts.html',
		controller: 'ListContractsController'
	}).
	otherwise({
		redirectTo: '/list_developers/1'
	});
}]);


