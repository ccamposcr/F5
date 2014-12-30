F5App.app.controller("reservationController", function ($scope, $rootScope){
   $scope.timesForReservations = ['08-09','09-10','10-11','11-12','12-13','13-14','14-15','15-16','16-17','17-18','18-19','19-20','20-21','21-22','23-24'];
   $scope.times = ['08:00 a.m.','09:00 a.m.','10:00 a.m.','11:00 a.m.','12:00 m.d','01:00 p.m.','02:00 p.m.','03:00 p.m.','04:00 p.m.','05:00 p.m.','06:00 p.m.','07:00 p.m.','08:00 p.m.','09:00 p.m.','10:00 p.m.'];
	//var path = ( window.location.pathname.replace('/','').replace(/\/$/, '').split('/').length <= 2 ) ? './' : '../';

   $rootScope.loadReservations = function (){
   		$('#loading-modal').modal('show');
   		$('#dailyResevations').hide();
   		
	   	if( !$('.day div.active').length ){
			$('.day div').first().addClass('active');
		}
		//Set day as active day
		var day = $('.day div.active').text();
		$('#day').val(day);
		$('#currentDay').html(day);
		
		$.ajax({

			type: 'POST',

			url : F5App.base_url + "getReservationByDay",

			data: $scope.getDataForTemporaryReservation(),

			async : true,

			success : function(response){
				$scope.$apply(function(){
					$scope.reservations = $scope.sortReservations(jQuery.parseJSON(response));
				});
				$('#loading-modal').modal('hide');
				$('#dailyResevations').show();
			}
		});
	}

	$scope.loadPitchsPagination = function (){
		$.ajax({

			type: 'POST',

			url : F5App.base_url + "getPitchByGroup",

			data: { group: $scope.getGroup() },

			async : true,

			success : function(response){
				$scope.$apply(function(){
					$scope.pitchs = jQuery.parseJSON(response);
				});
				$('#pitchs').show();
			}
		});
		$scope.pitchValue = $('#pitch').val();
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

			url : F5App.base_url + "getGroup",

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
		data.setPitchAllWeeks = !!$rootScope.fields.setPitchAllWeeks;
		return data;
	}

	$rootScope.setStateTemporaryReservation = function(data){
		$.ajax({

			type: 'POST',

			url : F5App.base_url + "setTemporaryReservationState",

			data: data,

			async : true
		});

		/*data.team_id = ( data.team_id == '1' ) ? '2' : '1';

		$.ajax({

			type: 'POST',

			url : F5App.base_url + "setTemporaryReservationState",

			data: data,

			async : true
		});*/
	}

	$rootScope.isDateForBookingValid = function(){
		return new Date($('#year').val(),$('#month').val() - 1,$('#day').val(),'23','59','59') > new Date();
	}

	$rootScope.isAdminUser = function(){
		return ( !!$('#isAdminUser').val() && /admin/.test(location.href) );
	}

	$rootScope.reserveAllWeeksSameDay = function(data){
		var range = 1, daysPerWeek = 7, daysPerYear = 365;
		for(var i = range; i<= daysPerYear ; i++){
			var from = new Date($('#year').val(),$('#month').val() - 1,$('#day').val());
			var to = new Date($('#year').val(),$('#month').val() - 1,$('#day').val());
			to.setDate(from.getDate() + i);
			if( i % daysPerWeek  == 0 ){
				data.reservation_day = to.getDate().toString();
				data.reservation_month = (to.getMonth() + 1).toString();
				data.reservation_year = to.getFullYear().toString();
				//console.log(to.toString());

				//loading
				$.ajax({

					type: 'POST',

					url : F5App.base_url + "createReservation",

					data: data,

					async : true,

					success : function(response){
						/*var dataTmp = $scope.getDataForTemporaryReservation();
						dataTmp.state = '5';
						dataTmp.reservation_day = to.getDate().toString();
						dataTmp.reservation_month = (to.getMonth() + 1).toString();
						dataTmp.reservation_year = to.getFullYear().toString();
						$scope.setStateTemporaryReservation(dataTmp);*/
					}
				});	
			}
		}
		$('#formReservationModal').modal('hide');
		$('#set-pitch-all-weeks-modal').modal('hide');
		$scope.loadReservations();
	}

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

	//$('#loading-modal').modal('show');
	$scope.loadReservations();
	$scope.loadPitchsPagination();
});

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
