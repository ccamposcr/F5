<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Api_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model("api_model");
    }

    public function getReservationByTime(){
        $reservation_year = ( isset($_POST['reservation_year']) ) ? strip_tags($_POST['reservation_year']) : date("Y", time());
        $reservation_month = ( isset($_POST['reservation_month']) ) ? strip_tags($_POST['reservation_month']) : date("m", time());
        $reservation_day = ( isset($_POST['reservation_day']) ) ? strip_tags($_POST['reservation_day']) : date("d", time());
        $reservation_time = ( isset($_POST['reservation_time']) ) ? strip_tags($_POST['reservation_time']) : '08-09';
        $group_id = ( isset($_POST['group_id']) ) ? strip_tags($_POST['group_id']) : 1;
        $pitch_id = ( isset($_POST['pitch_id']) ) ? strip_tags($_POST['pitch_id']) : 1;
        $reservation = $this->api_model->getReservationByTime($reservation_year,$reservation_month,$reservation_day,$reservation_time,$group_id,$pitch_id);
        echo json_encode($reservation);
    }

    public function getReservationByDay(){
        $reservation_year = ( isset($_POST['reservation_year']) ) ? strip_tags($_POST['reservation_year']) : date("Y", time());
        $reservation_month = ( isset($_POST['reservation_month']) ) ? strip_tags($_POST['reservation_month']) : date("m", time());
        $reservation_day = ( isset($_POST['reservation_day']) ) ? strip_tags($_POST['reservation_day']) : date("d", time());
        $group_id = ( isset($_POST['group_id']) ) ? strip_tags($_POST['group_id']) : 1;
        $pitch_id = ( isset($_POST['pitch_id']) ) ? strip_tags($_POST['pitch_id']) : 1;
        $reservation = $this->api_model->getReservationByDay($reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id);
        echo json_encode($reservation);
    }

    public function getPitchByGroup(){
        $group = ( isset($_POST['group']) ) ? strip_tags($_POST['group']) : '1';
        $pitchs = $this->api_model->getPitchByGroup($group);
        echo json_encode($pitchs);
    }

    public function getGroup(){
        $group_name = ( isset($_POST['group_name']) ) ? strip_tags($_POST['group_name']) : 'escazu';
        $id_group = $this->api_model->getGroup($group_name);
        echo json_encode($id_group);
    }

    public function getTemporaryReservationState(){
        $team_id = ( isset($_POST['team_id']) ) ? strip_tags($_POST['team_id']) : '1';
        $reservation_time = ( isset($_POST['reservation_time']) ) ? strip_tags($_POST['reservation_time']) : '08-09';
        $reservation_year = ( isset($_POST['reservation_year']) ) ? strip_tags($_POST['reservation_year']) : date("Y", time());
        $reservation_month = ( isset($_POST['reservation_month']) ) ? strip_tags($_POST['reservation_month']) : date("m", time());
        $reservation_day = ( isset($_POST['reservation_day']) ) ? strip_tags($_POST['reservation_day']) : date("d", time());
        $group_id = ( isset($_POST['group_id']) ) ? strip_tags($_POST['group_id']) : 1;
        $pitch_id = ( isset($_POST['pitch_id']) ) ? strip_tags($_POST['pitch_id']) : 1;
        $state = $this->api_model->getTemporaryReservationState($team_id,$reservation_time,$reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id);
        echo json_encode($state);
    }

    public function setTemporaryReservationState(){
        $team_id = ( isset($_POST['team_id']) ) ? strip_tags($_POST['team_id']) : '1';
        $reservation_time = ( isset($_POST['reservation_time']) ) ? strip_tags($_POST['reservation_time']) : '08-09';
        $reservation_year = ( isset($_POST['reservation_year']) ) ? strip_tags($_POST['reservation_year']) : date("Y", time());
        $reservation_month = ( isset($_POST['reservation_month']) ) ? strip_tags($_POST['reservation_month']) : date("m", time());
        $reservation_day = ( isset($_POST['reservation_day']) ) ? strip_tags($_POST['reservation_day']) : date("d", time());
        $group_id = ( isset($_POST['group_id']) ) ? strip_tags($_POST['group_id']) : 1;
        $pitch_id = ( isset($_POST['pitch_id']) ) ? strip_tags($_POST['pitch_id']) : 1;
        $state = ( isset($_POST['state']) ) ? strip_tags($_POST['state']) : 3;
        $this->api_model->setTemporaryReservationState($team_id,$reservation_time,$reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id,$state);
    }

    public function checkIfReservationExist(){
        $team_id = ( isset($_POST['team_id']) ) ? strip_tags($_POST['team_id']) : '1';
        $reservation_time = ( isset($_POST['reservation_time']) ) ? strip_tags($_POST['reservation_time']) : '08-09';
        $reservation_year = ( isset($_POST['reservation_year']) ) ? strip_tags($_POST['reservation_year']) : date("Y", time());
        $reservation_month = ( isset($_POST['reservation_month']) ) ? strip_tags($_POST['reservation_month']) : date("m", time());
        $reservation_day = ( isset($_POST['reservation_day']) ) ? strip_tags($_POST['reservation_day']) : date("d", time());
        $group_id = ( isset($_POST['group_id']) ) ? strip_tags($_POST['group_id']) : 1;
        $pitch_id = ( isset($_POST['pitch_id']) ) ? strip_tags($_POST['pitch_id']) : 1;
        $result = $this->api_model->checkIfReservationExist($team_id,$reservation_time,$reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id);
        echo json_encode($result);
    }

    public function createReservation(){
        $team_id = ( isset($_POST['team_id']) ) ? strip_tags($_POST['team_id']) : '1';
        $reservation_time = ( isset($_POST['reservation_time']) ) ? strip_tags($_POST['reservation_time']) : '08-09';
        $reservation_year = ( isset($_POST['reservation_year']) ) ? strip_tags($_POST['reservation_year']) : date("Y", time());
        $reservation_month = ( isset($_POST['reservation_month']) ) ? strip_tags($_POST['reservation_month']) : date("m", time());
        $reservation_day = ( isset($_POST['reservation_day']) ) ? strip_tags($_POST['reservation_day']) : date("d", time());
        $group_id = ( isset($_POST['group_id']) ) ? strip_tags($_POST['group_id']) : 1;
        $pitch_id = ( isset($_POST['pitch_id']) ) ? strip_tags($_POST['pitch_id']) : 1;
        $name = ( isset($_POST['name']) ) ? strip_tags($_POST['name']) : 1;
        $lastname = ( isset($_POST['lastname']) ) ? strip_tags($_POST['lastname']) : 1;
        $phone = ( isset($_POST['phone']) ) ? strip_tags($_POST['phone']) : 1;
        $email = ( isset($_POST['email']) ) ? strip_tags($_POST['email']) : 1;
        $type_reservation = ( isset($_POST['type_reservation']) ) ? strip_tags($_POST['type_reservation']) : 1;
        $referee_required = ( isset($_POST['referee_required']) ) ? strip_tags($_POST['referee_required']) : 1;
        $reservation_price = ( isset($_POST['reservation_price']) ) ? strip_tags($_POST['reservation_price']) : 1;

        $this->api_model->createReservation($team_id,$reservation_time,$reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id,$name,$lastname,$phone,$email,$type_reservation,$referee_required,$reservation_price);
    }
}