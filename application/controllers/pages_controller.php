<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Pages_controller extends CI_Controller {
    function __construct() {
        parent::__construct();
    }
 
    function index() {
        $headerOptions = simplexml_load_file("xml/header.xml");
        $this->load->view('includes/header',$headerOptions->external);
        $this->load->view('home_view');
        $this->load->view('includes/footer');
    }

    function escazu_gallery(){
        $headerOptions = simplexml_load_file("xml/header.xml");
        $this->load->view('includes/header',$headerOptions->internal);
    	$this->load->view('escazu_gallery_view');

        $footerOptions = simplexml_load_file("xml/footer.xml");
        $this->load->view('includes/internal_footer', $footerOptions->escazu);
    }

    function desamparados_gallery(){
        $headerOptions = simplexml_load_file("xml/header.xml");
        $this->load->view('includes/header', $headerOptions->internal);
    	$this->load->view('desamparados_gallery_view');

        $footerOptions = simplexml_load_file("xml/footer.xml");
        $this->load->view('includes/internal_footer', $footerOptions->desamparados);
    }

    function page_404(){
    	$this->load->view('404_view');
    }
}
/* End of file home_controller.php */
/* Location: ./application/controllers/home_controller.php */