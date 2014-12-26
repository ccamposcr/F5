<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
  
class Check_expired_reservations_model extends CI_MODEL {
 
    function checkExpiredReservations(){
        $this->db->query("UPDATE t_temporary_schedule SET state='3' WHERE temporary_date_made < DATE_SUB(NOW(),INTERVAL 10 MINUTE) AND state!='3' AND state!='4' AND state!='5'");
    }
}
