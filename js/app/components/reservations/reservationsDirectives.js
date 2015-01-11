F5App.app.directive('loadDay', ['$document', function($document) {
    return function(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        $('.day div').removeClass('active');
        $('.day').removeClass('active');
        $('.days_row').removeClass('active');
        $(element).addClass('active');
        $(element).parent().addClass('active');
        $(element).parents('.days_row').addClass('active');
        $('#dailyResevations').hide();
        scope.loadReservations();
      });

    };
  }]);


F5App.app.directive('available', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        $('#loading-modal').modal('show');
        $('#team_id').val(attr.team);
        $('#reservation_time').val($(element).siblings('.reservation-time').attr('data-time'));

        $.ajax({

			type: 'POST',

			url : F5App.base_url + "getTemporaryReservationState",

			data: scope.getDataForTemporaryReservation(),

			async : true,

			success : function(response){
				$('#loading-modal').modal('hide');
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
						var daySelected = $('#calendar .days_row.active .day').index($('#calendar .days_row.active .day.active'));
						$('#reservationInfo').html($('#calendar .days_head .head:eq('+daySelected+')').text() + ' ' + $('#day').val()+'/'+$('#month').val()+'/'+$('#year').val());
					break;
					case '5':
						
						//location.reload();
						$('#formReservationModal').modal('hide');
						//$('#already-reserved-modal').modal('show');
						alert('Esta casilla ya fue reservada. Por favor escoja otra casilla para reservar');
						scope.loadReservations();
						
					break;
				}
			}
		});
      });

    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);

F5App.app.directive('bookingOnLine', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        $('#loading-modal').modal('show');
        var data = scope.getDataForTemporaryReservation();

        //data.reservation_day = "29";
        $.ajax({

			type: 'POST',

			url : F5App.base_url + "checkIfReservationExist",

			data: data,

			async : true,

			success : function(response){
				$('#loading-modal').modal('hide');
				if(jQuery.parseJSON(response).length > 0){
					data.state = '5';// Reservada
					scope.setStateTemporaryReservation(data);
					
					//location.reload();
					$('#formReservationModal').modal('hide');
					//$('#already-reserved-modal').modal('show');
					alert('Esta casilla ya fue reservada. Por favor escoja otra casilla para reservar');
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

			if( minutes == 0 && seconds == 0){
				F5App.leaveSafelyPage = true;
				clearInterval(scope.timeInterval);
				location.reload();
			}
			
			if(seconds == 00){
				seconds = 59;
				minutes--;
			}
		},1000);

      });
      scope.time = '00:10:00';
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);

F5App.app.directive('reserveBtn', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        $('#loading-modal').modal('show');
        if( scope.bookingForm.$valid ){
        	//console.log('valido');

       		var data = scope.getDataForReservation();
        	 $.ajax({

				type: 'POST',

				url : F5App.base_url + "createReservation",

				data: data,

				async : true,

				success : function(response){
					
					var dataTmp = scope.getDataForTemporaryReservation();
					dataTmp.state = '5'; 
					scope.setStateTemporaryReservation(dataTmp);

					//location.reload();
					scope.$parent.successReservation = true;
					

					if(!data.setPitchAllWeeks){
						//$('#successful-reserved-modal').modal('show');
						//alert("Su reservación ha sido creada satisfactoriamente");
						
						$('#formReservationModal').modal('hide');
						scope.sendEmail({	'email' : data.email,
											'data_reservation' : 'Su reservación ha sido creada satisfactoriamente \nFecha: '
											 + data.reservation_day +'/'+ data.reservation_month +'/'+ data.reservation_year + 
											 '\nHora: '+ scope.getCorrectTimeReservation(data.reservation_time) +'\nNombre: '+
											 data.name + ' '+ data.lastname
										});
						//scope.loadReservations();					
					}
					else{
						$('#loading-modal').modal('hide');
						$('#set-pitch-all-weeks-modal').modal('show');
						var tmp = {
							reservation_day : data.reservation_day,
							reservation_month : data.reservation_month,
							reservation_year : data.reservation_year
						};

						var dates = scope.reserveAllWeeksSameDay(data),
							dates_str = '\n';
						
						for(var i = 0; i < dates.length ; i++){
							dates_str += dates[i][0] +'/'+dates[i][1]+'/'+dates[i][2]+'\n';
						}
						//console.log(dates);
						scope.sendEmail({	'email' : data.email,
											'data_reservation' : 'Su reservación ha sido creada satisfactoriamente \nFecha: '
											 + tmp.reservation_day +'/'+ tmp.reservation_month +'/'+ tmp.reservation_year + 
											 '\nHora: '+ scope.getCorrectTimeReservation(data.reservation_time) + '\nNombre: '+ 
											 data.name + ' '+ data.lastname +'\nTambién se han reservado la cancha fija los siguientes días de todas las semanas ' + dates_str
										});
						//scope.loadReservations();
					}
				}
			});
        }
        else{
        	//console.log('invalido');
        	alert("Por favor ingrese correctamente los datos erróneos en el formulario");
        	$('#loading-modal').modal('hide');
        }
        
      });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);

