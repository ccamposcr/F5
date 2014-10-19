<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Pages_controller extends CI_Controller {
    function __construct() {
        parent::__construct();
    }
 
    function index() {
        $this->load->view('home_view');
    }

    function f5_escazu(){
    	$this->load->view('f5_escazu_view');
    }

    function f5_desamparados(){
    	$this->load->view('f5_desamparados_view');
    }

    function page_404(){
    	$this->load->view('404_view');
    }
}
/* End of file home_controller.php */
/* Location: ./application/controllers/home_controller.php */