<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Check_expired_reservations_controller extends CI_Controller {
	 function __construct() {
        parent::__construct();
        $this->load->model('check_expired_reservations_model');
    }

    function checkExpiredReservations() {
       $this->check_expired_reservations_model->checkExpiredReservations(); 
    }

    function deleteAllTmpReservationsEndDay(){
    	$this->check_expired_reservations_model->deleteAllTmpReservationsEndDay(); 
    }
}