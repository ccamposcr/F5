<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
  
class Login_model extends CI_MODEL {
 
    function __construct() {
        parent::__construct();
    }
 
    function login($user, $password) {
        //create query to connect user login database
        $password =  MD5($password);
        $query = $this->db->query("SELECT * FROM t_admin WHERE user = '$user' AND password = '$password'");
        $result = false;

        if($query->num_rows() == 1) { 
            $result =  $query->result(); //if data is true
        }

        return $result;
    }
}
  
/* End of file login_model.php */
/* Location: ./application/models/login_model.php */