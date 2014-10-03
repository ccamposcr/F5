<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Login_controller extends CI_Controller {
    function index() {
        //$this->load->helper(array('form','html'));
        $this->load->view('login_view'); //load view for login
    }
}
/* End of file login_view.php */
/* Location: ./application/controllers/login_view.php */