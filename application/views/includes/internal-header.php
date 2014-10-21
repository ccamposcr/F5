<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>F5</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="<?php echo base_url(); ?>css/fonts.css"/>
        <link rel="stylesheet" href="<?php echo base_url(); ?>css/bootstrap.css"/>
        <link rel="stylesheet" href="<?php echo base_url(); ?>css/normalize.css">
        <!--<link rel="stylesheet" href="<?php echo base_url(); ?>css/style.css"/>-->
        <link rel="stylesheet/less" type="text/css" href="<?php echo base_url(); ?>css/style.less" />
        
        <script src="<?php echo base_url(); ?>js/vendor/modernizr-2.6.2.min.js"></script>
    </head>

    <body ng-app="F5App">
        
        <div id="mainWrapper" class="clearfix">

            <div id="divWrapperHeader" class="clearfix">
                <div id="divContentHeader" class="clearfix">
                    <a href="<?php echo base_url(); ?>"><img id="mainLogo" src="<?php echo base_url(); ?>img/logo.png" alt="F5" height="93" width="242"></a>
                    <ul id="navPrincipal" class="clearfix">
                        <li><a href="<?php echo base_url(); ?>">Inicio</a></li>
                        <li><a href="<?php echo base_url(); ?>escazu/">F5 Escaz&uacute;</a></li>
                        <li><a href="<?php echo base_url(); ?>desamparados/">F5 Desamparados</a></li>
                    </ul>
                    <div id="userStatus">
                        <?php 
                        if( isset($user) ){
                        ?>
                            <span>Bienvenido <?php echo $user;?></span> <a href="<?php echo base_url(); ?>logout">Cerrar Sesi&oacute;n</a>
                        <?php
                        }
                        else{
                        ?>
                            <a href="login">Administrar</a>
                        <?php
                        }
                        ?>
                    </div>
                </div>
            </div>