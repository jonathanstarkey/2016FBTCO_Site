



<!DOCTYPE html>
<html lang="en">
<body>
<!-- Wrap all page content here -->
<div id="wrap">
     
<cfinclude template="/fatbraintoys/wholesale/templates/secondary_header.cfm">

<cfset captchaText = "#randrange(100,999)#"/>

<cfif IsDefined("form.myaction")>

	<cfinclude template="/fatbraintoys/templates/isemail.cfm">
	<cfif #isemailresult# IS "false">
	
		<br><br><br>
	    
	    <cfoutput>
		<div align="center">
		<font color="##395898" size="4">Sorry, but there was a problem with the email address you submitted: #isemailerrortext#
		<br><br>
		Please go back and try again.
		</div>
		</cfoutput>
		
		<br><br><br>
		
		<cfabort>
		
	<cfelseif NOT IsDefined('form.captcha_verify')>
	
		<br><br><br>
	    
	    <cfoutput>
		<div align="center">
		<font color="##395898" size="4">Sorry, but you did not supply a verification image.
		<br><br>
		Please go back and try again.
		</div>
		</cfoutput>
		
		<br><br><br>
		
		<cfabort>
		
	<cfelseif #form.captcha_verify# IS NOT #form.captcha#>
	
		<br><br><br>
	    
	    <cfoutput>
		<div align="center">
		<font color="##395898" size="4">Sorry, but the verification image and text you entered did not match.
		<br><br>
		Please go back and try again.
		</div>
		</cfoutput>
		
		<br><br><br>
		
		<cfabort>
		
	</cfif>
	
	<cfmail
		to="#ChooseTo('proddev@fatbraintoyco.com')#"
		subject="Toy Development Submission"
		from="#name# <#email#>"
		type="html">
<b>Name:</b> #name#<br>
<b>Email:</b> #email#<br>
<br>
<b>Description:</b><br>
<br>
#toy_description#
	</cfmail>
	
	<br><br><br>
	
	<div align="center">
	<b><i><font color="#395898" size="4">Thank you for contacting The Fat Brain Toy Co.!<br>
	We will be in touch with you shortly.</font></i></b>
	</div>
	
	<br><br><br>
	
<cfelse>     
<!-- SECONDARY HERO -->
    <section class="secondary-header-2" id="">
        <div class="container-fluid parallax-container">
            <div class="row">
                <div class="parallax-window" data-parallax="scroll" data-image-src="/img/have_a_design.jpg">
                    <div class="col-lg-8 col-lg-offset-2 text-right">          
                    <h2 class="secondary-header-title-2">Where do great toys come from?<br>
Great Ideas!!!</h2>
                </div>
                </div>
            </div>
        </div>
    </section>
    
<!-- /SECONDARY HERO -->    

<!--PAGE CONENT-->
    
    <!-- PURCHASE WHOLESALE SECTION -->
    <section class="have-a-design-sub-section" id="">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="have-a-design-subhead">We're always actively seeking outside inventors! Join our stable of world-class designers and inventors and see your concept come to life in record time.</h2>
                </div>
            </div>
        </div>
    </section>
<!-- /PURCHASE WHOLESALE SECTION -->
        
 <!--  FAT BRAIN TOY CO PRESS KIT -->
    <div class="content-section-a">

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="section-heading about-us-heading">Toy Development</h2>
                    <p class="lead">Fat Brain Toy Co. is the development arm of Fat Brain Toys, a leading retailer of specialty toys and games. Unlike many manufacturers, we don't rely upon distribution arrangements or private labels. We travel the world in search of original designs and inventions...and innovative designers and inventors. Are we searching for YOU?</p>
                </div>
                <div class="col-md-6">
                    <h3 class="dev-concept-label">Dado Cubes:</h3>
                    <img class="img-responsive" src="/img/concepts_dado.jpg" alt="">
                </div>
                <div class="col-md-6 dev-concept-right">
                    <h3 class="dev-concept-label">Twig:</h3>
                    <img class="img-responsive" src="/img/concepts_twig.jpg" alt="">
                </div>
                
            </div>

        </div>
        <!-- /.container -->

    </div>

<!--  / FAT BRAIN TOY CO PRESS KIT -->
    
<!-- CONSUMER PURCHASING OPTIONS SECTION -->

     <section class="consumer-purchase-section content-section-a" id="">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h2 class="consumer-purchase-header">Are you an Inventor?</h2>
                </div>
                <div class="col-md-12">
                    <p class="lead">Fat Brain Toy Co. is actively seeking  &ldquo;great ideas.&rdquo; If you have a toy or a game concept you&rsquo;d like to bring to market, please fill in the fields below and we&rsquo;ll contact you promptly with the next steps... but remember - it always starts with a great idea. </p>
                </div>
                 <div class="col-md-6 col-md-offset-3">
                    <div class="form-area"> 
                        
                        <form action="/have_a_design.cfm" method="post">
                        <input type="hidden" name="myaction" value="go">
					    <cfoutput><input type="hidden" name="captcha" value="#captchaText#"></cfoutput>
                                                
                        <form role="form">
                        <br style="clear:both">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="email" name="email" placeholder="Email" required>
                                    </div>
                                    <div class="form-group">
                                    <textarea class="form-control" type="textarea" id="message" name="toy_description" placeholder="Brief Description of the Type of Product" maxlength="5000" rows="7"></textarea>

                                    </div>
                                    <div class="form-group">
                                                    <input type="text" class="form-control" name="captcha_verify" placeholder="Please enter the 3-digit number you see below.">
                                                        <br>
                                                        <cfimage action="captcha" text="#captchaText#" difficulty="medium" width="100" height="40" />

                                    </div>

                        <button type="submit" value="Submit" id="submit" name="submit" class="btn account-btn btn-danger pull-right" onclick="submit()">Submit Form</button>
                        </form>
                        
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    
<!--/PAGE CONENT-->
  
</div><!--/wrap-->

        </cfif>      

<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">

    
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<!-- Include all compiled plugins (below), or include individual files as needed -->
    
<!--


</body>

</html>