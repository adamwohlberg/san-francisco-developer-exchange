$scope.like = function() {
    $http({
        url: 'developers.json?page=' + page_id, 
        method: "GET"
     }).success(function(data) {
        if(data.favorite==true){
      $scope.developers = data;
  }else{$scope.developers = data;
       }
}