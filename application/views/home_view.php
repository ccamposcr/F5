    <div id="divContent" class="home">
        <?php 
        if( isset($session_data) ){
        ?>
            <input type="hidden" value="<?=$session_data['user']?>" id="user"/>
            <input type="hidden" value="<?=$session_data['id']?>" id="id_user"/>
            <input type="hidden" value="<?=$session_data['rol']?>" id="rol_user"/>
            <input type="hidden" value="<?=$session_data['groupUser']?>" id="group_user"/>
        <?php 
        }
        ?>
        <h1>Canchas de f&uacute;tbol 5</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil conseq tuuntur, nesciunt dicta, esse rem ducimus itaque quis. Adipisci ullam nam qui illum debitis sit ad in lectus. 
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil consequuntur, nesciunt dicta.
        </p>
        <h2><span>¿</span>D&oacute;nde quiere jugar<span>?</span></h2>
        <div id="divContentButtons" class="clearfix">
            <div id="goEscazuSiteBtn">
                <a href="<?php echo base_url(); ?>escazu/1/reservaciones"><img src="<?php echo base_url(); ?>img/f5-escazu-button.png" alt="F5" height="77" width="159"></a>
            </div>
             <div id="goDesamparadosSiteBtn">
                <a href="<?php echo base_url(); ?>desamparados/1/reservaciones"><img src="<?php echo base_url(); ?>img/f5-desamparados-button.png" alt="F5" height="77" width="159"></a>
            </div>

        </div>
    </div>
