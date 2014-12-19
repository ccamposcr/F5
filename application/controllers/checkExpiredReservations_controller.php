<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class CheckExpiredReservations_controller extends CI_Controller {
	 function __construct() {
        parent::__construct();
        $this->load->model('checkExpiredReservations_model');
    }

    function checkExpiredReservations() {
       $this->checkExpiredReservations_model->checkExpiredReservations(); 
    }
}