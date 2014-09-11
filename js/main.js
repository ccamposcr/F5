var myApp = angular.module("F5App", ["ng"]);
	myApp.controller("mainController", function ($scope, $rootScope){

		$scope.times = ['09-10','10-11','11-12','12-13','13-14','14-15','15-16','16-17','17-18','18-19','19-20','20-21','21-22'];
		var reservations = [];

	   $scope.loadReservations = function (){

		   	for(var i = 0; i < $scope.times.length; i++ ){
				$.ajax({

					type: 'POST',

					url : "../getReservation",

					data: { year: $('#year').val(), month: $('#month').val() , day: ( $('.today').text() ) ? $('.today').text() : '1', time:$scope.times[i]},

					async : false,

					success : function(response){
						reservations.push(jQuery.parseJSON(response));
					}
				});
			}
			//$scope.$apply(function(){
				$scope.reservations = reservations;
				$('#dailyResevations').show();
			//});
		};
		$scope.loadReservations();
	});
