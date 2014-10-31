<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Api_model extends CI_MODEL
{
    function getReservationByTime($reservation_year,$reservation_month,$reservation_day,$reservation_time){
        $query = $this->db->query("SELECT * FROM t_reservations WHERE reservation_year = '$reservation_year' AND reservation_month = '$reservation_month' AND reservation_day='$reservation_day' AND reservation_time='$reservation_time'");
        return $query->result_array();
    }

    function getReservationByDay($reservation_year,$reservation_month,$reservation_day){
    	$query = $this->db->query("SELECT * FROM t_reservations WHERE reservation_year = '$reservation_year' AND reservation_month = '$reservation_month' AND reservation_day='$reservation_day' ORDER BY reservation_time ASC");
        return $query->result_array();
    }

    function getPitchByGroup($group){
    	$query = $this->db->query("SELECT * FROM t_pitchs WHERE id_group = '$group' AND active ='1'");
        return $query->result_array();
    }
}
//end model