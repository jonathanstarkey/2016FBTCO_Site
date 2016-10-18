<cfsilent>
<cfset #title#="Contact Fat Brain Toy Co.">
<cfset #keywords#="contact fat brain toys, customer service">
<cfset #description#="Contact Fat Brain Toy Co..">
<cfset #hidden_1#="<H1>Contact Fat Brain Toy Co..</H1>">
<cfset #alt_1#="Contact Fat Brain Toy Co..">
<cfset #alt_2#="contact">
<cfset #hidden_2#="contact">
<cfset #bread_crumb_1#="<a href='/index.cfm'>Home</a> >">
<cfset #bread_crumb_2#="Contact Fat Brain Toy Co.">
<cfset #bread_crumb_3#="">
</cfsilent>

<cfset captchaText="#randrange(100,999)#" />

<cfif NOT IsDefined( "action")>




    <!DOCTYPE html>
    <html lang="en">

    <body>
        <!-- Wrap all page content here -->
        <div id="wrap">
            <cfinclude template="/fatbraintoys/wholesale/templates/secondary_header.cfm">

                <!-- SECONDARY HERO -->
                <section class="secondary-header-2" id="">
                    <div class="container-fluid parallax-container">
                        <div class="row">
                            <div class="parallax-window" data-parallax="scroll" data-image-src="/img/contact_header.jpg">
                                <div class="col-lg-8 col-lg-offset-2 text-right">
                                    <h2 class="secondary-header-title">Contact</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- /SECONDARY HERO -->
                <!-- Page Content -->
                <div class="content-section-a">
                    <div id="feedback">
                        <div class="container">
                            <div class="col-md-5 col-md-offset-1">
                                <h2 class="contact-lable">Contact Form</h2>
                                <div class="form-area">
                                    <div class="form-area">

                                            <form role="form" action="/contact.cfm" method="post">
                                            <input type="hidden" name="action" value="go">
                                                <br style="clear:both">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="name" name="from_name" placeholder="Name" required>
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="email" name="from_email" placeholder="Email" required>
                                                </div>

                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="subject" placeholder="Subject" required>
                                                </div>

                                                <div class="form-group">
                                                    <textarea class="form-control" type="textarea" name="message" id="message" placeholder="Message" maxlength="5000" rows="7"></textarea>

                                                </div>

                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="captcha_verify" placeholder="Please enter the 3-digit number you see below.">
                                                        <br>
                                                        <cfimage action="captcha" text="#captchaText#" difficulty="medium" width="100" height="40" />
                                                        <cfoutput><input type="hidden" name="captcha" value="#captchaText#"></cfoutput>

                                                </div>

                                                <button type="submit" id="submit" name="submit" value="Send Message" class="btn account-btn btn-danger pull-right" onclick="submit()">Submit Form</button>
                                                
                                            </form>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 contact-info">
                                <div class="col-md-4 col-sm-2"><img src="/img/brain.png" style="width:140px; height: auto;" class=""></div>
                                <div class="col-md-8 col-sm-12">
                                    <h2 class="contact-lable">Fat Brain Toy Co.</h2>
                                    <br>
                                    <p class="contact-address">Toll Free Number: 1-800-335-5621
                                        <br> International Phone: 1-402-779-3181
                                        <br>Fax: 402-779-3253
                                        <br>E-Mail: <a href="mailto:sales@fatbraintoyco.com">sales@fatbraintoyco.com</a
                                    </p>
                                    <p class="contact-address" >20516 Nicholas Circle<br>
          Elkhorn, NE  68022</p><br>
                                    <a  href="#view-map" class="contact-map" data-toggle="modal">View Map &#8250;</a>
                                </div>
                            </div>
                        </div>
                        <!--feedback-->
                        <!-- /EXPLORE MORE -->

                    </div>
                    <!--/container-->

                </div>
                <!--/wrap-->
                <!--  DIVIDER  -->
                <div class="container">
                    <hr>
                </div>

                <!--  /DIVIDER  -->

                <cfelse>
                
                <cfinclude template="/fatbraintoys/wholesale/templates/header.cfm">

                    <cfparam name="form.from_email" default="">
					<cfset #email#=# form.from_email#>

					<cfinclude template="/fatbraintoys/templates/isemail.cfm">

					<cfif #isemailresult# IS "false">
					
						<br>
						<br>
						<div align="center">
							<cfoutput>
								Sorry, but there was a problem with the email address you submitted.
								<br>
								<b>#isemailerrortext#</b>
							</cfoutput>
						</div>

					<cfelseif #form.captcha_verify# IS NOT #form.captcha#>
					
						<br>
						<br>
						<br>

						<cfoutput>
							<div align="center">
								<font color="##395898" size="4">Sorry, but the verification image and text you entered did not match.
						<br><br>
						Please go back and try again.
						</div>
						</cfoutput>
	
						<br><br><br>
						
						<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">
	
						<cfabort>
	
					<cfelse>

						<cfmail to="#ChooseTo('sales@fatbraintoyco.com')#"
							from="#from_name# <#from_email#>"
							subject="#subject#">
				#message#
						</cfmail>
	
						<cfquery name="insert_contact" datasource="#datasource#" dbtype="#dbtype#">
						insert into contacts(date_created,to_email,from_email,from_name,subject,message,ip)
						values(#now()#,'sales@fatbraintoyco.com','#from_email#','#from_name#','#subject#','#message#','#CGI.REMOTE_ADDR#')
						</cfquery>

						<br>
						<br>
	
						<cfoutput>
						<div align="center"><b>
						Thank you! Your message has been sent to the<br>
						appropriate contact at The Fat Brain Toy Co.!
						</b>
						</cfoutput>
	
						<br>
						<br>
	
						<a href="/index.cfm">Return to Home Page</a>
	
						<br>
						<br>
						</div>
	
					</cfif>

				</cfif>

<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">
    
<!-- MODAL IFRAME -->
    
 <div class="modal fade" id="view-map">
		<div class="modal-dialog  modal-lg">
			<div class="modal-content">

				<div class="modal-body">
          
          <div class="close-button">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          </div>
          <div class="embed-responsive embed-responsive-16by9">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2998.8125558054894!2d-96.24088104853112!3d41.26941701116042!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8793faaa663f6597%3A0x9b3508a6cd3d9102!2s20516+Nicholas+Cir%2C+Omaha%2C+NE+68022!5e0!3m2!1sen!2sus!4v1468513965656" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
          </div>
				</div>

			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal --> 

<!-- /MODAL IFRAME -->
    
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    


</body>

</html>