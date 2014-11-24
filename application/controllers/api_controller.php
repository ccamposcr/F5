<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Api_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model("api_model");
    }

    public function getReservationByTime(){
        $reservation_year = ( isset($_POST['year']) ) ? $_POST['year'] : date("Y", time());
        $reservation_month = ( isset($_POST['month']) ) ? $_POST['month'] : date("m", time());
        $reservation_day = ( isset($_POST['day']) ) ? $_POST['day'] : date("d", time());
        $reservation_time = ( isset($_POST['time']) ) ? $_POST['time'] : '08-09';
        $group_id = ( isset($_POST['group_id']) ) ? $_POST['group_id'] : 1;
        $pitch_id = ( isset($_POST['pitch_id']) ) ? $_POST['pitch_id'] : 1;
        $reservation = $this->api_model->getReservationByTime($reservation_year,$reservation_month,$reservation_day,$reservation_time,$group_id,$pitch_id);
        echo json_encode($reservation);
    }

    public function getReservationByDay(){
        $reservation_year = ( isset($_POST['year']) ) ? $_POST['year'] : date("Y", time());
        $reservation_month = ( isset($_POST['month']) ) ? $_POST['month'] : date("m", time());
        $reservation_day = ( isset($_POST['day']) ) ? $_POST['day'] : date("d", time());
        $group_id = ( isset($_POST['group_id']) ) ? $_POST['group_id'] : 1;
        $pitch_id = ( isset($_POST['pitch_id']) ) ? $_POST['pitch_id'] : 1;
        $reservation = $this->api_model->getReservationByDay($reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id);
        echo json_encode($reservation);
    }

    public function getPitchByGroup(){
        $group = ( isset($_POST['group']) ) ? $_POST['group'] : '1';
        $pitchs = $this->api_model->getPitchByGroup($group);
        echo json_encode($pitchs);
    }

    public function getGroup(){
        $group_name = ( isset($_POST['group_name']) ) ? $_POST['group_name'] : 'escazu';
        $id_group = $this->api_model->getGroup($group_name);
        echo json_encode($id_group);
    }

    public function getTemporaryReservationState(){
    
    }

    public function setTemporaryReservationState(){

    }
}