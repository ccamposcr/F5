<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Login_controller extends CI_Controller {
	 function __construct() {
        parent::__construct();
        $this->load->model('login_model','',true);
    }

    function index() {
        $headerOptions['menu'] = array (
            array('text' => 'Inicio', 'url' => ''),
            array('text' => 'Reservaciones', 'url' => $this->uri->segment(1) . '/reservaciones'),
            array('text' => 'Galeria', 'url' => $this->uri->segment(1) . '/galeria')
        );
        $this->load->view('includes/header', $headerOptions);
        $this->load->view('login_view'); //load view for login
        $this->load->view('includes/internal_footer');
    }

    function verify() {
        $this->form_validation->set_rules('username', 'Username', 'trim|required|xss_clean');
        $this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean|callback_checkUser');
 
        if( !$this->form_validation->run() ) {
            $headerOptions['menu'] = array (
                array('text' => 'Inicio', 'url' => ''),
                array('text' => 'Reservaciones', 'url' => $this->uri->segment(1) . '/reservaciones'),
                array('text' => 'Galeria', 'url' => $this->uri->segment(1) . '/galeria')
            );
            $this->load->view('includes/header', $headerOptions);
            $this->load->view('login_view');
            $this->load->view('includes/internal_footer');
        }
        else{
            redirect($this->uri->segment(1) . '/admin', 'refresh');
        }       
     }

     function checkUser($password) {
        $user = $this->input->post('username');
        $userInfo = $this->login_model->login($user, $password);
        $result = false;
        if( $userInfo ) {
            $sess_array = array('id' => $userInfo[0]->id, 'user' => $userInfo[0]->user);
	        $this->session->set_userdata('logged_in', $sess_array);
         	$result = true;
        }
        else {
          	$this->form_validation->set_message('checkUser', 'Invalid username or password');
          	$result = false;
        }

        return $result;
      }
}
/* End of file login_view.php */
/* Location: ./application/controllers/login_view.php */