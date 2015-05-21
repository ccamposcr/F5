F5App.app.service('reservationService', function() {
  var dataTempReservation = {};

  var setDataForTemporaryReservation = function(param) {
      dataTempReservation = param;
  };

  var getDataForTemporaryReservation = function(){
      return dataTempReservation;
  };

  return {
    setDataForTemporaryReservation: setDataForTemporaryReservation,
    getDataForTemporaryReservation: getDataForTemporaryReservation
  };

});