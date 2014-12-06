var base_url = '/F5-git/';
var F5App = angular.module("F5App", ["ng"]);

/* ==========================================================================
   ANGULARJS CONTROLLERS
========================================================================== */

F5App.controller("reservationController", function ($scope, $rootScope){
   $scope.timesForReservations = ['08-09','09-10','10-11','11-12','12-13','13-14','14-15','15-16','16-17','17-18','18-19','19-20','20-21','21-22','23-24'];
   $scope.times = ['08:00 a.m.','09:00 a.m.','10:00 a.m.','11:00 a.m.','12:00 m.d','01:00 p.m.','02:00 p.m.','03:00 p.m.','04:00 p.m.','05:00 p.m.','06:00 p.m.','07:00 p.m.','08:00 p.m.','09:00 p.m.','10:00 p.m.'];
	//var path = ( window.location.pathname.replace('/','').replace(/\/$/, '').split('/').length <= 2 ) ? './' : '../';

   $rootScope.loadReservations = function (){

	   	if( !$('.day div.active').length ){
			$('.day div').first().addClass('active');
		}
		//Set day as active day
		var day = $('.day div.active').text();
		$('#day').val(day);
		$('#currentDay').html(day);

		$.ajax({

			type: 'POST',

			url : base_url + "getReservationByDay",

			data: $scope.getDataForTemporaryReservation(),

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

			data: { group: $scope.getGroup() },

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
			if( reservations[i].length == 1 && reservations[i][0].type_reservation != 1 && reservations[i][0].team_id == 1 ){
				reservations[i][1] = {};
			}
			else if( reservations[i].length == 1 && reservations[i][0].type_reservation != 1 && reservations[i][0].team_id == 2 ){
				reservations[i][1] = reservations[i][0];
				reservations[i][0] = {};
			}
			else if( reservations[i].length == 0 ){
				reservations[i][0] = {};
				reservations[i][1] = {};
			}
		}
		return reservations;
	}

	$scope.getGroup = function(){
		var group = null;
		$.ajax({

			type: 'POST',

			url : base_url + "getGroup",

			data: { group_name: $('#group').val() || window.location.pathname.replace('/','').replace(/\/$/, '').split('/')[1] },

			async : false,

			success : function(response){
				group = jQuery.parseJSON(response)[0].id;
			}
		});
		return group;
	}

	$scope.getPitch = function(){
		return $('#pitch').val() || window.location.pathname.replace('/','').replace(/\/$/, '').split('/')[2];
	}

	$rootScope.getDataForTemporaryReservation = function(){
		return { 	reservation_year : $('#year').val(), 
					reservation_month : $('#month').val(), 
					reservation_day : $('#day').val(), 
					group_id : $scope.getGroup(), 
					pitch_id : $scope.getPitch(),
					team_id : $('#team_id').val(),
					reservation_time : $('#reservation_time').val()
				};
	}

	$rootScope.getDataForReservation = function(){
		var data = $scope.getDataForTemporaryReservation();
		data.name = $rootScope.fields.name;
		data.lastname = $rootScope.fields.lastname;
		data.phone = $rootScope.fields.phone;
		data.email = $rootScope.fields.email;
		data.type_reservation = $rootScope.fields.typeReservation;
		data.referee_required = !!$rootScope.fields.setReferee;
		return data;
	}

	$rootScope.setStateTemporaryReservation = function(data){
		$.ajax({

			type: 'POST',

			url : base_url + "setTemporaryReservationState",

			data: data,

			async : true
		});

		/*data.team_id = ( data.team_id == '1' ) ? '2' : '1';

		$.ajax({

			type: 'POST',

			url : base_url + "setTemporaryReservationState",

			data: data,

			async : true
		});*/
	}


	$scope.loadReservations();
	$scope.loadPitchsPagination();
	/*$(window).bind("beforeunload", function() { 
	    var data = $rootScope.getDataForTemporaryReservation();
		data.state = '3'; 
		$scope.setStateTemporaryReservation(data);
		return confirm("Realmente desea abandonar la reservacion?");
	});*/
	$rootScope.fields = {
		name : '',
		lastname : '',
		phone : '',
		email : '',
		type_reservation : '',
		referee_required : ''
	}
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
		//$('#team_id').val('');
        //$('#reservation_time').val('');
       // var data = $rootScope.getDataForTemporaryReservation();
		//data.state = '3'; 
		//$scope.setStateTemporaryReservation(data);
	});

	var onCancel = function(){
		$('#formReservationModal').modal('hide');
	}

	var onContinue = function(){
		//Continue
	}

	$('#cancelReservationBtn').confirmation({
		onConfirm : onContinue,
		onCancel : onCancel
	});

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
        scope.loadReservations();
      });

    };
  }]);