F5App.app.directive('showInfo', ['$document','$timeout', function($document,$timeout) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        $('#loading-modal').modal('show');

        $('#team_id').val(attr.team);
        $('#reservation_time').val($(element).siblings('.reservation-time').attr('data-time'));

        
        $.ajax({

			type: 'POST',

			url : F5App.base_url + "getReservationByTime",

			data: scope.getDataForTemporaryReservation(),

			async : true,

			success : function(response){
				$('#loading-modal').modal('hide');
				$timeout(function(){
					scope.$parent.$parent.$parent.$parent.$parent.completeInfo = jQuery.parseJSON(response);
				});
				$('#show-info-modal').modal('show');
			}
		});
      });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);

F5App.app.directive('delete', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        $('#loading-modal').modal('show');

        $(element).addClass('active');
        if(confirm("Realmemente desea eliminar este registro?")){
        	var data = scope.getDataForTemporaryReservation();
			data.state = '3'; 
			scope.setStateTemporaryReservation(data);

        	 $.ajax({

				type: 'POST',

				url : F5App.base_url + "setInactiveReservation",

				data: data,

				async : true,

				success : function(response){
					//alert('Registro Eliminado');
					$('#loading-modal').modal('hide');
					scope.loadReservations();
				}
			});
        }
        else{
        	$('#loading-modal').modal('hide');
        }
        $(element).removeClass('active');

      });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);

  F5App.app.directive('searchBtn', ['$document','$timeout', function($document,$timeout) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        $('#loading-modal').modal('show');
        $.ajax({

			type: 'POST',

			url : F5App.base_url + "getClientsData",

			async : true,

			success : function(response){
				$('#loading-modal').modal('hide');
				 $timeout(function(){
					scope.$parent.clients = jQuery.parseJSON(response);
				});
				$('#search-modal').modal('show');
				scope.$parent.selectUserMode = false;
			}
		});
      });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);

  F5App.app.directive('selectUserBtn', ['$document','$timeout', function($document,$timeout) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        $('#loading-modal').modal('show');
        $.ajax({

			type: 'POST',

			url : F5App.base_url + "getClientsData",

			async : true,

			success : function(response){
				$('#loading-modal').modal('hide');
				 $timeout(function(){
					scope.$parent.clients = jQuery.parseJSON(response);
				});
				$('#search-modal').modal('show');
				scope.$parent.selectUserMode = true;
			}
		});
      });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);

  F5App.app.directive('changePasswordBtn', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        $('#loading-modal').modal('show');
        var data = {
        	'user' : $('#user').val(),
        	'password' : scope.fields.password
        }
        if( scope.changePassForm.$valid ){
       		$.ajax({

				type: 'POST',

				url : F5App.base_url + "changePassword",

				data: data,

				async : true,

				success : function(response){
					$('#loading-modal').modal('hide');
					$('#change-password-modal').modal('hide');
					alert("El password se ha cambiado satisfactoriamente");
				}
			});
       	}
       	else{
       		alert("Por favor ingrese correctamente los datos erróneos");
       	}
      });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);


  F5App.app.directive('fillFormClientBtn', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        $('#search-modal').modal('hide');
        $('#loading-modal').modal('show');
        var rowClient = $('input[name="client"]:checked').parents('.rowClient');
        scope.fields.name = rowClient.find('.clientName').val();
        scope.fields.lastname1 = rowClient.find('.clientLastName').val().split(' ')[0];
        scope.fields.lastname2 = rowClient.find('.clientLastName').val().split(' ')[1];
        scope.fields.email = rowClient.find('.clientEmail').val();
        scope.fields.phone = rowClient.find('.clientPhone').val();
        $('#loading-modal').modal('hide');
       });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);


  F5App.app.directive('checkAvailability', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        $('#check-availability-modal').modal('show');
       
       });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);