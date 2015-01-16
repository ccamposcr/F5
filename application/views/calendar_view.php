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
                    <span ng-if="!!reservation.id && $index+1 == reservation.team_id && $index+1 == 1 && !isAdminUser()" class="blocked {{reservation.type_reservation == 1 ? 'completa' : ''}}" data-team="{{$index+1}}" ng-repeat="reservation in data">
                        <span>Reservado por:</span> {{reservation.name}} {{reservation.lastname}}
                    </span>
                    <span ng-if="!!reservation.id && $index+1 == reservation.team_id && $index+1 == 1 && isAdminUser()" class="blocked {{reservation.type_reservation == 1 ? 'completa' : ''}} showInfo" data-team="{{$index+1}}" ng-repeat="reservation in data">
                        <span>Reservado por:</span>  {{reservation.name}} {{reservation.lastname}}
                    </span>
                    <span ng-if="!reservation.id && $index+1 == 1 || $index+1 == 2 && !!data[$index - 1].id && !data[$index].id" class="available" data-toggle="tooltip" data-delay='{ show: 10, hide: 50 }' data-placement="left" title="Haga click aquí para Reservar en Línea" data-team="{{$index+1}}" ng-repeat="reservation in data" ng-click="($index+1 == 2 && !!data[$index - 1].id) ? fields.typeReservationSelected = 'reto' : fields.typeReservationSelected = 'normal'">{{($index+1 == 2 && !!data[$index - 1].id) ? 'Equipo 1 Busca Reto' : ''}}</span>
                    <span ng-if="!reservation.id && $index+1 == 2 && !data[$index - 1].id" class="locked" data-team="{{$index+1}}" ng-repeat="reservation in data"></span>
                    <span ng-if="!!reservation.id && $index+1 == reservation.team_id && $index+1 == 2 && !isAdminUser()" class="blocked {{reservation.type_reservation == 1 ? 'completa' : ''}}" data-team="{{$index+1}}" ng-repeat="reservation in data">
                        <span>Reservado por:</span>  {{reservation.name}} {{reservation.lastname}}
                    </span>
                    <span ng-if="!!reservation.id && $index+1 == reservation.team_id && $index+1 == 2 && isAdminUser()" class="blocked {{reservation.type_reservation == 1 ? 'completa' : ''}} showInfo" data-team="{{$index+1}}" ng-repeat="reservation in data">
                        <span>Reservado por:</span>  {{reservation.name}} {{reservation.lastname}}
                    </span>
                </li>
            </ul>
            <ul id="reservations" ng-if="!isDateForBookingValid() && !isAdminUser()">
                <li class="row clearfix" ng-repeat="data in reservations">
                    <span class="reservation-time" data-time="{{timesForReservations[$index]}}">{{times[$index]}}</span>
                    <span class="blocked {{reservation.type_reservation == 1 ? 'completa' : ''}}" data-team="{{$index+1}}" ng-repeat="reservation in data">
                        <span ng-if="!!reservation.name && !! reservation.lastname">Reservado por:</span>  {{reservation.name}} {{reservation.lastname}}
                    </span>
                </li>
            </ul>
        </div>
        <?php 
          if( $isAdminUser ){
        ?>
          <button type="button" class="btn btn-primary searchBtn">Buscar</button>
        <?php
          } 
        ?>
    </div>
    <div id="modals" ng-controller="modalController">
        <div class="modal fade" id="formReservationModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header clearfix">
                <button type="button" class="close" data-dismiss="modal" ng-hide="bookingType == 'bookingOnLine'"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Reservaciones<br/><span>Fecha a Reservar: <span id="reservationInfo"></span></span></h4>
                <p ng-if="bookingType == 'bookingOnLine'">Tiempo Restante: <span>{{time}}</span></p>
              </div>
              <div class="modal-body clearfix">
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
                    <div id="bookingForm" ng-show="fields.stepReservation == 1">
                        <form name="bookingForm">
                            <dl>
                                <dt>Informaci&oacute;n Personal 
                                  <?php 
                                  if( $isAdminUser ){
                                  ?>
                                    <button type="button" class="btn btn-primary selectUserBtn">Seleccionar Usuario</button>
                                  <?php
                                    } 
                                  ?>
                                </dt>
                                    <dd class="contentInfoForm">
                                        <label>Nombre</label><input type="text" class="form-control" ng-model="fields.name" name="name" required/>
                                        <span class="error" ng-show="bookingForm.name.$error.required && bookingForm.name.$dirty">Por favor ingrese su Nombre</span>
                                    </dd>
                                    <dd class="contentInfoForm">
                                        <label>1<sub>er</sub> Apellido</label><input type="text" class="form-control" ng-model="fields.lastname1" name="lastname1" required/>
                                        <span class="error" ng-show="bookingForm.lastname1.$error.required && bookingForm.lastname1.$dirty">Por favor ingrese su 1<sub>er</sub>Apellido</span>
                                    </dd>
                                    <dd class="contentInfoForm">
                                        <label>2<sub>do</sub> Apellido</label><input type="text" class="form-control" ng-model="fields.lastname2" name="lastname2" required/>
                                        <span class="error" ng-show="bookingForm.lastname2.$error.required && bookingForm.lastname2.$dirty">Por favor ingrese su 2<sub>do</sub>Apellido</span>
                                    </dd>
                                    <dd class="contentInfoForm">
                                        <label>Email:</label><input type="email"  class="form-control" ng-model="fields.email" name="email"/>
                                        <!--<span class="error" ng-show="bookingForm.email.$error.required && bookingForm.email.$dirty">Por favor ingrese su correo el&eacute;ctronico</span>-->
                                        <span class="error" ng-show="bookingForm.email.$dirty && bookingForm.email.$invalid">Por favor ingrese un correo el&eacute;ctronico v&aacute;lido</span>
                                    </dd>
                                    <dd class="contentInfoForm">
                                        <label>Celular:</label><input type="tel" class="form-control" ng-model="fields.phone" name="phone" ng-minlength="8" ng-maxlength="8" ng-pattern="/^\d+$/" required/>
                                        <span class="error" ng-show="bookingForm.phone.$dirty && (bookingForm.phone.$error.minlength || bookingForm.phone.$error.maxlength) || bookingForm.phone.$dirty && bookingForm.phone.$invalid">Por favor ingrese un t&eacute;lefono de 8 n&uacute;meros</span>
                                        <span class="error" ng-show="bookingForm.phone.$error.required && bookingForm.phone.$dirty">Por favor ingrese su celular</span>
                                    </dd>
                                <dt>Tipo de Reservaci&oacute;n</dt>
                                    <dd ng-if="fields.typeReservationSelected == 'normal'" class="radio"><input id="complete" type="radio" name="typeReservation" value="1" ng-model="fields.typeReservation" required><label for="complete">Completa (Marque esta opci&oacute;n si ya tiene formado Equipo 1 y Equipo 2)</label></dd>
                                    <dd class="radio"><input id="challenge" type="radio" name="typeReservation" value="2" ng-model="fields.typeReservation" ng-click="fields.setReferee = true" required><label for="challenge">Reto <span ng-if="fields.typeReservationSelected == 'normal'">(Marque esta opci&oacute;n si necesita Equipo 2 para Reto)</span></label></dd>
                                    <!--<span class="error" ng-show="!fields.typeReservation">Por favor seleccione una opci&oacute;n</span>-->
                                <dt>Opciones Adicionales</dt>
                                    <dd class="checkbox"><input id="setReferee" name="setReferee" type="checkbox" ng-model="fields.setReferee" ng-disabled="fields.typeReservation==2" ng-checked="(fields.typeReservationSelected == 'reto') && (fields.setReferee = true)"><label for="setReferee">Pagar &Aacute;rbitro (Marque esta opci&oacute;n &uacute;nicamente si necesita &aacute;rbitro)</label></dd>
                                    <dd ng-if="fields.typeReservationSelected == 'normal'" class="checkbox"><input id="setPitchAllWeeks" name="setPitchAllWeeks" type="checkbox" ng-model="fields.setPitchAllWeeks"><label for="setPitchAllWeeks">Cancha Fija(Reservar esta cancha este mismo día todas las semanas)<br/>*Se cobra d&eacute;posito</label><button ng-if="fields.setPitchAllWeeks" type="button" class="btn btn-primary checkAvailabilityBtn">Comprobar Disponibilidad</button></dd>
                            </dl>
                            
                        </form>
                    </div>
                    <?php 
                    if( !$isAdminUser ){
                    ?>
                    <div id="carDataForm" ng-show="fields.stepReservation == 2">
                        <form name="carDataForm">
                            <dl>
                                <dd><label>Nombre:<label> {{fields.name}}<br/><label>Apellido:</label> {{fields.lastname1}}</dd>
                                <dd class="contentInfoForm">
                                    <label>Tarjeta</label>
                                    <input type="text" class="form-control" ng-model="fields.number" name="number" required/>
                                    <span class="error" ng-show="carDataForm.number.$error.required && carDataForm.number.$dirty">Por favor ingrese su Tarjeta</span>
                                </dd>
                                <dd class="contentInfoForm">
                                    <label>Tipo</label>
                                    <select ng-model="fields.type">
                                        <option value="visa">Visa</option>
                                        <option value="mastercard">Mastercard</option>
                                        <option value="discover">Discover</option>
                                        <option value="amex">Amex</option>
                                    </select>
                                </dd>
                                <dd class="contentInfoForm">
                                    <label>Mes Expiraci&oacute;n</label>
                                    <select ng-model="fields.expire_month">
                                        <option value="1">1 - Enero</option>
                                        <option value="2">2 - Febrero</option>
                                        <option value="3">3 - Marzo</option>
                                        <option value="4">4 - Abril</option>
                                        <option value="5">5 - Mayo</option>
                                        <option value="6">6 - Junio</option>
                                        <option value="7">7 - Julio</option>
                                        <option value="8">8 - Agosto</option>
                                        <option value="9">9 - Septiembre</option>
                                        <option value="10">10 - Octubre</option>
                                        <option value="11">11 - Noviembre</option>
                                        <option value="12">12 - Diciembre</option>
                                    </select>
                                </dd>
                                <dd class="contentInfoForm">
                                    <label>A&ntilde;o Expiraci&oacute;n</label>
                                    <select ng-model="fields.expire_year">
                                        <option value="2014">2014</option>
                                        <option value="2015">2015</option>
                                        <option value="2016">2016</option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                        <option value="2023">2023</option>
                                        <option value="2024">2024</option>
                                        <option value="2025">2025</option>
                                    </select>
                                </dd>
                                <dd class="contentInfoForm">
                                    <label>C&oacute;digo de Validaci&oacute;n (cvv)</label>
                                    <input type="text" class="form-control" ng-model="fields.cvv2" name="cvv2" required/>
                                    <span class="error" ng-show="carDataForm.cvv2.$error.required && carDataForm.cvv2.$dirty">Por favor ingrese su ccv</span>
                                </dd>
                            </dl>
                        </form>
                    </div>
                    <?php
                    }
                    ?>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" ng-hide="bookingType == 'bookingOnLine'">Cerrar</button>
                <button id="cancelReservationBtn" type="button" class="btn btn-danger" data-toggle="confirmation" ng-show="bookingType == 'bookingOnLine'" data-btn-ok-label="Seguir" 
                data-btn-ok-icon="glyphicon glyphicon-share-alt" data-btn-ok-class="btn-success" data-btn-cancel-label="Salir" data-btn-cancel-icon="glyphicon glyphicon-ban-circle" 
                data-btn-cancel-class="btn-danger" data-title="Continuar la reservaci&oacute;n?">Cancelar</button>
                <?php 
                  if( $isAdminUser ){
                  ?>
                <input for="bookingForm" type="submit" class="btn btn-primary reserveBtn" ng-if="bookingType == 'bookingOnLine'" value="Reservar" ng-disabled="bookingForm.name.$error.required || bookingForm.lastname1.$error.required || bookingForm.lastname2.$error.required || !fields.typeReservation || bookingForm.email.$invalid || bookingForm.phone.$error.minlength || bookingForm.phone.$error.maxlength || bookingForm.phone.$invalid || bookingForm.phone.$error.required"/>
                <?php
                  } else{
                ?>
                <input for="bookingForm" type="submit" class="btn btn-primary insertCardData" ng-if="bookingType == 'bookingOnLine' && fields.stepReservation == 1" value="Continuar" ng-disabled="bookingForm.name.$error.required || bookingForm.lastname1.$error.required || bookingForm.lastname2.$error.required || !fields.typeReservation || bookingForm.email.$invalid || bookingForm.phone.$error.minlength || bookingForm.phone.$error.maxlength || bookingForm.phone.$invalid || bookingForm.phone.$error.required"/>
                <input for="bookingForm" type="submit" class="btn btn-primary returnToFormReservation" ng-if="bookingType == 'bookingOnLine' && fields.stepReservation == 2" value="Regresar"/>
                <input for="bookingForm" type="submit" class="btn btn-primary reserveAndPayBtn" ng-if="bookingType == 'bookingOnLine' && fields.stepReservation == 2" value="Reservar" ng-disabled=""/>
                <?php
                  }
                ?>
                <!--<button type="button" class="btn btn-primary">Send message</button>-->
              </div>
            </div>
          </div>
        </div>
