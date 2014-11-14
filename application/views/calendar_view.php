    <div id="divContentReservations" class="clearfix" ng-controller="reservationController">
        <h1>Reservaciones</h1>
        <div id="pitchs">
            <ul class="clearfix">
                <li class="clearfix" ng-repeat="data in pitchs">
                    <a href="<?php echo base_url() . $this->uri->segment(1) . '/{{data.id_pitch}}/' . 'reservaciones' ?>">Cancha {{data.id_pitch}}</a>
                </li>
            </ul>
            <?php
                $pitch = $this->uri->segment(1);
            ?>
            <input type="hidden" value="<?=$pitch?>" id="pitch" />
        </div>
        <div id="calendar">
        	<?=$calendar?>
        	<?php
	        	$year = $this->uri->segment(4);
	        	$month = $this->uri->segment(5);
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
            <ul id="timeAndTeamInfo" class="clearfix">
                <li>Hora</li>
                <li>Equipo 1</li>
                <li>Equipo 2</li>
            </ul>
            <ul id="reservations">
                <li class="row clearfix" ng-repeat="data in reservations">
                    <span class="reservation-time">{{times[$index]}}</span>
                    <!--<span class="{{reservation.id ? 'blocked' : 'available'}} {{reservation.type_reservation == 1 ? 'completa' : ''}}" data-team="{{$index+1}}" ng-repeat="reservation in data">-->
                    <span ng-if="!!reservation.id" class="blocked {{reservation.type_reservation == 1 ? 'completa' : ''}}" data-team="{{$index+1}}" ng-repeat="reservation in data">
                        {{reservation.name}} {{reservation.lastname}}
                    </span>
                    <span ng-if="!reservation.id" class="available" data-team="{{$index+1}}" ng-repeat="reservation in data"></span>
                </li>
            </ul>
        </div>
    </div>

    <div class="modal fade" id="formReservationModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="exampleModalLabel">Reservaciones</h4>
          </div>
          <div class="modal-body">
            <p><input type="radio" name="reservation" value="bookingByCall"><label>Reservar por llamada</label></p>
            <p><input type="radio" name="reservation" value="bookingOnLine"><label>Reservar en linea</label></p>

            <div id="bookingByCall">
                <h3>Reservar por llamada</h3>
            </div>
            <div id="bookingOnLine">
                <h3>Reservar en linea</h3>
            </div>


          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <!--<button type="button" class="btn btn-primary">Send message</button>-->
          </div>
        </div>
      </div>
    </div>