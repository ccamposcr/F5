<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Admin_controller extends CI_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model('login_model','',true);
    }
 
    function index() {
        if($this->session->userdata('logged_in'))
        {
            $session_data = $this->session->userdata('logged_in');
            $data['user'] = $session_data['user'];
            $data['id'] = $session_data['id'];
            redirect(base_url('admin/reservaciones'), 'refresh');
        } else {
            redirect('login_controller', 'refresh');
        }
    }
 
    function logout() {
        $this->session->unset_userdata('logged_in');
        $this->session->sess_destroy();
        redirect(base_url('reservaciones'), 'refresh');
     }
 
}
/* End of file c_home.php */
/* Location: ./application/controllers/c_home.php */