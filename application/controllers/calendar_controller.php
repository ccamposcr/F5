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
           'next_prev_url' => base_url() . 'calendar',
           'local_time' => time()
         );

        $prefs['template'] = '
        {table_open}<table>{/table_open}

        {heading_row_start}<tr>{/heading_row_start}

        {heading_previous_cell}<th><a class="prev" href="{previous_url}"><<</a></th>{/heading_previous_cell}

        {heading_title_cell}<th colspan="{colspan}">{heading}</th>{/heading_title_cell}

        {heading_next_cell}<th><a class="next" href="{next_url}">>></a></th>{/heading_next_cell}

        {heading_row_end}</tr>{/heading_row_end}

        {week_row_start}<tr>{/week_row_start}
        {week_day_cell}<td class="head">{week_day}</td>{/week_day_cell}
        {week_row_end}</tr>{/week_row_end}


        {cal_row_start}<tr class="days_row">{/cal_row_start}
        {cal_cell_start}<td class="day">{/cal_cell_start}

        {cal_cell_content}
        <div>{day}</div>
        {/cal_cell_content}

        {cal_cell_content_today}
        <div class="today"><srong>{day}</strong></div>
        {/cal_cell_content_today}

        {cal_cell_no_content}
        <div>{day}</div>
        {/cal_cell_no_content}

        {cal_cell_no_content_today}
        <div class="today"><strong>{day}</strong></div>
        {/cal_cell_no_content_today}

        {cal_cell_blank}&nbsp;{/cal_cell_blank}
        {cal_cell_end}</td>{/cal_cell_end}
        {cal_row_end}</tr>{/cal_row_end}

        {table_close}</table>{/table_close}';
        $this->load->library('calendar', $prefs);
    }


    public function calendar($year = null, $month = null){
        $data['calendar'] = $this->calendar->generate($year, $month);
        $this->load->view('calendar_view', $data);
        //$this->getReservation();
    }

    public function getReservation(){
        $this->load->model("calendar_model");
        $reservation_year = ( isset($_POST['year']) ) ? $_POST['year'] : '2014';
        $reservation_month = ( isset($_POST['month']) ) ? $_POST['month'] : '9';
        $reservation_day = ( isset($_POST['day']) ) ? $_POST['day'] : '5';
        $reservation_time = ( isset($_POST['time']) ) ? $_POST['time'] : '09-10';
        $reservation = $this->calendar_model->getReservation($reservation_year,$reservation_month,$reservation_day,$reservation_time);
        echo json_encode($reservation);
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */