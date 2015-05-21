<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Email_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->library('email');
        $config['protocol'] = 'smtp';
        
        $config['wordwrap'] = TRUE;
        $config['smtp_host'] = 'ssl://smtpout.secureserver.net';
        $config['smtp_user'] = 'reserva@f5.cr';
        $config['smtp_pass'] = 'Reserva2014';
        $config['smtp_port'] = '465';
        $config['mailtype'] = 'html';
        $config['charset'] = 'utf-8';
        $config['newline'] = "\r\n";
        
        $this->email->initialize($config);
        /*$config['protocol'] = 'sendmail';
        $config['mailpath'] = '/usr/sbin/sendmail';
        $config['charset'] = 'iso-8859-1';
        $config['wordwrap'] = TRUE;

        $this->email->initialize($config);*/
    }

    public function sendEmail(){
    	$email = ( isset($_POST['email']) ) ? strip_tags($_POST['email']) : '';
    	$data_reservation = ( isset($_POST['data_reservation']) ) ? strip_tags($_POST['data_reservation']) : '';
        $this->email->from('reserva@f5.cr', 'Reservaciones F5');
		$this->email->to($email); 
		$this->email->cc('reserva@f5.cr'); 
		$this->email->subject('Su reservación se ha efectuado correctamente');
		$this->email->message($data_reservation);	
		$this->email->send();
        echo $this->email->print_debugger();
    }
}