F5App.directive('available', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();

        $('#team_id').val(attr.team);
        $('#reservation_time').val($(element).siblings('.reservation-time').attr('data-time'));

        $.ajax({

			type: 'POST',

			url : base_url + "getTemporaryReservationState",

			data: scope.getDataForTemporaryReservation(),

			async : true,

			success : function(response){
				var response = jQuery.parseJSON(response);
				var state = 0;
				/*
					States 
					1: Other user is viewing the same cell
					2. Other user is booking the same cell
					3. Register is Expired, so you can book you reservation now
					4. The BD didn't return anything data, so you can book you reservation now.
					5. The reservation already exists
				*/

				state = ( response.length == 0 ) ? '4' : response[0].state;

				switch(state){
					case '1':
						$('#reservation-watching-by-other-user-modal').modal('show');
					break;
					case '2':
						$('#reservation-in-use-by-other-user-modal').modal('show');
					break;
					case '3':
					case '4':
						var data = scope.getDataForTemporaryReservation();
						data.state = '1'; 
						scope.setStateTemporaryReservation(data);

						$('#formReservationModal').modal('show');
					break;
					case '5':
						alert('Esta casilla ya fue reservada. Por favor escoja otra casilla para reservar');
						//location.reload();
						$('#formReservationModal').modal('hide');
						scope.loadReservations();
					break;
				}
			}
		});
      });

    }
    return {
    	restrict : 'C',
    	link:link
	}
  }]);

F5App.directive('bookingOnLine', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        var data = scope.getDataForTemporaryReservation();

        //data.reservation_day = "29";
        $.ajax({

			type: 'POST',

			url : base_url + "checkIfReservationExist",

			data: data,

			async : true,

			success : function(response){
				if(jQuery.parseJSON(response).length > 0){
					data.state = '5';// Reservada
					scope.setStateTemporaryReservation(data);
					alert('Esta casilla ya fue reservada. Por favor escoja otra casilla para reservar');
					//location.reload();
					$('#formReservationModal').modal('hide');
					scope.loadReservations();
				}
				else{
					data.state = '2'; 
					scope.setStateTemporaryReservation(data);
				}
			}
		});


		var minutes = 09,
			seconds = 60;

		scope.timeInterval = setInterval(function(){
			seconds--;
			scope.$apply(function(){
				scope.time = '00:'+minutes+':'+seconds;
			});
			
			if(seconds == 00){
				seconds = 59;
				minutes--;
			}

			if( minutes == 0 ){
				clearInterval(scope.timeInterval);
				location.reload();
			}
		},1000);

      });
      scope.time = '00:00:00';
    }
    return {
    	restrict : 'C',
    	link:link
	}
  }]);

F5App.directive('reserveBtn', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        if( scope.bookingForm.$valid ){
        	//console.log('valido');

       		var data = scope.getDataForReservation();
        	 $.ajax({

				type: 'POST',

				url : base_url + "createReservation",

				data: data,

				async : true,

				success : function(response){
					var data = scope.getDataForTemporaryReservation();
					data.state = '5'; 
					scope.setStateTemporaryReservation(data);
					alert("Su reservacion ha sido creada Satisfactoriamente");
					//location.reload();
					$('#formReservationModal').modal('hide');
					scope.loadReservations();
				}
			});
        }
        else{
        	//console.log('invalido');
        }
        
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
});

/* ==========================================================================
   END APP
========================================================================== */