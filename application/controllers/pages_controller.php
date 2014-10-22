<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Pages_controller extends CI_Controller {
    function __construct() {
        parent::__construct();
    }
 
    function index() {
        $headerOptions['menu'] = array (
            array('text' => 'Inicio', 'url' => ''),
            array('text' => 'F5 Escaz&uacute', 'url' => 'escazu/reservaciones'),
            array('text' => 'F5 Desamparados', 'url' => 'desamparados/reservaciones')
        );
        $this->load->view('includes/header',$headerOptions);
        $this->load->view('home_view');
        $this->load->view('includes/footer');
    }

    function escazu_gallery(){
        $headerOptions['menu'] = array (
            array('text' => 'Inicio', 'url' => ''),
            array('text' => 'Reservaciones', 'url' => 'escazu/reservaciones'),
            array('text' => 'Galeria', 'url' => 'escazu/galeria')
        );
        $this->load->view('includes/header',$headerOptions);
    	$this->load->view('escazu_gallery_view');
        $this->load->view('includes/internal_footer');
    }

    function desamparados_gallery(){
        $headerOptions['menu'] = array (
            array('text' => 'Inicio', 'url' => ''),
            array('text' => 'Reservaciones', 'url' => 'desamparados/reservaciones'),
            array('text' => 'Galeria', 'url' => 'desamparados/galeria')
        );
        $this->load->view('includes/header', $headerOptions);
    	$this->load->view('desamparados_gallery_view');
        $this->load->view('includes/internal_footer');
    }

    function page_404(){
        $headerOptions['menu'] = array (
            array('text' => 'Inicio', 'url' => ''),
            array('text' => 'F5 Escaz&uacute', 'url' => 'escazu/reservaciones'),
            array('text' => 'F5 Desamparados', 'url' => 'desamparados/reservaciones')
        );
        $this->load->view('includes/header',$headerOptions);
    	$this->load->view('404_view');
        $this->load->view('includes/footer');
    }
}
/* End of file home_controller.php */
/* Location: ./application/controllers/home_controller.php */