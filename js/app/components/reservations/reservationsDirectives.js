F5App.app.directive('loadDay', ['$document', function($document) {
    return function(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        angular.element('.day div').removeClass('active');
        angular.element('.day').removeClass('active');
        angular.element('.days_row').removeClass('active');
        angular.element(element).addClass('active');
        angular.element(element).parent().addClass('active');
        angular.element(element).parents('.days_row').addClass('active');
        angular.element('#dailyResevations').hide();
        scope.loadReservations();
      });

    };
  }]);


F5App.app.directive('available', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        angular.element('#loading-modal').modal('show');
        angular.element('#team_id').val(attr.team);
        angular.element('#reservation_time').val(angular.element(element).siblings('.reservation-time').attr('data-time'));

        $.ajax({

			type: 'POST',

			url : F5App.base_url + "getTemporaryReservationState",

			data: scope.getDataForTemporaryReservation(),

			async : true,

			success : function(response){
				angular.element('#loading-modal').modal('hide');
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
						angular.element('#reservation-watching-by-other-user-modal').modal('show');
					break;
					case '2':
						angular.element('#reservation-in-use-by-other-user-modal').modal('show');
					break;
					case '3':
					case '4':
						var data = scope.getDataForTemporaryReservation();
						data.state = '1'; 
						scope.setStateTemporaryReservation(data);

						angular.element('#formReservationModal').modal('show');
						var daySelected = angular.element('#calendar .days_row.active .day').index(angular.element('#calendar .days_row.active .day.active'));
						angular.element('#reservationInfo').html(angular.element('#calendar .days_head .head:eq('+daySelected+')').text() + ' ' + angular.element('#day').val()+'/'+angular.element('#month').val()+'/'+angular.element('#year').val() + ' ' + angular.element(element).siblings('.reservation-time ').text());
						if( scope.isAdminUser() ){
							angular.element('#bookingOnLine').trigger('click');
							scope.bookingType = 'bookingOnLine';
						}
					break;
					case '5':
						
						//location.reload();
						angular.element('#formReservationModal').modal('hide');
						//angular.element('#already-reserved-modal').modal('show');
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
        angular.element('#loading-modal').modal('show');
        var data = scope.getDataForTemporaryReservation();

        //data.reservation_day = "29";
        $.ajax({

			type: 'POST',

			url : F5App.base_url + "checkIfReservationExist",

			data: data,

			async : true,

			success : function(response){
				angular.element('#loading-modal').modal('hide');
				if(jQuery.parseJSON(response).length > 0){
					data.state = '5';// Reservada
					scope.setStateTemporaryReservation(data);
					
					//location.reload();
					angular.element('#formReservationModal').modal('hide');
					//angular.element('#already-reserved-modal').modal('show');
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
        angular.element('#loading-modal').modal('show');
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
						//angular.element('#successful-reserved-modal').modal('show');
						//alert("Su reservación ha sido creada satisfactoriamente");
						
						angular.element('#formReservationModal').modal('hide');
						scope.sendEmail({	'email' : data.email,
											'data_reservation' : 'Su reservación ha sido creada satisfactoriamente \nFecha: '
											 + data.reservation_day +'/'+ data.reservation_month +'/'+ data.reservation_year + 
											 '\nHora: '+ scope.getCorrectTimeReservation(data.reservation_time) +'\nNombre: '+
											 data.name + ' '+ data.lastname
										});
						//scope.loadReservations();					
					}
					else{
						angular.element('#loading-modal').modal('hide');
						angular.element('#set-pitch-all-weeks-modal').modal('show');
						var tmp = {
							reservation_day : data.reservation_day,
							reservation_month : data.reservation_month,
							reservation_year : data.reservation_year
						};

						data['dates'] = scope.calculateDayPerWeek();
						var result = new Array();

						for(var i = 0; i < data['dates'].length ; i++){
							result[i] = new Array();
						}

						$.ajax({

							type: 'POST',

							url : F5App.base_url + "reserveAllWeeksSameDay",

							data: data,

							async : true,

							success : function(response){
								angular.element('#formReservationModal').modal('hide');
								angular.element('#set-pitch-all-weeks-modal').modal('hide');
								scope.loadReservations();

								var daysAvailables = jQuery.parseJSON(response);

								for(i = 0; i < data['dates'].length; i++){
									result[i].push(data['dates'][i][0] + '/'+data['dates'][i][1] + '/' +  data['dates'][i][2]);
									result[i].push(daysAvailables[i]); 
								}

								var dates_str = '\n';

								for(var i = 0; i < result.length ; i++){
									dates_str += result[i][0] +' -> ';
									dates_str += (result[i][1]) ? 'Reservado correctamente' : 'NO Reservado (Ocupado)';
									dates_str += '\n';
								}
								scope.sendEmail({	'email' : data.email,
											'data_reservation' : 'Su reservación ha sido creada satisfactoriamente \nFecha: '
											 + tmp.reservation_day +'/'+ tmp.reservation_month +'/'+ tmp.reservation_year + 
											 '\nHora: '+ scope.getCorrectTimeReservation(data.reservation_time) + '\nNombre: '+ 
											 data.name + ' '+ data.lastname +'\nTambién se han reservado la cancha fija los siguientes días de todas las semanas ' + dates_str
										});
							}
						});
					}
				}
			});
        }
        else{
        	//console.log('invalido');
        	alert("Por favor ingrese correctamente los datos erróneos en el formulario");
        	angular.element('#loading-modal').modal('hide');
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
        angular.element('#loading-modal').modal('show');

        angular.element('#team_id').val(attr.team);
        angular.element('#reservation_time').val(angular.element(element).siblings('.reservation-time').attr('data-time'));

        
        $.ajax({

			type: 'POST',

			url : F5App.base_url + "getReservationByTime",

			data: scope.getDataForTemporaryReservation(),

			async : true,

			success : function(response){
				angular.element('#loading-modal').modal('hide');
				$timeout(function(){
					scope.$parent.$parent.$parent.$parent.$parent.completeInfo = jQuery.parseJSON(response);
				});
				angular.element('#show-info-modal').modal('show');
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
        angular.element('#loading-modal').modal('show');

        angular.element(element).addClass('active');
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
					angular.element('#loading-modal').modal('hide');
					scope.loadReservations();
				}
			});
        }
        else{
        	angular.element('#loading-modal').modal('hide');
        }
        angular.element(element).removeClass('active');

      });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);

  F5App.app.directive('searchBtn', ['$document','$timeout','$http', function($document,$timeout,$http) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        angular.element('#loading-modal').modal('show');

		$http.get(F5App.base_url + "getClientsData").
		  success(function(data, status, headers, config) {
		    angular.element('#loading-modal').modal('hide');
		 	$timeout(function(){
				scope.$parent.clients = angular.fromJson(data);
			});
			angular.element('#search-modal').modal('show');
			scope.$parent.selectUserMode = false;
		  }).
		  error(function(data, status, headers, config) {
		    // called asynchronously if an error occurs
		    // or server returns response with an error status.
		  });

      });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);

  F5App.app.directive('selectUserBtn', ['$document','$timeout','$http', function($document,$timeout,$http) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        angular.element('#loading-modal').modal('show');
        $http.get(F5App.base_url + "getClientsData").
		  success(function(data, status, headers, config) {
		    angular.element('#loading-modal').modal('hide');
		 	$timeout(function(){
				scope.$parent.clients = angular.fromJson(data);
			});
			angular.element('#search-modal').modal('show');
			scope.$parent.selectUserMode = true;
		  }).
		  error(function(data, status, headers, config) {
		    // called asynchronously if an error occurs
		    // or server returns response with an error status.
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
        angular.element('#loading-modal').modal('show');
        var data = {
        	'user' : angular.element('#user').val(),
        	'password' : scope.fields.password
        }
        if( scope.changePassForm.$valid ){
       		$.ajax({

				type: 'POST',

				url : F5App.base_url + "changePassword",

				data: data,

				async : true,

				success : function(response){
					angular.element('#loading-modal').modal('hide');
					angular.element('#change-password-modal').modal('hide');
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
        angular.element('#search-modal').modal('hide');
        angular.element('#loading-modal').modal('show');
        var rowClient = angular.element('input[name="client"]:checked').parents('.rowClient');
        scope.fields.name = rowClient.find('.clientName').val();
        scope.fields.lastname1 = rowClient.find('.clientLastName').val().split(' ')[0];
        scope.fields.lastname2 = rowClient.find('.clientLastName').val().split(' ')[1];
        scope.fields.email = rowClient.find('.clientEmail').val();
        scope.fields.phone = rowClient.find('.clientPhone').val();
        angular.element('#loading-modal').modal('hide');
       });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);


  F5App.app.directive('checkAvailabilityBtn', ['$document','$timeout', function($document,$timeout) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();

       	angular.element('#loading-modal').modal('show');
		var data = scope.getDataForTemporaryReservation();
			data['dates'] = scope.calculateDayPerWeek();

		var result = new Array();

		for(var i = 0; i < data['dates'].length ; i++){
			result[i] = new Array();
		}

		$.ajax({

			type: 'POST',

			url : F5App.base_url + "checkAvailability",

			data: data,

			async : true,

			success : function(response){
				var daysAvailables = jQuery.parseJSON(response);

				for(i = 0; i < data['dates'].length; i++){
					result[i].push(data['dates'][i][0] + '/'+data['dates'][i][1] + '/' +  data['dates'][i][2]);
					result[i].push(daysAvailables[i]); 
				}
				$timeout(function(){
					scope.$parent.$parent.$parent.daysAvailables = result;
				});
				angular.element('#loading-modal').modal('hide');
				angular.element('#check-availability-modal').modal('show');
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

F5App.app.directive('insertCardData', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        if( scope.bookingForm.$valid ){
        	angular.element('#bookingForm').hide();
        	angular.element('#carDataForm').show();
        	scope.fields.stepReservation = 2;
        }
        else{
        	alert("Por favor ingrese correctamente los datos erróneos en el formulario");
        }
        
      });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);

F5App.app.directive('returnToFormReservation', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
    	angular.element('#bookingForm').show();
    	angular.element('#carDataForm').hide();
    	scope.fields.stepReservation = 1;
      });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);

F5App.app.directive('reserveAndPayBtn', ['$document', function($document) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        if( scope.carDataForm.$valid ){
        	alert('valid');
        	$.ajax({

				type: 'POST',

				url : F5App.base_url + "acceptCreditCardPayment",

				data: {
					number : scope.fields.number,
					type : scope.fields.type, 
        			expire_month : scope.fields.expire_month,
        			expire_year : scope.fields.expire_year,
        			cvv2 : scope.fields.ccv,
        			first_name : scope.fields.name,
        			last_name : scope.fields.lastname1,
        			total : '1'
				},

				async : true,

				success : function(response){
					angular.element('#loading-modal').modal('hide');

				}
			});

        }
        else{
        	alert("Por favor ingrese correctamente los datos erróneos en el formulario");
        }
      });
    }
    return {
    	restrict : 'C',
    	scope : false,
    	link:link
	}
  }]);