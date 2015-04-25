var developerControllers = angular.module('developerControllers', []);

developerControllers.controller('ListDevelopersController', function($scope, $http, $routeParams, $location) {
  page_id = $routeParams.id;
  console.log($routeParams);
  $scope.init = function() {
    $http({
        url: 'developers.json?page=' + page_id, 
        method: "GET"
     }).success(function(data) {
      $scope.developers = data;
    });
  }
  $scope.quantity = 10;
  $scope.first = function() {
    page_id = 1;
    $location.path('list_developers/' + page_id)
  }
  $scope.page1 = function() {
    page_id = 1;
    $location.path('list_developers/' + page_id)
  }
  $scope.page2 = function() {
    page_id = 2;
    $location.path('list_developers/' + page_id)
  }
  $scope.page3 = function() {
    page_id = 3;
    $location.path('list_developers/' + page_id)
  }
  $scope.next = function() {
    page_id = parseInt(page_id) + 1;
    $location.path('list_developers/' + page_id)
  }
  $scope.prev = function() {
    page_id = parseInt(page_id) - 1;
    $location.path('list_developers/' + page_id)
  }
  $scope.unstarIt = function(developer_id) {
    console.log('unfavorite it'); 
    destroy_employer_favorite(developer_id);
  };
  $scope.swipeLeft = function(developer_id) {
      console.log('unfavorite it'); 
      destroy_employer_favorite(developer_id);
  };
  $scope.starIt = function(developer_id) {
    console.log('star it');
    create_employer_favorite(developer_id);
  };
  $scope.swipeRight = function(developer_id) {
    console.log('star it');
    create_employer_favorite(developer_id);
  };
  function create_employer_favorite(developer) {
      data = {}
      data.developer_id = developer.id
      $http.post('/employer_favorites/', data).
        success(function(data) {
          // update the $scope.developers model
          developer.favorited = true;
          console.log(developer);
          console.log('success');
        }).
        error(function() {
          console.log(developer); 
          console.log('error');      
        });
  };
  function destroy_employer_favorite(developer) {
      data = {}
      data.developer_id = developer.id
      $http.post('/employer_favorites/destroy', data).
        success(function() {
          // update the $scope.developers model
          developer.favorited = false;
          console.log(developer);
          console.log('success');
        }).
        error(function() {
          console.log(developer); 
          console.log('error');      
        });
  };
  function create_employer_block(developer) {
      data = {}
      data.developer_id = developer.id
      $http.post('/employer_block/', data).
        success(function(data) {
          // update the $scope.developers model
          developer.blocked = true;
          console.log(developer);
          console.log('success');
        }).
        error(function() {
          console.log(developer); 
          console.log('error');      
        });
  };
  function destroy_employer_block(developer) {
      data = {}
      data.developer_id = developer.id
      $http.post('/employer_block/destroy', data).
        success(function() {
          // update the $scope.developers model
          developer.blocked = false;
          console.log(developer);
          console.log('success');
        }).
        error(function() {
          console.log(developer); 
          console.log('error');      
        });
  };

});  //end DeveloperController which includes $http


var contractControllers = angular.module('contractControllers', []);

contractControllers.controller('ListContractsController', function($scope, $http, $routeParams, $location) {
  page_id = $routeParams.id;
  console.log($routeParams);
  $scope.init = function() {
    $http({
        url: 'contracts.json?page=' + page_id, 
        method: "GET"
     }).success(function(data) {
      $scope.contracts = data;
    });
  }
  $scope.quantity = 10;
  
  $scope.first = function() {
    page_id = 1;
    $location.path('list_contracts/' + page_id)
  }
  $scope.page1 = function() {
    page_id = 1;
    $location.path('list_contracts/' + page_id)
  }
  $scope.page2 = function() {
    page_id = 2;
    $location.path('list_contracts/' + page_id)
  }
  $scope.page3 = function() {
    page_id = 3;
    $location.path('list_contracts/' + page_id)
  }
  $scope.next = function() {
    page_id = parseInt(page_id) + 1;
    $location.path('list_contracts/' + page_id)
  }
  $scope.prev = function() {
    page_id = parseInt(page_id) - 1;
    $location.path('list_contracts/' + page_id)
  }
  $scope.unstarIt = function(contract_id) {
    console.log('delete it'); 
    destroy_developer_favorite(contract_id);
  };
  $scope.swipeLeft = function(contract_id) {
    console.log('delete it'); 
    destroy_developer_favorite(contract_id);
  };
  $scope.starIt = function(contract_id) {
    console.log('star it');
    create_developer_favorite(contract_id);
  };
  $scope.swipeRight = function(contract_id) {
    console.log('star it');
    create_developer_favorite(contract_id);
  };
  function create_developer_favorite(contract) {
      data = {}
      data.contract_id = contract.id
      $http.post('/developer_favorites/', data).
        success(function() {
          // update the $scope.developers model
          contract.favorited = true;
          console.log(contract);
          console.log('success');
        }).
        error(function() {
          console.log(contract); 
          console.log('error');      
        });
  };

  function destroy_developer_favorite(contract) {
      data = {}
      data.contract_id = contract.id
      $http.post('/developer_favorites/destroy', data).
        success(function() {
          // update the $scope.developers model
          contract.favorited = false;
          console.log(contract);
          console.log('success');
        }).
        error(function() {
          console.log(contract); 
          console.log('error');      
        });
  };

});  //end ContractController which includes $http


developerControllers.controller('TabController', function(){

    this.tab = 1;

    this.setTab = function(newValue){
      this.tab = newValue;
    };

    this.isSet = function(tabName){
      return this.tab === tabName;
    };
  });

developerControllers.controller('ReviewController', function() {
    this.review = {};
    this.addReview = function(developer) {
      developer.reviews.push(this.review);
      this.review = {};
    };
 
  });






