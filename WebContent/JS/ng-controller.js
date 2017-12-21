var app=angular.module("myApp",[]);
app.controller("myController",function($scope,$interval,$filter){
	
	
	$('[data-toggle="tooltip"]').tooltip(); 
	var tick = function() {
	    $scope.currentTime = Date.now();
	  }
	  tick();
	  $interval(tick, 1000);
	
	  $scope.ddMMMMyyyy = $filter('date')(new Date(), 'dd, MMMM yyyy');
	  $(document).ready(function () {

		    $('#sidebarCollapse').on('click', function () {
		        $('#sidebar').toggleClass('active');
		    });

		});
	
	
});