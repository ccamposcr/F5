<div id="divContent">
   <div id="contentLogin">
      <h1 id="loginTitle">Login</h1>
      <?php echo validation_errors(); ?>
      <?php echo form_open($this->uri->segment(1) . '/verifyLogin'); 
      echo form_label("Username: ");
      echo form_input("username",'','class="form-control"');
      echo form_label("Password: ");
      echo form_password("password",'','class="form-control"');
      echo form_submit("","Login",'class="btn btn-danger" id="btnLogin"');
      echo form_close();
      ?>
   </div>
</div>

