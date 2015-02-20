F5App.app.controller("headerController", function ($scope, $rootScope){

   $scope.setActive = function (){
   		if( !!window.location.href.match('reservaciones') || !!window.location.href.match('admin')){
   			$('#mainNav .reservaciones').addClass('active');
   		}
   		else if ( !!window.location.href.match('galeria') ){
   			$('#mainNav .galeria').addClass('active');
   		}
   		else{
   			$('#mainNav .home').addClass('active');
   		}
   };

});