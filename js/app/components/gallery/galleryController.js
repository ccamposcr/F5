F5App.app.controller("galleryController", function ($scope, $rootScope){

   $scope.loadGallery = function (){
	   	$('#carousel').flexslider({
	    animation: "slide",
	    controlNav: false,
	    animationLoop: true,
	    slideshow: false,
	    itemWidth: 150,
	    itemMargin: 5,
	    asNavFor: '#slider'
	  });
	   
	  $('#slider').flexslider({
	    animation: "slide",
	    controlNav: false,
	    animationLoop: true,
	    slideshow: false,
	    sync: "#carousel"
	  });
   };

});