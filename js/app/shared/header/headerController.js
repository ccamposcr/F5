F5App.app.controller("headerController", function ($scope, $rootScope){

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