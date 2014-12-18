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
		$scope.loadReservations();

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

});