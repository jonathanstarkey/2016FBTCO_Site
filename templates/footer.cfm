     

<!-- FOOTER -->
<div id="footer" class="footer">
  <div class="container">
    <div class="border row">
        <div class="footer-div col-sm-3 col-xs-6">
          <h3 class="footer-list-label">Navigation:</h3>
          <ul class="footer-list-item list-group list-unstyled">
              <li class=""><a href="/index.cfm">Home</a></li>
              <li class="dropdown"><a href="##" class="dropdown-toggle" data-toggle="dropdown">Product Catalog <span class="caret"></span></a>
              <ul class="dropdown-menu dropdown-menu-right">
                <ul class="footer-list-item list-group list-unstyled">
                    <li><a href="/product_catalog/toys.cfm">Toys</a></li>
                    <li><a href="/product_catalog/games.cfm">Games</a></li>
                    <li><a href="/product_catalog/brain_teasers.cfm">Brain Teasers</a></li>
                    <li><a href="/product_catalog/education.cfm">Education</a></li>
                  </ul>  
                </ul>
            </li>
              <li class=""><a href="/purchase.cfm">Purchase</a></li>
              <li class="dropdown"><a href="##" class="dropdown-toggle" data-toggle="dropdown">Media<span class="caret"></span></a>
              <ul class="dropdown-menu dropdown-menu-right">
                <ul class="footer-list-item list-group list-unstyled">
                    <li><a href="/media/in_the_press.cfm">In the Press</a></li>
                    <li><a href="/media/awards.cfm">Awards</a></li>
                    <li><a href="/media/product_images.cfm">Product Images</a></li>
                  </ul>  
                </ul>
            </li>
              <li class=""><a href="/about_us.cfm">About Us </a></li>
              <li class=""><a href="/contact.cfm">Contact</a></li>
              <li class=""><a href="##" class="footer-rep-access" data-toggle="modal" data-target="#account-login">Account Login</a></li>
            </ul>
            
            <h3 class="footer-list-label">Have a Toy Design?</h3>
          <ul class="footer-list-item list-group list-unstyled">
              <li class=""><a href="/have_a_design.cfm">Tell us about your concept.</a></li>
            </ul>
        </div>
      <div class="footer-div col-sm-3 col-xs-6">
          <h3 class="footer-list-label">Assets:</h3>
          <ul class="footer-list-item list-group list-unstyled">
              <li class=""><a href="/media/product_images.cfm">Product Images</a></li>
              <li class=""><a href="/contact.cfm">Request Our Latest Catalog</a></li>
              <li class=""><a href="/downloads/2016ToyCoCatalog.pdf">Download Our Latest Catalog</a></li>
            </ul>
            <h3 class="footer-list-label">Access:</h3>
          <ul class="footer-list-item list-group list-unstyled">
              <li class=""><a href="#rep-account-login" class="footer-rep-access" data-toggle="modal">Sales Rep Access</a></li>
              <li class=""><a href="#group-account-login" class="footer-rep-access" data-toggle="modal">Sales Group Access</a></li>
            </ul>
        </div>
      <div class="footer-div col-sm-3 col-xs-12">
          <h3 class="footer-list-label">Use Toll Free Number:</h3>
          <ul class="footer-list-item list-group list-unstyled">
              <li class="footer-list-item-li">1-800-335-5621</li>
            </ul>
          <h3 class="footer-list-label">International Phone:</h3>
          <ul class="footer-list-item list-group list-unstyled">
              <li class="footer-list-item-li">1-402-779-3181</li>
            </ul>
          <h3 class="footer-list-label">Fax:</h3>
          <ul class="footer-list-item list-group list-unstyled">
              <li class="footer-list-item-li">1-402-779-3253</li>
            </ul>
          <h3 class="footer-list-label">E-Mail:</h3>
          <ul class="footer-list-item list-group list-unstyled">
              <li class=""><a href="##">sales@fatbraintoyco.com</a></li>
          </ul>
        
    </div>
      <div class="footer-div col-sm-3 col-xs-12">
          <h3 class="footer-list-label">Fat Brain Toy Co.</h3>
          <p class="footer-list-item-p" >20516 Nicholas Circle<br>
          Elkhorn, NE  68022</p>
        </div>
        <div class="border col-sm-12 col-xs-12 text-center"><p class="text-muted">Copyright&copy; <cfoutput>#year(now())#</cfoutput> Fat Brain Toy Co. All rights reserved.</p></div>
    </div>
    
  </div>
</div>

 <ul class="nav pull-right scroll-top">
  <li><a href="#" title="Scroll to top"><i class="glyphicon glyphicon-chevron-up"></i></a></li>
</ul>   
<!-- MODALS -->
    
<!-- Modal - SALES REP - Account Login -->
<div id="rep-account-login" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="loginmodal-container">
					<h1>Fat Brain Toy Co. Rep Login</h1><br>
				  <form>
					<input type="text" name="user" placeholder="Username">
					<input type="password" name="pass" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit" value="Login">
				  </form>
					
				  <div class="login-help">
					 <a data-toggle="modal" data-dismiss="modal" href="#myModal-rep-forgotpassword">Forgot Password</a>
				  </div>
				</div>

  </div>
</div>
<!-- /Modal - SALES REP - Account Login -->
<!-- Modal - SALES REP - Forgot Password -->
<div id="myModal-rep-forgotpassword" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">
<!-- Modal content-->
    <div class="loginmodal-container">
        <h1>Forgot Password</h1><br>
          <form>
            <input type="text" name="user" placeholder="Username">
            <input type="submit" name="login" class="login loginmodal-submit" value="Next">
            <input type="email" name="pass" placeholder="Email">
            <input type="submit" name="login" class="login loginmodal-submit" value="Next">
          </form>

      </div>
    </div>
</div>
<!-- /Modal - SALES REP - Forgot Password --> 
<!-- Modal - SALES GROUP - Account Login -->
<div id="group-account-login" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="loginmodal-container">
					<h1>Fat Brain Toy Co. Rep Group Login</h1><br>
				  <form>
					<input type="text" name="user" placeholder="Username">
					<input type="password" name="pass" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit" value="Login">
				  </form>
					
				  <div class="login-help">
					 <a data-toggle="modal" data-dismiss="modal" href="#myModal-rep-forgotpassword">Forgot Password</a>
				  </div>
				</div>

  </div>
</div>
<!-- /Modal - SALES GROUP - Account Login -->
<!-- Modal - SALES GROUP - Forgot Password -->
<div id="myModal-group-forgotpassword" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">
<!-- Modal content-->
    <div class="loginmodal-container">
        <h1>Forgot Password</h1><br>
          <form>
            <input type="text" name="user" placeholder="Username">
            <input type="submit" name="login" class="login loginmodal-submit" value="Next">
            <input type="email" name="pass" placeholder="Email">
            <input type="submit" name="login" class="login loginmodal-submit" value="Next">
          </form>

      </div>
    </div>
</div>
<!-- /Modal - SALES GROUP - Forgot Password --> 

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-225972-7']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>


</body>

</html>