
var myApp = angular.module("F5App", ["ng"]);
myApp.controller("reservationController", function ($scope, $rootScope){

   $scope.times = ['08-09','09-10','10-11','11-12','12-13','13-14','14-15','15-16','16-17','17-18','18-19','19-20','20-21','21-22','23-24'];
	var path = ( window.location.pathname.replace('/','').replace(/\/$/, '').split('/').length <= 2 ) ? './' : '../';

   $scope.loadReservations = function (day){
		$.ajax({

			type: 'POST',

			url : path + "getReservationByDay",

			data: { year: $('#year').val(), month: $('#month').val() , day: ( day) ? day : $('.today').text()},

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
			reservations[i] = new Array();
		}

		for(i=0; i < $scope.times.length ; i++){
			for(var j=0; j < data.length; j++){
				if(data[j].reservation_time === $scope.times[i]){
					reservations[i].push(data[j]);
				}
			}
			if( reservations[i].length == 1 ){
				reservations[i][1] = {};
			}
			else if( reservations[i].length == 0 ){
				reservations[i][0] = {};
				reservations[i][1] = {};
			}
		}
		return reservations;
	}

	$scope.loadReservations($('.today').text());
});

myApp.directive('loadDay', ['$document', function($document) {
    return function(scope, element, attr) {
      element.on('click', function(event) {
        // Prevent default dragging of selected content
        event.preventDefault();
        scope.loadReservations($(this).text());
      });

    };
  }]);