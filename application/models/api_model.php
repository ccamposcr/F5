<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Api_model extends CI_MODEL
{
    function getReservationByTime($team_id,$reservation_year,$reservation_month,$reservation_day,$reservation_time,$group_id,$pitch_id){
        $query = $this->db->query("SELECT * FROM t_reservations WHERE team_id = ".$this->db->escape($team_id)." AND reservation_year = ".$this->db->escape($reservation_year)." AND reservation_month = ".$this->db->escape($reservation_month)." AND reservation_day = ".$this->db->escape($reservation_day)." AND reservation_time = ".$this->db->escape($reservation_time)." AND group_id = ".$this->db->escape($group_id)." AND pitch_id = ".$this->db->escape($pitch_id)." AND active ='1'");
        return $query->result();
    }

    function getReservationByDay($reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id){
    	$query = $this->db->query("SELECT * FROM t_reservations WHERE reservation_year = ".$this->db->escape($reservation_year)." AND reservation_month = ".$this->db->escape($reservation_month)." AND reservation_day = ".$this->db->escape($reservation_day)." AND group_id = ".$this->db->escape($group_id)." AND pitch_id = ".$this->db->escape($pitch_id)." AND active ='1' ORDER BY reservation_time ASC");
        return $query->result_array();
    }

    function getPitchByGroup($group){
    	$query = $this->db->query("SELECT * FROM t_pitchs WHERE id_group = ".$this->db->escape($group)." AND active ='1'");
        return $query->result_array();
    }

    function getGroup($group_name){
        $query = $this->db->query("SELECT id FROM t_groups WHERE group_name = ".$this->db->escape($group_name));
        return $query->result();
    }

    function getTemporaryReservationState($team_id,$reservation_time,$reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id){
        $query = $this->db->query("SELECT state FROM t_temporary_schedule WHERE team_id = ".$this->db->escape($team_id)." AND reservation_time = ".$this->db->escape($reservation_time)." AND reservation_year = ".$this->db->escape($reservation_year)." AND reservation_month = ".$this->db->escape($reservation_month)." AND reservation_day = ".$this->db->escape($reservation_day)." AND group_id = ".$this->db->escape($group_id)." AND pitch_id = ".$this->db->escape($pitch_id));
        return $query->result();
    }

    function setTemporaryReservationState($team_id,$reservation_time,$reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id,$state){
        $query = $this->db->query("SELECT state FROM t_temporary_schedule WHERE team_id = ".$this->db->escape($team_id)." AND reservation_time = ".$this->db->escape($reservation_time)." AND reservation_year = ".$this->db->escape($reservation_year)." AND reservation_month = ".$this->db->escape($reservation_month)." AND reservation_day = ".$this->db->escape($reservation_day)." AND group_id = ".$this->db->escape($group_id)." AND pitch_id = ".$this->db->escape($pitch_id));
        if ($query->num_rows() > 0){
            //Update
            $this->db->query("UPDATE t_temporary_schedule SET state = ".$this->db->escape($state).",temporary_date_made=CURRENT_TIMESTAMP WHERE team_id = ".$this->db->escape($team_id)." AND reservation_time = ".$this->db->escape($reservation_time)." AND reservation_year = ".$this->db->escape($reservation_year)." AND reservation_month = ".$this->db->escape($reservation_month)." AND reservation_day = ".$this->db->escape($reservation_day)." AND group_id = ".$this->db->escape($group_id)." AND pitch_id = ".$this->db->escape($pitch_id));
        }
        else{
            //Insert
            $this->db->query("INSERT INTO t_temporary_schedule(team_id, reservation_time, reservation_year, reservation_month, reservation_day, pitch_id, group_id, state) VALUES (".$this->db->escape($team_id).",".$this->db->escape($reservation_time).",".$this->db->escape($reservation_year).",".$this->db->escape($reservation_month).",".$this->db->escape($reservation_day).",".$this->db->escape($group_id).",".$this->db->escape($pitch_id).",".$this->db->escape($state).")");
        }
    }

    function checkIfReservationExist($team_id,$reservation_time,$reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id){
        $query = $this->db->query("SELECT id FROM t_reservations WHERE team_id = ".$this->db->escape($team_id)." AND reservation_time = ".$this->db->escape($reservation_time)." AND reservation_year = ".$this->db->escape($reservation_year)." AND reservation_month = ".$this->db->escape($reservation_month)." AND reservation_day = ".$this->db->escape($reservation_day)." AND group_id = ".$this->db->escape($group_id)." AND pitch_id = ".$this->db->escape($pitch_id)." AND active ='1'");
        return $query->result();
    }

    function createReservation($team_id,$reservation_time,$reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id,$name,$lastname,$phone,$email,$type_reservation,$referee_required,$reservation_price){
        $this->db->query("INSERT INTO t_reservations(name, lastname, phone, email, team_id, type_reservation, referee_required, reservation_time, reservation_year, reservation_month, reservation_day, reservation_price, pitch_id, group_id, active) 
            VALUES (".$this->db->escape($name).",".$this->db->escape($lastname).",".$this->db->escape($phone).",".$this->db->escape($email).",".$this->db->escape($team_id).",".$this->db->escape($type_reservation).",".$this->db->escape($referee_required).",".$this->db->escape($reservation_time).",".$this->db->escape($reservation_year).",".$this->db->escape($reservation_month).",".$this->db->escape($reservation_day).",".$this->db->escape($reservation_price).",".$this->db->escape($pitch_id).",".$this->db->escape($group_id).",'1')");
    }

    function setInactiveReservation($team_id,$reservation_time,$reservation_year,$reservation_month,$reservation_day,$group_id,$pitch_id){
        $this->db->query("UPDATE t_reservations SET active = '0' WHERE team_id = ".$this->db->escape($team_id)." AND reservation_time = ".$this->db->escape($reservation_time)." AND reservation_year = ".$this->db->escape($reservation_year)." AND reservation_month = ".$this->db->escape($reservation_month)." AND reservation_day = ".$this->db->escape($reservation_day)." AND group_id = ".$this->db->escape($group_id)." AND pitch_id = ".$this->db->escape($pitch_id));
    }

    function getClientsData(){
        $query = $this->db->query("SELECT name,lastname,phone,email FROM t_reservations GROUP BY phone,email");
        return $query->result();
    }
}
//end model

