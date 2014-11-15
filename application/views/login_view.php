<div id="contentLogin" id="divContent">
   <h1 id="loginTitle">Login</h1>
   <?php echo validation_errors(); ?>
   <?php echo form_open($this->uri->segment(1) . '/verifyLogin'); 
   $label_attributes = array('class' => 'address_info');
   echo form_label("Username: ",'',$label_attributes);
   echo form_input("username");
   echo form_label("Password: ");
   echo form_password("password");
   echo form_submit("","Login");
   echo form_close();
   ?>
</div>