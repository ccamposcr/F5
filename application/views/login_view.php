<!DOCTYPE html>
<html>
 <head>
   <title>Simple Login with CodeIgniter</title>
 </head>
 <body>
   <h1>Simple Login with CodeIgniter</h1>
   <?php echo validation_errors(); ?>
   <?php echo form_open('c_verifylogin'); 
   echo form_label("Username: ");
   echo form_input("username");
   echo br();
   echo form_label("Password: ");
   echo form_password("password");
   echo br();
   echo form_submit("","Login");
   echo form_close();
   ?>
 </body>
</html>