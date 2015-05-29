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


F5App.app.directive('available', ['$document','$http','$timeout', function($document,$http,$timeout) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        angular.element('#loading-modal').modal('show');
        angular.element('#team_id').val(attr.team);
        angular.element('#reservation_time').val(angular.element(element).siblings('.reservation-time').attr('data-time'));

        var req = {
			method: 'POST',
			url: F5App.base_url + "getTemporaryReservationState",
			headers: {
			   	'Content-Type': 'application/x-www-form-urlencoded'
			},
		 	data: $.param( scope.getDataForTemporaryReservation() ),
		 	cache : false
		}

		$http(req).success(function(response, status, headers, config) {
			angular.element('#loading-modal').modal('hide');
			var response = angular.fromJson(response);
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
						$timeout(function(){
							angular.element('#bookingOnLine').trigger('click');
							scope.bookingType = 'bookingOnLine';
						});
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
	
		}).error(function(response, status, headers, config) {
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

F5App.app.directive('bookingOnLine', ['$document','$http','$interval', function($document,$http, $interval) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        angular.element('#loading-modal').modal('show');
        var data = scope.getDataForTemporaryReservation();

		var req = {
			method: 'POST',
			url: F5App.base_url + "checkIfReservationExist",
			headers: {
			   	'Content-Type': 'application/x-www-form-urlencoded'
			},
		 	data: $.param( data ),
		 	cache : false
		}

		$http(req).success(function(response, status, headers, config) {
			angular.element('#loading-modal').modal('hide');
			if(angular.fromJson(response).length > 0){
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
	
		}).error(function(response, status, headers, config) {
		    // called asynchronously if an error occurs
		    // or server returns response with an error status.
		});


		var minutes = 09,
			seconds = 60;

		scope.timeInterval = $interval(function(){
			seconds--;
			scope.time = '00:'+minutes+':'+seconds;

			if( minutes == 0 && seconds == 0){
				F5App.leaveSafelyPage = true;
				$interval.cancel(scope.timeInterval);
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

F5App.app.directive('reserveBtn', ['$document','$http', function($document,$http) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        angular.element('#loading-modal').modal('show');
        if( scope.bookingForm.$valid ){
        	//console.log('valido');

       		var data = scope.getDataForReservation();

			if(!data.setPitchAllWeeks){
				//angular.element('#successful-reserved-modal').modal('show');
				//alert("Su reservación ha sido creada satisfactoriamente");

				var req = {
					method: 'POST',
					url: F5App.base_url + "createReservation",
					headers: {
					   	'Content-Type': 'application/x-www-form-urlencoded'
					},
				 	data: $.param( data ),
				 	cache : false
				}

				$http(req).success(function(response, status, headers, config) {
					var dataTmp = scope.getDataForTemporaryReservation();
						dataTmp.state = '5'; 
						scope.setStateTemporaryReservation(dataTmp);

						//location.reload();
						//scope.$parent.successReservation = true;

						angular.element('#formReservationModal').modal('hide');
						if( !!data.email ){
							scope.sendEmail({	'email' : data.email,
												'data_reservation' : 'Su reservación ha sido creada satisfactoriamente <br>Fecha: '
												 + data.reservation_day +'/'+ data.reservation_month +'/'+ data.reservation_year + 
												 '<br>Hora: '+ scope.getCorrectTimeReservation(data.reservation_time) +'<br>Nombre: '+
												 data.name + ' '+ data.lastname
											});
						}else{
							angular.element('#loading-modal').modal('hide');
							scope.loadReservations();
						}

				}).error(function(response, status, headers, config) {
				    // called asynchronously if an error occurs
				    // or server returns response with an error status.
				});				
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


				var req = {
					method: 'POST',
					url: F5App.base_url + "reserveAllWeeksSameDay",
					headers: {
					   	'Content-Type': 'application/x-www-form-urlencoded'
					},
				 	data: $.param( data ),
				 	cache : false
				}

				$http(req).success(function(response, status, headers, config) {
					angular.element('#formReservationModal').modal('hide');
					angular.element('#set-pitch-all-weeks-modal').modal('hide');
					//scope.loadReservations();

					if( !!data.email ){
						var daysAvailables = angular.fromJson(response);

						for(i = 0; i < data['dates'].length; i++){
							result[i].push(data['dates'][i][0] + '/'+data['dates'][i][1] + '/' +  data['dates'][i][2]);
							result[i].push(daysAvailables[i]); 
						}

						var dates_str = '<br>';

						for(var i = 0; i < result.length ; i++){
							dates_str += result[i][0] +' -> ';
							dates_str += (result[i][1]) ? 'Reservado correctamente' : 'NO Reservado (Ocupado)';
							dates_str += '<br>';
						}
						scope.sendEmail({	'email' : data.email,
									'data_reservation' : 'Su reservación ha sido creada satisfactoriamente <br>Fecha: '
									 + tmp.reservation_day +'/'+ tmp.reservation_month +'/'+ tmp.reservation_year + 
									 '<br />Hora: '+ scope.getCorrectTimeReservation(data.reservation_time) + '<br>Nombre: '+ 
									 data.name + ' '+ data.lastname +'<br>También se han reservado la cancha fija los siguientes días de todas las semanas ' + dates_str
								});
					}else{
						scope.loadReservations();
					}
		
				}).error(function(response, status, headers, config) {
				    // called asynchronously if an error occurs
				    // or server returns response with an error status.
				});
			}

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

F5App.app.directive('showInfo', ['$document','$timeout','$http', function($document,$timeout,$http) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        angular.element('#loading-modal').modal('show');

        angular.element('#team_id').val(attr.team);
        angular.element('#reservation_time').val(angular.element(element).siblings('.reservation-time').attr('data-time'));

        var req = {
			method: 'POST',
			url: F5App.base_url + "getReservationByTime",
			headers: {
			   	'Content-Type': 'application/x-www-form-urlencoded'
			},
		 	data: $.param( scope.getDataForTemporaryReservation() ),
		 	cache : false
		}

		$http(req).success(function(response, status, headers, config) {
			angular.element('#loading-modal').modal('hide');
			//$timeout(function(){
				scope.$root.completeInfo = angular.fromJson(response)[0];
			//});
			angular.element('#show-info-modal').modal('show');
	
		}).error(function(response, status, headers, config) {
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

F5App.app.directive('delete', ['$document','$http', function($document,$http) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        angular.element('#loading-modal').modal('show');

        angular.element(element).addClass('active');
        if(confirm("Realmemente desea eliminar este registro?")){
        	var data = scope.getDataForTemporaryReservation();
			data.state = '3'; 
			scope.setStateTemporaryReservation(data);

			if(!scope.fields.deleteAllCccurrences){
	        	var req = {
					method: 'POST',
					url: F5App.base_url + "setInactiveReservation",
					headers: {
					   	'Content-Type': 'application/x-www-form-urlencoded'
					},
				 	data: $.param( data ),
				 	cache : false
				}

				$http(req).success(function(response, status, headers, config) {
					//alert('Registro Eliminado');
					angular.element('#loading-modal').modal('hide');
					scope.loadReservations();
			
				}).error(function(response, status, headers, config) {
				    // called asynchronously if an error occurs
				    // or server returns response with an error status.
				});
			}else{
				//console.log(scope.completeInfo.id_group_all_weeks);
				var req = {
					method: 'POST',
					url: F5App.base_url + "setInactiveReservationAllWeeks",
					headers: {
					   	'Content-Type': 'application/x-www-form-urlencoded'
					},
				 	data: $.param( { id_group_all_weeks: scope.completeInfo.id_group_all_weeks } ),
				 	cache : false
				}

				$http(req).success(function(response, status, headers, config) {
					//alert('Registro Eliminado');
					angular.element('#loading-modal').modal('hide');
					scope.loadReservations();
			
				}).error(function(response, status, headers, config) {
				    // called asynchronously if an error occurs
				    // or server returns response with an error status.
				});
			}
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
		 	//$timeout(function(){
				scope.$root.clients = angular.fromJson(data);
			//});
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
		 	//$timeout(function(){
				scope.$root.clients = angular.fromJson(data);
			//});
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

  F5App.app.directive('changePasswordBtn', ['$document','$http', function($document,$http) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        angular.element('#loading-modal').modal('show');
        var data = {
        	'user' : angular.element('#user').val(),
        	'password' : scope.fields.password
        }
        if( scope.changePassForm.$valid ){

			var req = {
				method: 'POST',
				url: F5App.base_url + "changePassword",
				headers: {
				   	'Content-Type': 'application/x-www-form-urlencoded'
				},
			 	data: $.param( data ),
			 	cache : false
			}

			$http(req).success(function(response, status, headers, config) {
				angular.element('#loading-modal').modal('hide');
				angular.element('#change-password-modal').modal('hide');
				alert("El password se ha cambiado satisfactoriamente");
		
			}).error(function(response, status, headers, config) {
			    // called asynchronously if an error occurs
			    // or server returns response with an error status.
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


  F5App.app.directive('checkAvailabilityBtn', ['$document','$timeout','$http', function($document,$timeout,$http) {
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

		var req = {
			method: 'POST',
			url: F5App.base_url + "checkAvailability",
			headers: {
			   	'Content-Type': 'application/x-www-form-urlencoded'
			},
		 	data: $.param( data ),
		 	cache : false
		}

		$http(req).success(function(response, status, headers, config) {
			var daysAvailables = angular.fromJson(response);

			for(i = 0; i < data['dates'].length; i++){
				result[i].push(data['dates'][i][0] + '/'+data['dates'][i][1] + '/' +  data['dates'][i][2]);
				result[i].push(daysAvailables[i]); 
			}
			//$timeout(function(){
				scope.$root.daysAvailables = result;
			//});
			angular.element('#loading-modal').modal('hide');
			angular.element('#check-availability-modal').modal('show');

		}).error(function(response, status, headers, config) {
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

F5App.app.directive('reserveAndPayBtn', ['$document','$http','$timeout', function($document,$http,$timeout) {
    function link(scope, element, attr) {
      element.on('click', function(event) {
        event.preventDefault();
        if( scope.carDataForm.$valid ){
        	var data = scope.getDataForReservation();
        	data.number = scope.fields.number;
			data.type = scope.fields.type;
			data.expire_month = scope.fields.expire_month;
			data.expire_year = scope.fields.expire_year;
			data.cvv = scope.fields.cvv;
			data.first_name = scope.fields.name;
			data.last_name = scope.fields.lastname1;

        	angular.element('#processing-card-modal').modal('show');
        	var req = {
				method: 'POST',
				url: F5App.base_url + "acceptCreditCardPayment",
				headers: {
				   	'Content-Type': 'application/x-www-form-urlencoded'
				},
			 	data: $.param( data ),
			 	cache : false
			}

			$http(req).success(function(response, status, headers, config) {
				angular.element('#processing-card-modal').modal('hide');
				console.log(response);
				if( response.state == "approved" ){
					angular.element('#formReservationModal').modal('hide');
					$timeout(function(){
							angular.element('#reserveAfterPayBtn').trigger('click');
					});
				}
				else{
					scope.fields.response_error = response.details;
				}
				
			}).error(function(response, status, headers, config) {
			    // called asynchronously if an error occurs
			    // or server returns response with an error status.
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