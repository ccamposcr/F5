<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Api_model extends CI_MODEL
{
    function getReservationByTime($reservation_year,$reservation_month,$reservation_day,$reservation_time,$group_id,$pitch_id){
        $query = $this->db->query("SELECT * FROM t_reservations WHERE reservation_year = '$reservation_year' AND reservation_month = '$reservation_month' AND reservation_day='$reservation_day' AND reservation_time='$reservation_time' AND group_id='$group_id' AND pitch_id='$pitch_id' AND active ='1'");
        return $query->result_array();
    }

    function getReservationByDay($reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id){
    	$query = $this->db->query("SELECT * FROM t_reservations WHERE reservation_year = '$reservation_year' AND reservation_month = '$reservation_month' AND reservation_day='$reservation_day' AND group_id='$group_id' AND pitch_id='$pitch_id' AND active ='1' ORDER BY reservation_time ASC");
        return $query->result_array();
    }

    function getPitchByGroup($group){
    	$query = $this->db->query("SELECT * FROM t_pitchs WHERE id_group = '$group' AND active ='1'");
        return $query->result_array();
    }

    function getGroup($group_name){
        $query = $this->db->query("SELECT id FROM t_groups WHERE group_name = '$group_name'");
        return $query->result();
    }

    function getTemporaryReservationState($team_id,$reservation_time,$reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id){
        $query = $this->db->query("SELECT `state` FROM `t_temporary_schedule` WHERE team_id='$team_id' AND reservation_time='$reservation_time' AND reservation_year='$reservation_year' AND reservation_month='$reservation_month' AND reservation_day='$reservation_day' AND group_id='$group_id' AND pitch_id='$pitch_id'");
        return $query->result();

    }

    function setTemporaryReservationState(){

    }
}
//end model