
var myApp = angular.module("F5App", ["ng"]);
myApp.controller("reservationController", function ($scope, $rootScope){

	$scope.times = ['09-10','10-11','11-12','12-13','13-14','14-15','15-16','16-17','17-18','18-19','19-20','20-21','21-22'];
	

   $scope.loadReservations = function (){
		$.ajax({

			type: 'POST',

			url : "../getReservationByDay",

			data: { year: $('#year').val(), month: $('#month').val() , day: ( $('.today').text() ) ? $('.today').text() : '1'},

			async : true,

			success : function(response){
				$scope.$apply(function(){
					$scope.reservations = $scope.loadReservationsArray(jQuery.parseJSON(response));
					$('#dailyResevations').show();
				});
			}
		});
	}

	$scope.loadReservationsArray = function (data){
		var reservations = [];

		for(var i=0; i < $scope.times.length ; i++){
			for(var j=0; j < data.length; j++){
				if(data[j].reservation_time === $scope.times[i]){
					reservations[i] = data[j];
					break;
				}
				else{
					reservations[i] = {};
				}
			}
		}
		return reservations;
	}

	$scope.loadReservations();
});
