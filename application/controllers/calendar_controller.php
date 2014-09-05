<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Calendar_controller extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $prefs = array (
           'start_day'    => 'lunes',
           'month_type'   => 'long',
           'day_type'     => 'abr',
           'show_next_prev' => 'true',
           'next_prev_url' => base_url() . 'calendar'
         );
        $this->load->library('calendar', $prefs);
    }

    public function index()
    {
    }

    public function calendar($year = null, $month = null){
       $this->load->view('calendar_view');
       echo $this->calendar->generate($year, $month);
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */