		<div id="divWrapperFooter" class="clearfix">
		    <div id="divContentFooter" class="clearfix">

		    	<div id="divContentInfoFooter">
		    		<span>F5 <?php echo $this->uri->segment(1)?></span>
		    		<p><?php echo $detail ?></p>
		    	</div>
		    	
		    	<div id="contentSocialIcons" class="clearfix">
		    		<span>S&iacute;guenos en:</span>
		    		<div id="socialIcons">
			            <a href="#" class="fa fa-facebook"></a>
			            <a href="#" class="fa fa-twitter"></a>
			            <a href="#" class="fa fa-youtube"></a>  
			        </div>	     
		    	</div>	       

		    	<div id="infoContact" class="clearfix">
		    		<span>Cont&aacute;ctenos:</span> 	 
			    	<ul>
			    		<li><span class="fa fa-map-marker"></span><a href="<?php echo $mapUrl ?>">Localizaci&oacute;n</a></li>
			            <li><span class="fa fa-phone-square"></span><a href="tel:<?php echo $phone ?>"><?php echo $phone ?></a></li>
			            <li><span class="fa fa-envelope"></span><a href="mailto:<?php echo $email ?>"><?php echo $email ?></a></li>
			            <li><span class="fa fa-skype"></span><a href="skype:<?php echo $skype ?>?call"><?php echo $skype ?></a></li>
			    	</ul>
		            
			    </div>

		        <p id="copy-right">© 2015Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
		        <span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=cMzcYREMtupIS3ZxQa3zaq8M3sZ6FgK8xmOFZDbVVjvuzPXaBzvWXXHmV5Kx"></script></span>
		    </div>
		</div>
	</div>

	<script src="<?php echo base_url(); ?>js/vendor/jquery-1.10.2.min.js"></script>
	<script src="<?php echo base_url(); ?>js/vendor/bootstrap.min.js"></script>
    <script src="<?php echo base_url(); ?>js/vendor/bootstrap-confirmation.min.js"></script>
    <script src="<?php echo base_url(); ?>js/vendor/jquery.flexslider-min.js"></script>


	<script src="<?php echo base_url(); ?>js/vendor/angular.min.js"></script>
    <script src="<?php echo base_url(); ?>js/app/shared/app.js"></script>
    <script src="<?php echo base_url(); ?>js/app/shared/header/headerController.js"></script>
    <script src="<?php echo base_url(); ?>js/app/shared/modals/modalsController.js"></script>

    <script src="<?php echo base_url(); ?>js/app/components/gallery/galleryController.js"></script>
    <script src="<?php echo base_url(); ?>js/app/components/reservations/reservationsController.js"></script>
	<script src="<?php echo base_url(); ?>js/app/components/reservations/reservationsDirectives.js"></script>
    
    </body>
</html>
