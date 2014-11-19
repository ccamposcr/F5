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
        <div id="calendar" class="clearfix">
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
                    <span class="reservation-time" data-time="{{timesForReservations[$index]}}">{{times[$index]}}</span>
                    <!--<span class="{{reservation.id ? 'blocked' : 'available'}} {{reservation.type_reservation == 1 ? 'completa' : ''}}" data-team="{{$index+1}}" ng-repeat="reservation in data">-->
                    <span ng-if="!!reservation.id" class="blocked {{reservation.type_reservation == 1 ? 'completa' : ''}}" data-team="{{$index+1}}" ng-repeat="reservation in data">
                        {{reservation.name}} {{reservation.lastname}}
                    </span>
                    <span data-toggle="tooltip" data-placement="left" title="Haga click aquí para Reservar en Línea" ng-if="!reservation.id" class="available" data-team="{{$index+1}}" ng-repeat="reservation in data"></span>
                </li>
            </ul>
        </div>
    </div>
    <div id="modals" ng-controller="modalController">
        <div class="modal fade" id="formReservationModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" ng-hide="bookingType == 'bookingOnLine'"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="exampleModalLabel">Reservaciones</h4>
              </div>
              <div class="modal-body">
                <div ng-hide="bookingType == 'bookingByCall' || bookingType == 'bookingOnLine'">
                    <h3>Elija el modo de reservaci&oacute;n</h3>
                    <ol>
                        <li>
                            <dl>
                                <dt>Reservaci&oacute;n en l&iacute;nea: le permite reservar y pagar la cancha usando su tarjeta de cr&eacute;dito o d&eacute;bito</dt>
                                    <dd><input id="bookingOnLine" type="radio" name="bookingOnLine" value="bookingOnLine" ng-model="bookingType" ng-click="setReservationState()"><label for="bookingOnLine">Reservar en l&iacute;nea</label></dd>
                            <dl/>
                        </li>
                        <li>
                            <dl>
                                <dt>También puede Reservar su cancha mediante una llamada telef&oacute;nica.</dt>
                                    <dd><input id="bookingByCall" type="radio" name="bookingByCall" value="bookingByCall" ng-model="bookingType"><label for="bookingByCall">Reservar por tel&eacute;fono</label></dd>
                            </dl>
                        </li>
                    </ol>
                </div>

                <div id="bookingByCall" ng-show="bookingType == 'bookingByCall'">
                    <h3>Reservaci&oacute;n por tel&eacute;fono</h3>
                    <p>Para reservar llame al siguiente n&uacute;mero: <a href="tel:(506)8888-8888">(506)8888-8888</a></p>
                </div>
                <div id="bookingOnLine" ng-show="bookingType == 'bookingOnLine'">
                    <h3>Reservaci&oacute;n en l&iacute;nea</h3>
                    <div>
                        <h3>Confirmaci&oacute;n</h3>
                    </div>
                    <div>
                        <form>
                            <dl>
                                <dt>Informaci&oacute;n Personal</dt>
                                    <dd><label>Nombre</label><input type="text" ng-model="nombre"/></dd>
                                    <dd><label>Apellido</label><input type="text" ng-model="apellido"/></dd>
                                    <dd><label>Email:</label><input type="email" ng-model="email"/></dd>
                                    <dd><label>Telefono:</label><input type="tel" ng-model="telefono"/></dd>
                                <dt>Tipo de Reservaci&oacute;n</dt>
                                    <dd><input type="radio" name="typeReservation" value="completa" ng-model="typeReservation"><label>Completa</label></dd>
                                    <dd><input type="radio" name="typeReservation" value="reto" ng-model="typeReservation"><label>Reto</label></dd>
                                <dt>Opciones Adicionales</dt>
                                    <dd><input id="setPitchAllWeek" name="setPitchAllWeek" type="checkbox" ng-model="setPitchAllWeek"><label for="setPitchAllWeek">Reservar esta cancha este mismo día todas las semanas</label></dd>
                                    <dd><input id="setReferee" name="setReferee" type="checkbox" ng-model="setReferee"><label for="setReferee">Pagar &Aacute;rbitro</label></dd>
                            </dl>
                        </form>
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" ng-hide="bookingType == 'bookingOnLine'">Cerrar</button>
                <button id="cancelReservationBtn" type="button" class="btn btn-danger" data-toggle="confirmation" ng-show="bookingType == 'bookingOnLine'" data-btn-ok-label="Seguir" 
                data-btn-ok-icon="glyphicon glyphicon-share-alt" data-btn-ok-class="btn-success" data-btn-cancel-label="Salir" data-btn-cancel-icon="glyphicon glyphicon-ban-circle" 
                data-btn-cancel-class="btn-danger" data-title="Abandonar la reservaci&oacute;n?">Cancelar</button>
                <button id="reserveBtn" type="button" class="btn btn-primary" ng-if="bookingType == 'bookingOnLine'">Reservar</button>
                <!--<button type="button" class="btn btn-primary">Send message</button>-->
              </div>
            </div>
          </div>
        </div>
    </div>