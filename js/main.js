
var myApp = angular.module("F5App", ["ng"]);
myApp.controller("reservationController", function ($scope, $rootScope){
   var base_url = '/F5-git/';
   $scope.timesForReservations = ['08-09','09-10','10-11','11-12','12-13','13-14','14-15','15-16','16-17','17-18','18-19','19-20','20-21','21-22','23-24'];
   $scope.times = ['08:00 a.m.','09:00 a.m.','10:00 a.m.','11:00 a.m.','12:00 m.d','01:00 p.m.','02:00 p.m.','03:00 p.m.','04:00 p.m.','05:00 p.m.','06:00 p.m.','07:00 p.m.','08:00 p.m.','09:00 p.m.','10:00 p.m.'];
	//var path = ( window.location.pathname.replace('/','').replace(/\/$/, '').split('/').length <= 2 ) ? './' : '../';
 	$scope.pitchArray = ['escazu','desamparados'];

   $scope.loadReservations = function (day){
		$.ajax({

			type: 'POST',

			url : base_url + "getReservationByDay",

			data: { year: $('#year').val(), month: $('#month').val() , day: ( day) ? day : $('.today').text()},

			async : true,

			success : function(response){
				$scope.$apply(function(){
					$scope.reservations = $scope.sortReservations(jQuery.parseJSON(response));
					$('#dailyResevations').show();
				});
			}
		});
	}

	$scope.loadPitchsPagination = function (){
		$.ajax({

			type: 'POST',

			url : base_url + "getPitchByGroup",

			data: { group: $scope.pitchArray.indexOf($('#pitch').val()) + 1 },

			async : true,

			success : function(response){
				$scope.$apply(function(){
					$scope.pitchs = jQuery.parseJSON(response);
					$('#pitchs').show();
				});
			}
		});
	}

	$scope.sortReservations = function (data){
		var reservations = [];

		for(var i=0; i < $scope.timesForReservations.length ; i++){
			reservations[i] = new Array();
		}

		for(i=0; i < $scope.timesForReservations.length ; i++){
			for(var j=0; j < data.length; j++){
				if(data[j].reservation_time === $scope.timesForReservations[i]){
					reservations[i].push(data[j]);
				}
			}
			if( reservations[i].length == 1 && reservations[i][0].type_reservation != 1){
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
	$scope.loadPitchsPagination();
});

myApp.controller("galleryController", function ($scope, $rootScope){

   $scope.loadGallery = function (){
	   	$('#carousel').flexslider({
	    animation: "slide",
	    controlNav: false,
	    animationLoop: true,
	    slideshow: false,
	    itemWidth: 150,
	    itemMargin: 5,
	    asNavFor: '#slider'
	  });
	   
	  $('#slider').flexslider({
	    animation: "slide",
	    controlNav: false,
	    animationLoop: true,
	    slideshow: false,
	    sync: "#carousel"
	  });
	  
	   /*$('.flexslider').flexslider({
		    animation: "slide",
		    controlNav: "thumbnails"
	  	});*/
   };

});

myApp.controller("headerController", function ($scope, $rootScope){

   $scope.setActive = function (){
   		if( !!window.location.href.match('reservaciones') || !!window.location.href.match('admin')){
   			$('#navPrincipal .reservaciones').addClass('active');
   		}
   		else if ( !!window.location.href.match('galeria') ){
   			$('#navPrincipal .galeria').addClass('active');
   		}
   		else{
   			$('#navPrincipal .home').addClass('active');
   		}
   };

});

/* Directives */

myApp.directive('loadDay', ['$document', function($document) {
    return function(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        scope.loadReservations($(this).text());
      });

    };
  }]);


myApp.directive('available', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        //console.log('Reservando ...');
      });

    }
    return {
    	restrict : 'C',
    	link:link
	}
  }]);