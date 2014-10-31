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
        //$pitch_id = 
        //echo $pitchs['escazu_1'];
        $reservation = $this->api_model->getReservationByTime($reservation_year,$reservation_month,$reservation_day,$reservation_time);
        echo json_encode($reservation);
    }

    public function getReservationByDay(){
        $reservation_year = ( isset($_POST['year']) ) ? $_POST['year'] : date("Y", time());
        $reservation_month = ( isset($_POST['month']) ) ? $_POST['month'] : date("m", time());
        $reservation_day = ( isset($_POST['day']) ) ? $_POST['day'] : date("d", time());
        //echo $GLOBALS['pitchs']['escazu_1'];
        $reservation = $this->api_model->getReservationByDay($reservation_year,$reservation_month,$reservation_day);
        echo json_encode($reservation);
    }

    public function getPitchByGroup(){
        $group = ( isset($_POST['group']) ) ? $_POST['group'] : '1';
        $pitchs = $this->api_model->getReservationByDay($reservation_year,$reservation_month,$reservation_day);
        echo json_encode($pitchs);
    }
}