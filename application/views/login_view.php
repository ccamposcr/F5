<?php include('includes/header.php') ?>
   <h1>Login</h1>
   <?php echo validation_errors(); ?>
   <?php echo form_open(explode('/', current_url())[2] . '/verifyLogin'); 
   echo form_label("Username: ");
   echo form_input("username");
   echo form_label("Password: ");
   echo form_password("password");
   echo form_submit("","Login");
   echo form_close();
   ?>
<?php include('includes/footer.php') ?>