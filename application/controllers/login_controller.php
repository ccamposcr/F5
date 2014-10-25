<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Login_controller extends CI_Controller {
	 function __construct() {
        parent::__construct();
        $this->load->model('login_model','',true);
    }

    function index() {
        $headerOptions = simplexml_load_file("xml/header.xml");
        $this->load->view('includes/header', $headerOptions->internal);
        $this->load->view('login_view'); //load view for login
        
        $footerOptions = simplexml_load_file("xml/footer.xml");

        switch ( $this->uri->segment(1) ) {
            case 'escazu':
                $footerOptions = $footerOptions->escazu;
                break;
            
           case 'desamparados':
                $footerOptions = $footerOptions->desamparados;
                break;
        }

        $this->load->view('includes/internal_footer', $footerOptions);
    }

    function verify() {
        $this->form_validation->set_rules('username', 'Username', 'trim|required|xss_clean');
        $this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean|callback_checkUser');
 
        if( !$this->form_validation->run() ) {
            $headerOptions = simplexml_load_file("xml/header.xml");
            $this->load->view('includes/header', $headerOptions->internal);
            $this->load->view('login_view');

            $footerOptions = simplexml_load_file("xml/footer.xml");

            switch ( $this->uri->segment(1) ) {
                case 'escazu':
                    $footerOptions = $footerOptions->escazu;
                    break;
                
               case 'desamparados':
                    $footerOptions = $footerOptions->desamparados;
                    break;
            }

            $this->load->view('includes/internal_footer', $footerOptions);
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