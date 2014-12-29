<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Email_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->library('email');
    }

    public function sendEmail(){
    	$email = ( isset($_POST['email']) ) ? strip_tags($_POST['email']) : '';
    	$data_reservation = ( isset($_POST['data_reservation']) ) ? strip_tags($_POST['data_reservation']) : '';
        $this->email->from('reservaciones@f5.cr', 'F5 Reservations');
		$this->email->to($email); 
		$this->email->cc($email); 
		$this->email->bcc($email); 
		$this->email->subject('Su Reservación');
		$this->email->message($data_reservation);	
		$this->email->send();
    }
}