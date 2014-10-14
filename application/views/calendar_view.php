<?php include('includes/header.php') ?>

    <div ng-controller="reservationController">
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
                <li class="row clearfix" ng-repeat="data in reservations">
                    <span class="reservation-time">{{times[$index]}}</span>
                    <span class="{{reservation.id ? 'blocked' : 'available'}} {{reservation.type_reservation == 1 ? 'completa' : ''}}" data-team="{{$index+1}}" ng-repeat="reservation in data">
                        {{reservation.name}} {{reservation.lastname}}
                    </span>
                </li>
            </ul>
        </div>
    </div>
        
<?php include('includes/footer.php') ?>