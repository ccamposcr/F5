    <div  id="divContent" class="clearfix" ng-controller="reservationController">
        <h1>Reservaciones</h1>
        <div id="pitchs">
            <ul class="clearfix">
                <li class="clearfix" ng-repeat="data in pitchs">
                    <a class="{{(pitchValue == data.id_pitch) ? 'active' : ''}}" href="<?php echo base_url() . $this->uri->segment(1) . '/{{data.id_pitch}}/' . 'reservaciones' ?>">Cancha {{data.id_pitch}}</a>
                </li>
            </ul>
            <?php
                $pitch = $this->uri->segment(2);
                $group = $this->uri->segment(1);
            ?>
            <input type="hidden" value="<?=$pitch?>" id="pitch" />
            <input type="hidden" value="<?=$group?>" id="group" />
        </div>
        <div id="calendar" class="clearfix">
        	<?=$calendar?>
        	<?php
	        	$year = $this->uri->segment(4);
	        	$month = $this->uri->segment(5);
        
                $year = ($year == '') ? date("Y", time()) : $year;
                $month = ($month == '') ? date("m", time()) : $month; 

                $isAdminUser = (!!$this->session->userdata('logged_in')) ? '1' : '0';

			?>
        	<input type="hidden" value="<?=$year?>" id="year" />
			<input type="hidden" value="<?=$month?>" id="month" />
            <input type="hidden" value="" id="day" />
            <input type="hidden" value="" id="team_id" />
            <input type="hidden" value="" id="reservation_time" />
            <input type="hidden" value="<?=$isAdminUser?>" id="isAdminUser"/>
        </div>
        <div id="dailyResevations">
            <ul id="timeAndTeamInfo" class="clearfix">
                <li>Hora</li>
                <li>Equipo 1</li>
                <li>Equipo 2</li>
            </ul>
            <ul id="reservations" ng-if="isDateForBookingValid() || !isDateForBookingValid() && isAdminUser()">
                <li class="row clearfix" ng-repeat="data in reservations">
                    <span class="reservation-time" data-time="{{timesForReservations[$index]}}">{{times[$index]}}</span>
                    <span ng-if="!!reservation.id && $index+1 == reservation.team_id && $index+1 == 1" class="blocked {{reservation.type_reservation == 1 ? 'completa' : ''}}" data-team="{{$index+1}}" ng-repeat="reservation in data">
                        {{reservation.name}} {{reservation.lastname}}
                    </span>
                    <span ng-if="!reservation.id && $index+1 == 1 || $index+1 == 2 && !!data[$index - 1].id && !data[$index].id" class="available" data-toggle="tooltip" data-delay='{ show: 10, hide: 50 }' data-placement="left" title="Haga click aquí para Reservar en Línea" data-team="{{$index+1}}" ng-repeat="reservation in data" ng-click="($index+1 == 2 && !!data[$index - 1].id) ? fields.typeReservationSelected = 'reto' : fields.typeReservationSelected = 'normal'">{{($index+1 == 2 && !!data[$index - 1].id) ? 'Equipo 1 Busca Reto' : ''}}</span>
                    <span ng-if="!reservation.id && $index+1 == 2 && !data[$index - 1].id" class="locked" data-team="{{$index+1}}" ng-repeat="reservation in data"></span>
                    <span ng-if="!!reservation.id && $index+1 == reservation.team_id && $index+1 == 2" class="blocked {{reservation.type_reservation == 1 ? 'completa' : ''}}" data-team="{{$index+1}}" ng-repeat="reservation in data">
                        {{reservation.name}} {{reservation.lastname}}
                    </span>
                </li>
            </ul>
            <ul id="reservations" ng-if="!isDateForBookingValid() && !isAdminUser()">
                <li class="row clearfix" ng-repeat="data in reservations">
                    <span class="reservation-time" data-time="{{timesForReservations[$index]}}">{{times[$index]}}</span>
                    <span class="blocked {{reservation.type_reservation == 1 ? 'completa' : ''}}" data-team="{{$index+1}}" ng-repeat="reservation in data">
                        {{reservation.name}} {{reservation.lastname}}
                    </span>
                </li>
            </ul>
        </div>
    </div>
    <div id="modals" ng-controller="modalController">
        <div class="modal fade" id="formReservationModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header clearfix">
                <button type="button" class="close" data-dismiss="modal" ng-hide="bookingType == 'bookingOnLine'"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="exampleModalLabel">Reservaciones</h4>
                <p ng-if="bookingType == 'bookingOnLine'">Tiempo Restante: <span>{{time}}</span></p>
              </div>
              <div class="modal-body">
                <div ng-hide="bookingType == 'bookingByCall' || bookingType == 'bookingOnLine'">
                    <h3>Elija el modo de reservaci&oacute;n</h3>
                    <ol>
                        <li>
                            <dl>
                                <dt>Reservaci&oacute;n en l&iacute;nea: le permite reservar y pagar la cancha usando su tarjeta de cr&eacute;dito o d&eacute;bito.</dt>
                                    <dd class="radio"><input id="bookingOnLine" class="bookingOnLine" type="radio" name="bookingOnLine" value="bookingOnLine" ng-model="bookingType" ng-click="setReservationState()"><label for="bookingOnLine">Reservar en l&iacute;nea</label></dd>
                            <dl/>
                        </li>
                        <li>
                            <dl>
                                <dt>También puede reservar su cancha mediante una llamada telef&oacute;nica.</dt>
                                    <dd class="radio"><input id="bookingByCall" type="radio" name="bookingByCall" value="bookingByCall" ng-model="bookingType"><label for="bookingByCall">Reservar por tel&eacute;fono</label></dd>
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
                        <h4>Fecha a Reservar: <span id="reservationInfo"></span></h4>
                    </div>
                    <div>
                        <form name="bookingForm">
                            <dl>
                                <dt>Informaci&oacute;n Personal</dt>
                                    <dd>
                                        <label>Nombre</label><input type="text" class="form-control" ng-model="fields.name" name="name" required/>
                                        <span class="error" ng-show="bookingForm.name.$error.required && bookingForm.name.$dirty">Por favor ingrese su Nombre</span>
                                    </dd>
                                    <dd>
                                        <label>Apellido</label><input type="text" class="form-control" ng-model="fields.lastname" name="lastname" required/>
                                        <span class="error" ng-show="bookingForm.lastname.$error.required && bookingForm.lastname.$dirty">Por favor ingrese su Apellido</span>
                                    </dd>
                                    <dd>
                                        <label>Email:</label><input type="email"  class="form-control" ng-model="fields.email" name="email"/>
                                        <!--<span class="error" ng-show="bookingForm.email.$error.required && bookingForm.email.$dirty">Por favor ingrese su correo el&eacute;ctronico</span>-->
                                        <span class="error" ng-show="bookingForm.email.$dirty && bookingForm.email.$invalid">Por favor ingrese un correo el&eacute;ctronico v&aacute;lido</span>
                                    </dd>
                                    <dd>
                                        <label>Telefono:</label><input type="tel" class="form-control" ng-model="fields.phone" name="phone" ng-minlength="8" ng-maxlength="8" ng-pattern="/^\d+$/"/>
                                        <span class="error" ng-show="bookingForm.phone.$dirty && (bookingForm.phone.$error.minlength || bookingForm.phone.$error.maxlength) || bookingForm.phone.$dirty && bookingForm.phone.$invalid">Por favor ingrese un t&eacute;lefono de 8 n&uacute;meros</span>
                                    </dd>
                                <dt>Tipo de Reservaci&oacute;n</dt>
                                    <dd ng-if="fields.typeReservationSelected == 'normal'" class="radio"><input type="radio" name="typeReservation" value="1" ng-model="fields.typeReservation"><label>Completa</label></dd>
                                    <dd class="radio"><input type="radio" name="typeReservation" value="2" ng-model="fields.typeReservation"><label>Reto</label></dd>
                                <dt>Opciones Adicionales</dt>
                                    <dd class="checkbox"><input name="setPitchAllWeeks" type="checkbox" ng-model="fields.setPitchAllWeeks"><label for="setPitchAllWeeks">Reservar esta cancha este mismo día todas las semanas</label></dd>
                                    <dd class="checkbox"><input name="setReferee" type="checkbox" ng-model="fields.setReferee"><label for="setReferee">Pagar &Aacute;rbitro</label></dd>
                            </dl>
                        </form>
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" ng-hide="bookingType == 'bookingOnLine'">Cerrar</button>
                <button id="cancelReservationBtn" type="button" class="btn btn-danger" data-toggle="confirmation" ng-show="bookingType == 'bookingOnLine'" data-btn-ok-label="Seguir" 
                data-btn-ok-icon="glyphicon glyphicon-share-alt" data-btn-ok-class="btn-success" data-btn-cancel-label="Salir" data-btn-cancel-icon="glyphicon glyphicon-ban-circle" 
                data-btn-cancel-class="btn-danger" data-title="Continuar la reservaci&oacute;n?">Cancelar</button>
                <input for="bookingForm" type="submit" class="btn btn-primary reserveBtn" ng-if="bookingType == 'bookingOnLine'" value="Reservar" ng-disabled="bookingForm.name.$dirty && bookingForm.name.$error.required || 
                bookingForm.lastname.$dirty && bookingForm.lastname.$error.required"/>
                <!--<button type="button" class="btn btn-primary">Send message</button>-->
              </div>
            </div>
          </div>
        </div>

        <div class="modal fade" id="reservation-watching-by-other-user-modal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">F5 Reservaciones</h4>
              </div>
              <div class="modal-body">
                <p>En este momento esta casilla está siendo vista por otro usuario.<br/>Por favor intente m&aacute;s tarde.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>

        <div class="modal fade" id="reservation-in-use-by-other-user-modal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">F5 Reservaciones</h4>
              </div>
              <div class="modal-body">
                <p>En este momento esta casilla está siendo reservada por otro usuario.<br/>Por favor intente con otra casilla.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>

        <div class="modal fade loading" id="set-pitch-all-weeks-modal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title">F5 Reservaciones</h4>
              </div>
              <div class="modal-body">
                <p>Por favor no cierre el navegador. El sistema está reservando el d&iacute;a elegido todas las semanas por un per&iacute;odo de 1 a&ntilde;o</p>
                <img src="<?php echo base_url(); ?>img/loading.gif" width="127" height="128"/>
              </div>
            </div>
          </div>
        </div>

        <div class="modal fade loading" id="loading-modal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title">F5 Reservaciones</h4>
              </div>
              <div class="modal-body">
                <p>Cargando ...</p>
                <img src="<?php echo base_url(); ?>img/loading.gif" width="127" height="128"/>
              </div>
            </div>
          </div>
        </div>

        <div class="modal fade" id="already-reserved-modal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">F5 Reservaciones</h4>
              </div>
              <div class="modal-body">
                <p>Esta casilla ya fue reservada. Por favor escoja otra casilla para reservar</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>

        <div class="modal fade" id="successful-reserved-modal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">F5 Reservaciones</h4>
              </div>
              <div class="modal-body">
                <p>Su reservacion ha sido creada satisfactoriamente</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>

    </div>