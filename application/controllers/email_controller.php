<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Email_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->library('email');
        /*$config['protocol'] = 'smtp';
        $config['charset'] = 'utf-8';
        $config['wordwrap'] = FALSE;
        $config['mailtype'] = 'text';
        $config['smtp_host'] = 'smtpout.secureserver.net';
        $config['smtp_user'] = 'reserva@f5.cr';
        $config['smtp_pass'] = 'G0D@ddy1254';
        $config['smtp_port'] = '25';
        $config['smtp_timeout'] = '5';*/
        $this->email->initialize($config);
    }

    public function sendEmail(){
    	$email = ( isset($_POST['email']) ) ? strip_tags($_POST['email']) : '';
    	$data_reservation = ( isset($_POST['data_reservation']) ) ? strip_tags($_POST['data_reservation']) : '';
        $this->email->from('reserva@f5.cr', 'F5 Reservaciones');
		$this->email->to($email); 
		/*$this->email->cc($email); 
		$this->email->bcc($email);*/
		$this->email->subject('Su Reservación se ha efectuado correctamente');
		$this->email->message($data_reservation);	
		$this->email->send();
    }
}