<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>F5</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

        <link rel="stylesheet" href="<?php echo base_url(); ?>css/normalize.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>css/main.css">
        <script src="<?php echo base_url(); ?>js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body ng-app="F5App" ng-controller="reservationController">
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
        <div id="calendar">
        	<?=$calendar?>
        	<?php
	        	$year = $this->uri->segment(2);
	        	$month = $this->uri->segment(3);
	        	if ($year == ''){
					$year  = date("Y", time());
				}

				if ($month == ''){
					$month = date("m", time());
				}
			?>
        	<input type="hidden" value="<?=$year?>" id="year" />
			<input type="hidden" value="<?=$month?>" id="month" />
        </div>
        <div id="dailyResevations">
            <ul>
                <li ng-repeat="data in reservations">
                    <span class="reservation_time">{{times[$index]}}</span>
                    <span class="{{reservation.id ? 'blocked' : 'available'}} {{reservation.type_reservation == 1 ? 'completa' : ''}}" data-team="{{$index+1}}" ng-repeat="reservation in data">
                        {{reservation.name}} {{reservation.lastname}}
                    </span>
                </li>
            </ul>
        </div>

        <script src="<?php echo base_url(); ?>js/vendor/jquery-1.10.2.min.js"></script>
        <script src="<?php echo base_url(); ?>js/vendor/angular.min.js"></script>
        <script src="<?php echo base_url(); ?>js/plugins.js"></script>
        <script src="<?php echo base_url(); ?>js/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X');ga('send','pageview');
        </script>
    </body>
</html>
