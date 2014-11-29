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
        <link rel="stylesheet" href="<?php echo base_url(); ?>css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<?php echo base_url(); ?>css/normalize.css">
        <!--<link rel="stylesheet" href="<?php echo base_url(); ?>css/style.css"/>-->
        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>css/flexslider.css" />
        <link rel="stylesheet/less" type="text/css" href="<?php echo base_url(); ?>css/style.less" />
        
        <script src="<?php echo base_url(); ?>js/vendor/modernizr-2.6.2.min.js"></script>
    </head>

    <body ng-app="F5App">
        
        <div id="mainWrapper" class="clearfix">

            <div id="divWrapperHeader" class="clearfix" ng-controller="headerController">
                <div id="divContentHeader" class="clearfix">
                    <a id="logo" class="clearfix" href="<?php echo base_url(); ?>">
                        <img id="mainLogo" src="<?php echo base_url(); ?>img/logo.png" alt="F5" height="62" width="170">
                        <span><?php echo $this->uri->segment(1)?></span>
                    </a>
                    <ul id="navPrincipal" class="clearfix" ng-init="setActive()">
                        <?php foreach ($button as $index => $row) {
                            if( $index == 0){
                                echo '<li class="' . $row->type . '"><a href="' . base_url() . $row->url .'">'. $row->text .'</a></li>';
                            }
                            else{
                                echo '<li class="' . $row->type . '"><a href="' . base_url() . $this->uri->segment(1) . $row->url .'">'. $row->text .'</a></li>';
                            }
                        }?>
                    </ul>
                </div>
            </div>