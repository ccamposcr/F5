<!DOCTYPE html>
<html>
 <head>
   <title>Login</title>
 </head>
 <body>
   <h1>Login</h1>
   <?php echo validation_errors(); ?>
   <?php echo form_open('login_controller/verify'); 
   echo form_label("Username: ");
   echo form_input("username");
   echo form_label("Password: ");
   echo form_password("password");
   echo form_submit("","Login");
   echo form_close();
   ?>
 </body>
</html>