
var F5App = angular.module("F5App", ["ng"]);

/* ==========================================================================
   ANGULARJS CONTROLLERS
========================================================================== */

F5App.controller("reservationController", function ($scope, $rootScope){
   var base_url = '/F5-git/';
   $scope.timesForReservations = ['08-09','09-10','10-11','11-12','12-13','13-14','14-15','15-16','16-17','17-18','18-19','19-20','20-21','21-22','23-24'];
   $scope.times = ['08:00 a.m.','09:00 a.m.','10:00 a.m.','11:00 a.m.','12:00 m.d','01:00 p.m.','02:00 p.m.','03:00 p.m.','04:00 p.m.','05:00 p.m.','06:00 p.m.','07:00 p.m.','08:00 p.m.','09:00 p.m.','10:00 p.m.'];
	//var path = ( window.location.pathname.replace('/','').replace(/\/$/, '').split('/').length <= 2 ) ? './' : '../';

   $scope.loadReservations = function (day){
		$.ajax({

			type: 'POST',

			url : base_url + "getReservationByDay",

			data: { year: $('#year').val(), month: $('#month').val() , day: (day) ? day : $('.today').text(), group_id : $scope.getGroupFromUrl(), pitch_id : $scope.getPitchFromUrl()},

			async : true,

			success : function(response){
				$scope.$apply(function(){
					$scope.reservations = $scope.sortReservations(jQuery.parseJSON(response));
					$('#dailyResevations').show();
				});
			}
		});

		if( !$('.day div.active').length ){
			$('.day div').first().addClass('active');
		}
		//Set day with active day
		$('#day').html($('.day div.active').text());
	}

	$scope.loadPitchsPagination = function (){
		$.ajax({

			type: 'POST',

			url : base_url + "getPitchByGroup",

			data: { group: $scope.getGroupFromUrl()/*$scope.pitchArray.indexOf($('#pitch').val()) + 1*/ },

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

	$scope.getGroupFromUrl = function(){
		var group = null;
		$.ajax({

			type: 'POST',

			url : base_url + "getGroup",

			data: { group_name: window.location.pathname.replace('/','').replace(/\/$/, '').split('/')[1] },

			async : false,

			success : function(response){
				group = jQuery.parseJSON(response)[0].id;
			}
		});
		return group;
	}

	$scope.getPitchFromUrl = function(){
		return window.location.pathname.replace('/','').replace(/\/$/, '').split('/')[2];
	}

	$scope.loadReservations($('.today').text());
	$scope.loadPitchsPagination();
});

F5App.controller("galleryController", function ($scope, $rootScope){

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
   };

});

F5App.controller("headerController", function ($scope, $rootScope){

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

F5App.controller("modalController", function ($scope, $rootScope){
	$('#formReservationModal').on('hidden.bs.modal', function(){
		$scope.$apply(function(){
			$scope.bookingType = '';
		});
	});

	$scope.setReservationState = function (){

	}

});
/* ==========================================================================
   END ANGULARJS CONTROLLERS
========================================================================== */

/* ==========================================================================
   ANGULARJS DIRECTIVES
========================================================================== */

F5App.directive('loadDay', ['$document', function($document) {
    return function(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        $('.day div').removeClass('active');
        $(element).addClass('active')
        $('#dailyResevations').hide();
        scope.loadReservations($(this).text().trim());
      });

    };
  }]);


F5App.directive('available', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        //console.log('Reservando ...');
        $('#formReservationModal').modal();
      });

    }
    return {
    	restrict : 'C',
    	link:link
	}
  }]);

/* ==========================================================================
   END ANGULARJS DIRECTIVES
========================================================================== */

/* ==========================================================================
   APP
========================================================================== */

$(document).ready(function(){
	$('#calendar .header').on('mouseenter', function(){
		$('.days_head, .days_row').show();
	});

	$('#currentDate').on('click', function(){
		$('.days_head, .days_row').show();
	});

	$('#calendar').on('mouseleave', function(){
		$('.days_head, .days_row').hide();
	});
	$('[data-toggle="confirmation"]').confirmation();
});

/* ==========================================================================
   END APP
========================================================================== */