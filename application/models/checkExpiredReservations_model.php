<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
  
class CheckExpiredReservations_model extends CI_MODEL {
 
    function checkExpiredReservations(){
        $this->db->query("INSERT INTO `t_temporary_schedule`(`team_id`, `reservation_time`, `reservation_year`, `reservation_month`, `reservation_day`, `pitch_id`, `group_id`, `state`) VALUES ('1','09-10','2014','04','01','1','2','1')");
    }
}
