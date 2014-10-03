<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
  
class Login_model extends CI_MODEL {
 
    function __construct() {
        parent::__construct();
    }
 
    function login($username, $password) {
        //create query to connect user login database
       /* $this->db->select('id, user, password');
        $this->db->from('');
        $this->db->where('', $username);
        $this->db->where('password', MD5($password));
        $this->db->limit(1);*/
         
         $query = $this->db->query("SELECT * FROM t_admin WHERE username = '$username' AND password = 'MD5($password)'");
        //return $query->result_array();


        //get query and processing
        //$query = $this->db->get();
        if($query->num_rows() == 1) { 
            return $query->result(); //if data is true
        } else {
            return false; //if data is wrong
        }
    }
}
  
/* End of file login_model.php */
/* Location: ./application/models/login_model.php */