<!-- reservation-watching-by-other-user-modal -->
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
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
              </div>
            </div>
          </div>
        </div>
<!-- reservation-in-use-by-other-user-modal -->
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
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
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
                <p>Por favor no cierre el navegador. El sistema está reservando la cancha fija el d&iacute;a elegido todas las semanas</p>
                <img src="<?php echo base_url(); ?>img/loading.gif" width="127" height="128"/>
              </div>
            </div>
          </div>
        </div>

<!-- loading-modal -->
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
<!-- already-reserved-modal -->
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
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
              </div>
            </div>
          </div>
        </div>
<!-- successful-reserved-modal -->
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
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
              </div>
            </div>
          </div>
        </div>
  <!-- check-availability-modal -->
            <div class="modal fade" id="check-availability-modal">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Comprobar Disponibilidad</h4>
                  </div>
                  <div class="modal-body">
                    <div class="{{(days[1]) ? 'available' : 'busy'}}" ng-repeat="days in daysAvailables">
                      <span>{{days[0]}}</span><span>{{(days[1]) ? 'Disponible' : 'Ocupado'}}</span>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                  </div>
                </div>
              </div>
            </div>

        <?php 
          if( $isAdminUser ){
        ?>
<!-- show-info-modal -->
            <div class="modal fade" id="show-info-modal">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Informaci&oacute;n de la Reservaci&oacute;n</h4>
                  </div>
                  <div class="modal-body">
                      <div class="divContentShowInfoModal"><label>Nombre:</label><span> {{completeInfo[0].name}}</span></div>
                      <div class="divContentShowInfoModal"><label>Apellidos:</label><span> {{completeInfo[0].lastname}}</span></div>
                      <div class="divContentShowInfoModal"><label>Tel&eacute;fono:</label><span> {{completeInfo[0].phone}}</span></div>
                      <div class="divContentShowInfoModal"><label>Email:</label><span> {{completeInfo[0].email}}</span></div>
                      <div class="divContentShowInfoModal"><label>Requiere &Aacute;rbitro:</label><span> {{(completeInfo[0].referee_required == 1) ? 'S&iacute;' : 'No'}}</span></div>
                      <div class="divContentShowInfoModal"><label>Fecha de Reservaci&oacute;n:</label><span> {{completeInfo[0].reservation_day}}/{{completeInfo[0].reservation_month}}/{{completeInfo[0].reservation_year}}</span></div>
                      <div class="divContentShowInfoModal"><label>Hora de Reservaci&oacute;n:</label><span> {{getCorrectTimeReservation(completeInfo[0].reservation_time)}}</span></div>
                      <div class="divContentShowInfoModal"><label>Total Cobrado:</label><span>{{completeInfo[0].reservation_price}}</span></div>
                      <button type="button" class="btn btn-warning delete" data-dismiss="modal">Eliminar Reservaci&oacute;n</button>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                  </div>
                </div>
              </div>
            </div>
<!--search-modal -->
            <div class="modal fade" id="search-modal">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Clientes</h4>
                  </div>
                  <div class="modal-body">
                    <label>Buscar:</label> <input class="searchInput" ng-model="searchText">
                    <table id="searchResults">
                      <tr><th ng-if="selectUserMode"></th><th>Nombre</th><th>Apellidos</th><th>Tel&eacute;fono</th><th>Email</th></tr>
                      <tr ng-repeat="client in clients | filter:searchText" class="rowClient">
                        <td ng-if="selectUserMode" class="info_personas"><input class="client" type="radio" name="client" ng-model="fields.client" value="{{$index}}"/></td>
                        <td class="info_personas">{{$index+1}}. {{client.name}}</td>
                        <td class="info_personas">{{client.lastname}}</td>
                        <td class="info_personas">{{client.phone}}</td>
                        <td class="info_personas">{{client.email}}</td>
                        <input type="hidden" value="{{client.name}}" class="clientName" />
                        <input type="hidden" value="{{client.lastname}}" class="clientLastName" />
                        <input type="hidden" value="{{client.phone}}" class="clientPhone" />
                        <input type="hidden" value="{{client.email}}" class="clientEmail" />
                      </tr>
                    </table>
                  </div>
                  <div class="modal-footer">
                    <button ng-if="selectUserMode" type="button" class="btn btn-primary fillFormClientBtn" ng-disabled="fields.client == ''">Aceptar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                  </div>
                </div>
              </div>
            </div>
<!-- change-password-modal -->
            <div class="modal fade" id="change-password-modal">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Cambiar Contrase&ntilde;a</h4>
                  </div>
                  <div class="modal-body">
                    <form name="changePassForm">
                      <label>Nueva contrase&ntilde;a</label><input type="password" ng-model="fields.password" class="form-control" name="password" ng-minlength="5" required/>
                      <label>Confirmaci&oacute;n contrase&ntilde;a</label><input type="password" ng-model="fields.confirmation" class="form-control" name="confirmation" ng-minlength="5" required/>
                      <span class="error" ng-show="changePassForm.password.$error.required && changePassForm.password.$dirty || changePassForm.confirmation.$error.required && changePassForm.confirmation.$dirty">Ambos campos son requeridos</span>
                      <span class="error" ng-show="fields.password != fields.confirmation && changePassForm.password.$dirty && changePassForm.confirmation.$dirty">Las contrase&ntilde;as deben ser iguales</span>
                      <span class="error" ng-show="changePassForm.password.$error.minlength && changePassForm.password.$dirty || changePassForm.confirmation.$error.minlength && changePassForm.confirmation.$dirty">La contrase&ntilde;a debe tener un m&iacute;nimo de 5 caracteres</span>
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary changePasswordBtn" ng-disabled="changePassForm.password.$error.required || changePassForm.confirmation.$error.required || fields.password != fields.confirmation || changePassForm.password.$error.minlength || changePassForm.confirmation.$error.minlength">Cambiar</button>
                  </div>
                </div>
              </div>
            </div>
        <?php
          } 
        ?>

    </div>