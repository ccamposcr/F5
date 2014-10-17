<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Home_controller extends CI_Controller {
    function __construct() {
        parent::__construct();
    }
 
    function index() {
        $this->load->view('home_view');
    } 
}
/* End of file home_controller.php */
/* Location: ./application/controllers/home_controller.php */