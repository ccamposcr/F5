		<div id="divWrapperFooter" class="clearfix">
		    <div id="divContentFooter" class="clearfix">

		    	<div id="divContentInfoFooter">
		    		<span>F5 <?php echo $this->uri->segment(1)?></span>
		    		<p><?php echo $detail ?></p>
		    	</div>
		    	
		    	<div id="contentSocialIcons" class="clearfix">
		    		<span>S&iacute;guenos en:</span>
		    		<div id="socialIcons">
			            <a href="" class="fa fa-facebook"></a>
			            <a href="" class="fa fa-twitter"></a>
			            <a href="" class="fa fa-youtube"></a>  
			        </div>	     
		    	</div>	       

		    	<div id="infoContact" class="clearfix">
		    		<span>Cont&aacute;ctenos:</span> 	 
			    	<ul>
			    		<li><span class=" iconsContact fa fa-map-marker"></span><a href="<?php echo $mapUrl ?>">Localizaci&oacute;n</a></li>
			            <li><span class=" iconsContact fa fa-phone-square"></span><a href="tel:<?php echo $phone ?>"><?php echo $phone ?></a></li>
			            <li><span class=" iconsContact fa fa-envelope"></span><a href="mailto:<?php echo $email ?>"><?php echo $email ?></a></li>
			            <li><span class=" iconsContact fa fa-skype"></span><a href="skype:<?php echo $skype ?>?call"><?php echo $skype ?></a></li>
			    	</ul>
		            
			    </div>

		        <p id="copy-right">© 2014Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil consequuntur, esse rem ducimus itaque quis.</p>
		    </div>
		</div>
	</div>
	<script>
	  less = {
	    env: "development",
	    async: false,
	    fileAsync: false,
	    poll: 1000,
	    functions: {},
	    dumpLineNumbers: "comments",
	    relativeUrls: false,
	    rootpath: ":/a.com/"
	  };
	</script>
	<script src="<?php echo base_url(); ?>js/vendor/less.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>js/vendor/jquery-1.10.2.min.js"></script>
    <script src="<?php echo base_url(); ?>js/vendor/angular.min.js"></script>
    <script src="<?php echo base_url(); ?>js/vendor/jquery.flexslider-min.js"></script>
    <script src="<?php echo base_url(); ?>js/main.js"></script>
    </body>
</html>
