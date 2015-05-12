<div id="userStatus">
    <?php 
    if( isset($session_data) ){
    ?>
        <input type="hidden" value="<?=$session_data['user']?>" id="user"/>
        <input type="hidden" value="<?=$session_data['id']?>" id="id_user"/>
        <input type="hidden" value="<?=$session_data['rol']?>" id="rol_user"/>
        <input type="hidden" value="<?=$session_data['groupUser']?>" id="group_user"/>
        <span>Bienvenido <?php echo $session_data['user'];?></span> | <a href="#" data-toggle="modal" data-target="#change-password-modal">Cambiar Contrase&ntilde;a</a> | <a href="<?php echo base_url(); ?>logout">Cerrar Sesi&oacute;n</a>
    <?php
    }
    else/*( isset($adminBtn) )*/{
    ?>
        <a href="<?php echo base_url() . $this->uri->segment(1)?>/login">Administrar</a>
    <?php
    }
    ?>
</div>