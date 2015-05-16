F5App.app.controller("modalController", function ($scope, $rootScope){
	angular.element('#formReservationModal').on('hidden.bs.modal', function(){
		
		if( !$scope.successReservation ){
			var data = $rootScope.getDataForTemporaryReservation();
			data.state = '3'; 
			$scope.setStateTemporaryReservation(data);
		}
		$scope.$apply(function(){
			if( $scope.isAdminUser() ){
				$scope.bookingType = 'bookingOnLine';
			}
			else{
				$scope.bookingType = '';
			}
		});
		$scope.clearReservationForm();
		angular.element('#bookingForm').show();
        angular.element('#carDataForm').hide();
		//$scope.loadReservations();
	});

	angular.element('#change-password-modal').on('hidden.bs.modal', function(){
		$scope.fields.password = '';
		$scope.fields.confirmation = '';
	});

	angular.element('#formReservationModal').on('show.bs.modal', function(){
		$scope.successReservation = false;
		if( $scope.fields.typeReservationSelected == 'reto' ){
			$scope.fields.typeReservation = 2;
		}
	});

	angular.element('#search-modal').on('hidden.bs.modal', function(){
		$scope.fields.client = '';
		$scope.searchText = '';
	});

	var onCancel = function(){
		angular.element('#formReservationModal').modal('hide');
	}

	var onContinue = function(){
		//Continue
	}

	angular.element('#cancelReservationBtn').confirmation({
		onConfirm : onContinue,
		onCancel : onCancel
	});

	$scope.clearReservationForm = function(){
		$scope.fields.email = '';
		$scope.fields.lastname1 = '';
		$scope.fields.lastname2 = '';
		$scope.fields.name = '';
		$scope.fields.phone = '';
		$scope.fields.setReferee = '';
		$scope.fields.typeReservationSelected = 'normal';
		$scope.fields.typeReservation = '';
		$scope.fields.setPitchAllWeeks = '';
		$scope.fields.stepReservation = 1;
		$scope.fields.number = '';
		$scope.fields.type = '';
		$scope.fields.expire_month = '';
		$scope.fields.expire_year = '';
		$scope.fields.cvv2 = '';


		$scope.bookingForm.email.$dirty = false;
		$scope.bookingForm.lastname1.$dirty = false;
		$scope.bookingForm.lastname2.$dirty = false;
		$scope.bookingForm.name.$dirty = false;
		$scope.bookingForm.phone.$dirty = false;

		$scope.bookingForm.email.$pristine = true;
		$scope.bookingForm.lastname1.$pristine = true;
		$scope.bookingForm.lastname2.$pristine = true;
		$scope.bookingForm.name.$pristine = true;
		$scope.bookingForm.phone.$pristine = true;

		if( !$scope.isAdminUser() ){
			$scope.carDataForm.number.$dirty = false;
			$scope.carDataForm.type.$dirty = false;
			$scope.carDataForm.expire_month.$dirty = false;
			$scope.carDataForm.expire_year.$dirty = false;
			$scope.carDataForm.cvv.$dirty = false;

			$scope.carDataForm.number.$pristine = true;
			$scope.carDataForm.type.$pristine = true;
			$scope.carDataForm.expire_month.$pristine = true;
			$scope.carDataForm.expire_year.$pristine = true;
			$scope.carDataForm.cvv.$pristine = true;
		}
		
		clearInterval($scope.timeInterval);
		$scope.time = '00:10:00';
	}

});