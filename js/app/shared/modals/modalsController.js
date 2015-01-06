F5App.app.controller("modalController", function ($scope, $rootScope){
	$('#formReservationModal').on('hidden.bs.modal', function(){
		
		if( !$scope.successReservation ){
			var data = $rootScope.getDataForTemporaryReservation();
			data.state = '3'; 
			$scope.setStateTemporaryReservation(data);
		}
		$scope.$apply(function(){
			$scope.bookingType = '';
		});
		$scope.clearReservationForm();
		//$scope.loadReservations();
	});

	$('#formReservationModal').on('show.bs.modal', function(){
		$scope.successReservation = false;
		if( $scope.fields.typeReservationSelected == 'reto' ){
			$scope.fields.typeReservation = 2;
		}
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

	$scope.clearReservationForm = function(){
		$scope.fields.email = '';
		$scope.fields.lastname = '';
		$scope.fields.name = '';
		$scope.fields.phone = '';
		$scope.fields.setReferee = '';
		$scope.fields.typeReservationSelected = 'normal';
		$scope.fields.typeReservation = '';
		$scope.fields.setPitchAllWeeks = '';
		//$scope.bookingForm.name.$dirty = false;
		//$scope.bookingForm.lastname.$dirty = false;
		clearInterval($scope.timeInterval);
		$scope.time = '00:10:00';
	}

});