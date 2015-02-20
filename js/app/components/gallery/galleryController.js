F5App.app.controller("galleryController", function ($scope, $rootScope){

   $scope.loadGallery = function (){
   	var album = ( arguments.length != 0 ) ? arguments[0] : '#album1' 

		$(album).find('.carousel').each(function(){
			$(this).flexslider({
			    animation: "slide",
			    controlNav: false,
			    animationLoop: true,
			    slideshow: false,
			    itemWidth: 150,
			    itemMargin: 5,
		    	asNavFor: $(this).siblings('.slider')
			});
		});
		   
		$(album).find('.slider').each(function(){
			$(this).flexslider({
			    animation: "slide",
			    controlNav: false,
			    animationLoop: true,
			    slideshow: false,
			    sync: $(this).siblings('.carousel')
			});
		});

	  	$('.nav-tabs li[role=album] a').click(function (e) {
		  	e.preventDefault();
		  	$(this).tab('show');
		});

   };

});