<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Calendar_model extends CI_MODEL
{
    function getReservationByTime($reservation_year,$reservation_month,$reservation_day,$reservation_time){
        $query = $this->db->query("SELECT * FROM phpmyreservation_reservations WHERE reservation_year = '$reservation_year' AND reservation_week = '$reservation_month' AND reservation_day='$reservation_day' AND reservation_time='$reservation_time'");
        return $query->result_array();
    } 
}
//end model