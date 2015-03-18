<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Email_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->library('email');
        /*$config['protocol'] = 'smtp';
        $config['smtp_host'] = 'ssl://smtp.gmail.com';
        $config['smtp_user'] = 'proyectohood@gmail.com';
        $config['smtp_pass'] = 'proyectohood1234';
        $config['smtp_port'] = 465 ;
        $config['mailtype'] = "html";
        $config['charset'] = 'iso-8859-1';
        
        $this->email->initialize($config);*/
    }

    public function sendEmail(){
    	$email = ( isset($_POST['email']) ) ? strip_tags($_POST['email']) : '';
    	$data_reservation = ( isset($_POST['data_reservation']) ) ? strip_tags($_POST['data_reservation']) : '';
        $this->email->from('reserva@f5.cr');
		$this->email->to($email); 
		$this->email->cc('reserva@f5.cr'); 
		$this->email->subject('Su Reservacion se ha efectuado correctamente');
		$this->email->message($data_reservation);	
		$this->email->send();
        echo $this->email->print_debugger();
    }
}