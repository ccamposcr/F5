<div id="divContent">
   <h1 id="loginTitle">Login</h1>
   <?php echo validation_errors(); ?>
   <?php echo form_open($this->uri->segment(1) . '/verifyLogin'); 
   echo form_label("Username: ");
   echo form_input("username");
   echo form_label("Password: ");
   echo form_password("password");
   echo form_submit("","Login");
   echo form_close();
   ?>
</div>