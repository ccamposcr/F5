<div id="userStatus">
    <?php 
    if( isset($user) ){
    ?>
        <span>Bienvenido <?php echo $user;?></span> | <a href="#" data-toggle="modal" data-target="#change-password-modal">Cambiar Contrase&ntilde;a</a> | <a href="<?php echo base_url(); ?>logout">Cerrar Sesi&oacute;n</a>
    <?php
    }
    else/*( isset($adminBtn) )*/{
    ?>
        <a href="<?php echo base_url() . $this->uri->segment(1)?>/login">Administrar</a>
    <?php
    }
    ?>
</div>