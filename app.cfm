<!DOCTYPE html>
<html lang="en">

<body>
    <!-- Wrap all page content here -->
    <div id="wrap">

        <cfinclude template="/fatbraintoys/wholesale/templates/secondary_header.cfm">
        
        
<cfif IsDefined("form.action")>

	<cfparam name="alert" default="no">
	<cfparam name="alert_message" default="">
	
	<cfparam name="store_type" default="">
	<cfparam name="purchasing_type" default="">
	
	<cfif NOT IsDefined("username")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Username">
	<cfelseif #trim(username)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Username">
	</cfif>
	
	<cfif NOT IsDefined("Password")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Password">
	<cfelseif #trim(Password)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Password">
	</cfif>
	
	<cfif NOT IsDefined("company_name")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Company Name">
	<cfelseif #trim(company_name)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Company Name">
	</cfif>
	
	<cfif NOT IsDefined("contact_first_name")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Conact First Name">
	<cfelseif #trim(contact_first_name)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Conact First Name">
	</cfif>
	
	<cfif NOT IsDefined("contact_last_name")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Contact Last Name">
	<cfelseif #trim(contact_last_name)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Contact Last Name">
	</cfif>
	
	<cfif NOT IsDefined("contact_phone")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Contact Phone">
	<cfelseif #trim(contact_phone)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Contact Phone">
	</cfif>
	
	<!--- <cfif NOT IsDefined("contact_fax")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Contact Fax">
	<cfelseif #trim(contact_fax)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Contact Fax">
	</cfif> --->
	
	<cfif NOT IsDefined("contact_email")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Contact Email Address">
	<cfelseif #trim(contact_email)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Contact Email Address">
	<cfelse>
		<cfset #email# = #contact_email#>
		<cfinclude template="/fatbraintoys/templates/isemail.cfm">
		<cfif #isemailresult# IS "false">
			<cfset #alert# = "yes">
			<cfset #alert_message# = "#isemailerrortext#">
		</cfif>
	</cfif>
	
	<cfif NOT IsDefined("payment_method")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Method of Payment">
	<cfelseif #trim(payment_method)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Method of Payment">
	</cfif>
	
	<cfif NOT IsDefined("customer_resale_number")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Resale Number">
	<cfelseif #trim(customer_resale_number)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Resale Number">
	</cfif>
	
	<cfif NOT IsDefined("secret_question")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Secret Question">
	<cfelseif #trim(secret_question)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Secret Question">
	</cfif>
	
	<cfif NOT IsDefined("secret_answer")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Secret Answer">
	<cfelseif #trim(secret_answer)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Secret Answer">
	</cfif>
	
	<cfif NOT IsDefined("bill_first_name")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing First Name">
	<cfelseif #trim(bill_first_name)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing First Name">
	</cfif>
	
	<cfif NOT IsDefined("bill_last_name")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing Last Name">
	<cfelseif #trim(bill_last_name)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing Last Name">
	</cfif>
	
	<cfif NOT IsDefined("bill_address")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing Address">
	<cfelseif #trim(bill_address)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing Address">
	</cfif>
	
	<cfif NOT IsDefined("bill_city")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing City">
	<cfelseif #trim(bill_city)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing City">
	</cfif>
	
	<cfif NOT IsDefined("bill_state")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing State/Province">
	<!---<cfelseif #trim(bill_state)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing State/Province">--->
	</cfif>
	
	<cfif NOT IsDefined("bill_zip")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing Zip/Postal Code">
	<cfelseif #trim(bill_zip)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing Zip/Postal Code">
	</cfif>
	
	<cfif NOT IsDefined("bill_country")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing Country">
	<cfelseif #trim(bill_country)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Billing Country">
	</cfif>
	
	<cfif NOT IsDefined("ship_first_name")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping First Name">
	<cfelseif #trim(ship_first_name)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping First Name">
	</cfif>
	
	<cfif NOT IsDefined("ship_last_name")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping Last Name">
	<cfelseif #trim(ship_last_name)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping Last Name">
	</cfif>
	
	<cfif NOT IsDefined("ship_address")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping Address">
	<cfelseif #trim(ship_address)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping Address">
	</cfif>
	
	<cfif NOT IsDefined("ship_city")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping City">
	<cfelseif #trim(ship_city)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping City">
	</cfif>
	
	<cfif NOT IsDefined("ship_state")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping State/Province">
	<!---<cfelseif #trim(ship_state)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping State/Province">--->
	</cfif>
	
	<cfif NOT IsDefined("ship_zip")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping Zip/Postal Code">
	<cfelseif #trim(ship_zip)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping Zip/Postal Code">
	</cfif>
	
	<cfif NOT IsDefined("ship_country")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping Country">
	<cfelseif #trim(ship_country)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Shipping Country">
	</cfif>
	
	<cfif NOT IsDefined("terms")>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Terms & Conditions">
	<cfelseif #trim(terms)# IS ''>
		<cfset #alert# = "yes">
		<cfset #alert_message# = "Terms & Conditions">
	</cfif>
	
	<cfif #alert# IS 'yes'>
		
		<cfoutput>
		<br><br><br>
		<div align="center">
		<b>Sorry, but <font color="red">#alert_message#</font> is a required field.</b>
		<br>Please go <a href="javascript:history.back()">back</a>
		and complete the order form and try again.
		</div>
		<br><br>
		</cfoutput>
		
		<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">
		<cfabort>
		
	</cfif>
	
	<cfquery name="check_username" datasource="#datasource#" dbtype="#dbtype#">
	select *
	from wholesale_customers
	where username = '#username#'
	</cfquery>
	
	<cfif #check_username.recordcount# GT 0>
		
		<cfoutput>
		<br><br><br>
		<div align="center">
		<b>Sorry, but the username <font color="red">#username#</font> is already in use.</b>
		<br>Please go <a href="javascript:history.back()">back</a>
		and choose a different username.
		</div>
		<br><br>
		</cfoutput>
		
		<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">
		<cfabort>
		
	</cfif>
	
	<cfset #customer_number# = "#right(year(now()),1)##numberformat(dayofyear(now()),000)##numberformat(randrange(1,999),00)#">
	
	<cfset #default_rep_id# = 10001>

	<cfquery name="insert_customers" datasource="#datasource#" dbtype="#dbtype#">
	insert into wholesale_customers(customer_number,username,password,status,company_name,contact_first_name,contact_last_name,contact_phone,contact_fax,contact_email,store_type,store_type_other,purchasing_type,purchasing_type_other,payment_method,bill_first_name,bill_last_name,bill_company,bill_address,bill_city,bill_state,bill_zip,bill_country,ship_first_name,ship_last_name,ship_company,ship_address,ship_city,ship_state,ship_zip,ship_country,ship_phone,ship_email,ip_address,cfid,cftoken,date_created,date_modified,customer_resale_number,secret_question,secret_answer,last_login,website,rep_id)
	values(#customer_number#,'#username#','#password#','New Application','#company_name#','#contact_first_name#','#contact_last_name#','#contact_phone#','#contact_fax#','#contact_email#','#store_type#','#store_type_other#','#purchasing_type#','#purchasing_type_other#','#payment_method#','#bill_first_name#','#bill_last_name#','#bill_company#','#bill_address#','#bill_city#','#bill_state#','#bill_zip#','#bill_country#','#ship_first_name#','#ship_last_name#','#ship_company#','#ship_address#','#ship_city#','#ship_state#','#ship_zip#','#ship_country#','#ship_phone#','#ship_email#','#CGI.remote_addr#','0','0',#now()#,#now()#,'#customer_resale_number#','#secret_question#','#secret_answer#',#now()#,'#website#',#default_rep_id#)
	</cfquery>
	
	<div align="center">
	<br><br>
	<b>Your application has been successfully submitted.</b><br>
	We will review your application and follow-up with additional details shortly.<br>
	<i>Thank you for your interest in Fat Brain Toy Co.!</i>
	</div>	
	
	<br><br>
	
	<cfif #payment_method# IS 'Net 30'>
	
		<div align="center">
		<table border="1" cellpadding="12" cellspacing="0">
		<tr><td>
		
			<b>NOTE:</b> You indicated on the application that you wish to establish Net 30 terms. In order to establish terms, please download the following credit application form in PDF format (<a href="http://www.adobe.com/products/acrobat/readstep2.html">download PDF Reader).
			<br><br>
			<div align="center">
			<b><a href="/credit_app.pdf">Credit Application Form</a></b>
			</div>
		
		</td></tr>
		</table>
		</div>
		
	<cfelse>
	
		<div align="center">
		<a href="/index.cfm">Please feel free to browse our selection of toys, games, and gifts...</a>
		</div>	
	
	</cfif>
	
	<cfmail
		to="#ChooseTo('sales@fatbraintoyco.com')#"
		from="sales@fatbraintoyco.com"
		subject="Wholesale Application Submitted"
		type="HTML">#company_name#<br>
#contact_first_name# #contact_last_name#<br>
#contact_phone#<br>
#contact_fax#<br>
#contact_email#<br>
--------------------------------------------<br>
#store_type# #store_type_other#<br>
#purchasing_type# #purchasing_type_other#<br>
#payment_method#<br>
#website#<br>
--------------------------------------------<br>
#bill_first_name# #bill_last_name#<br>
#bill_company#<br>
#bill_address#<br>
#bill_city#, #bill_state# #bill_zip# #bill_country#<br>
--------------------------------------------<br>
#ship_first_name# #ship_last_name#<br>
#ship_company#<br>
#ship_address#<br>
#ship_city#, #ship_state# #ship_zip# #ship_country#<br>
#ship_phone#<br>
#ship_email#<br>
--------------------------------------------<br>
#customer_resale_number#<br>
	</cfmail>
	
	<IFRAME SRC="/app_conversion.cfm" WIDTH=20 HEIGHT=5 scrolling="no" MARGINWIDTH=0 MARGINheight=0></IFRAME>
		
<cfelse>


            <!-- SECONDARY HERO -->
            <section class="secondary-header-2" id="">
                <div class="container-fluid parallax-container">
                    <div class="row">
                        <div class="parallax-window" data-parallax="scroll" style="background: #ff8300;" data-image-src="">
                            <div class="col-lg-8 col-lg-offset-2 text-right">
                                <h2 class="secondary-header-title-2">Online Account Application</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- /SECONDARY HERO -->


            <div class="content-section-a">
                <div class="container meet-fat-brain-container">
                    <div class="row">

                        <!--  DESCRIPTION -->
                        <div class="col-lg-8 col-lg-offset-1 col-sm-10">

                            <div class="text-container">
                                <div class="text-content">
                                    <h2 class="section-heading descripton-head">Online Account Benefits</h2>
                                    <p class="description-container">
                                        <ul>
                                            <li>Fast account approval</li>
                                            <li>Access to Download Center including product photos and descriptions</li>
                                            <li>Order History with Order Recall capability for fast re-orders</li>
                                            <li>Order Tracking for 24 hour/day order status</li>
                                        </ul>
                                    </p>
                                </div>
                             
                                <div class="text-content">
                                    <h2 class="section-heading descripton-head">Instructions</h2>
                                    <p class="description-container">
                                        <ol type="1">
                                            <li>Complete the following information (all items marked with (<img src="/images/required_box.gif" width="9" height="9" border="0">) are required)</li>
                                            <li>Review our <a href="##" data-toggle="modal" data-target="#myModal-terms-and-conditions">Terms and Conditions</a> and <a href="/docs/map_policy.pdf" download>MAP and 3rd Party Policy</a></li>
                                            <li>Submit the application</li>
                                            <li>If your account is approved, we will send you an email with your account number and link to account login</li>
                                        </ol>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container -->
            </div>

            <!--  /DESCRIPTION -->
            <div class="container">
                <div class="row">
                    <form class="form-horizontal row-border" action="/app.cfm" name="app" method="post">
                    <input type="hidden" name="action" value="go">

                        <!--          ACCOUNT SET-UP SECTION               -->
                        <div class="col-md-10 col-sm-6 col-xs-12 col-lg-offset-1">
                            <div class="panel panel-default">
                                <div class="panel-heading clearfix">
                                    <i class="icon-calendar"></i>
                                    <h3 class="panel-title">Account Set-up</h3>
                                </div>

                                <div class="panel-body">

                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Choose a Username</label>
                                        <div class="col-md-6">
                                            <input type="text" name="username" class="form-control" message="A USERNAME is required" placeholder="Username" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Choose Password</label>
                                        <div class="col-md-6">
                                            <input type="password" name="password" class="form-control" message="A PASSWORD is required" placeholder="Password" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Secret Question</label>
                                        <div class="col-md-6">
                                            <select class="form-control" name="secret_question" message="A SECRET QUESTION is required" required="Yes">
                                                <option value="">-- select a question --</option>
                                                <option value="What is your Mother's maiden name?">What is your Mother's maiden name?</option>
                                                <option value="What is your favorite pet's name?">What is your favorite pet's name?</option>
                                                <option value="What city were you born in?">What city were you born in?</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Secret Answer</label>
                                        <div class="col-md-6">
                                            <input type="text" name="secret_answer" class="form-control" message="A SECRET ANSWER is required" placeholder="Secret Answer" required="yes">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--         / ACCOUNT SET-UP SECTION               -->
                        <!--          ACCOUNT INFORMATION               -->
                        <div class="col-md-10 col-sm-6 col-xs-12 col-lg-offset-1">
                            <div class="panel panel-default">
                                <div class="panel-heading clearfix">
                                    <i class="icon-calendar"></i>
                                    <h3 class="panel-title">Account Information</h3>
                                </div>

                                <div class="panel-body">

                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Company Name</label>
                                        <div class="col-md-6">
                                            <input type="text" name="company_name" class="form-control" message="A COMPANY NAME is required" placeholder="Company Name" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Contact First Name</label>
                                        <div class="col-md-6">
                                            <input type="text" name="contact_first_name" class="form-control" message="A CONTACT FIRST NAME is required" placeholder="Contact First Name" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Contact Last Name</label>
                                        <div class="col-md-6">
                                            <input type="text" name="contact_last_name" class="form-control" message="A CONTACT LAST NAME is required" placeholder="Contact Last Name" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Contact Phone</label>
                                        <div class="col-md-6">
                                            <input type="text" name="contact_phone" class="form-control" message="A CONTACT PHONE NUMBER is required" placeholder="Contact Phone" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Contact Fax</label>
                                        <div class="col-md-6">
                                            <input type="text" name="contact_fax" class="form-control"  placeholder="Contact Fax">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Contact Email</label>
                                        <div class="col-md-6">
                                            <input type="text" name="contact_email" class="form-control" message="A CONTACT EMAIL is required" placeholder="Contact Email" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Website URL</label>
                                        <div class="col-md-6">
                                            <input type="text" name="website" class="form-control"  placeholder="Website URL">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Store Type</label>
                                        <div class="col-md-9">
                                            <label class="radio-inline">
                                            <input type="radio" name="store_type" value="Gift Shop"> Gift Shop
                                          </label>
                                            <label class="radio-inline">
                                            <input type="radio" name="store_type" value="Toy Store"> Toy Store
                                          </label>
                                            <label class="radio-inline">
                                            <input type="radio" name="store_type" value="Rep"> Rep
                                          </label>
                                            <label class="radio-inline">
                                            <input type="radio" name="store_type" value="Other"> Other: 
                                                <input type="text" name="store_type_other">
                                          </label>
                                          
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Purchasing Type</label>
                                        <div class="col-md-9">
                                            <label class="radio-inline">
                                            <input type="radio" name="purchasing_type" value="Physical Store"> Physical Store
                                          </label>
                                            <label class="radio-inline">
                                            <input type="radio" name="purchasing_type" value="Online"> Online
                                          </label>
                                            <label class="radio-inline">
                                            <input type="radio" name="purchasing_type" value="Physical Store + Online"> Physical Store + Online
                                          </label>
                                            <label class="radio-inline">
                                            <input type="radio" name="purchasing_type" value="Other"> Other: 
                                                <input type="text" name="purchasing_type_other">
                                          </label>
                                            
                                          
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Method of Payment</label>
                                        <div class="col-md-9">
                                            <label class="radio-inline">
                                            <input type="radio" name="payment_method" value="Credit Card"> Credit Card
                                          </label>
                                            <label class="radio-inline">
                                            <input type="radio" name="payment_method" value="Net 30"> Net 30 (with approved credit)
                                          </label>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Resale Number</label>
                                        <div class="col-md-6">
                                            <input type="text" name="customer_resale_number" class="form-control" message="A RESALE NUMBER is required" placeholder="Resale Number" required="yes">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--         / ACCOUNT INFORMATION               -->
                        <!--         BILL TO INFORMATION               -->
                        <div class="col-md-10 col-sm-6 col-xs-12 col-lg-offset-1">
                            <div class="panel panel-default">
                                <div class="panel-heading clearfix">
                                    <i class="icon-calendar"></i>
                                    <h3 class="panel-title">Bill To</h3>
                                </div>

                                <div class="panel-body">

                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">First Name</label>
                                        <div class="col-md-6">
                                            <input type="text" name="bill_first_name" class="form-control" message="A BILLING FIRST NAME is required" placeholder="First Name" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Last Name</label>
                                        <div class="col-md-6">
                                            <input type="text" name="bill_last_name" class="form-control" message="A BILLING LAST NAME is required" placeholder="Last Name" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Company Name</label>
                                        <div class="col-md-6">
                                            <input type="text" name="bill_company" class="form-control"  placeholder="Company Name">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Address</label>
                                        <div class="col-md-6">
                                            <input type="text" name="bill_address" class="form-control" message="A BILLING ADDRESS is required" placeholder="Address" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">City</label>
                                        <div class="col-md-6">
                                            <input type="text" name="bill_city" class="form-control" message="A BILLING CITY is required" placeholder="City" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">State/Province</label>
                                        <div class="col-md-6">
                                            <select class="form-control" name="bill_state" message="A BILLING STATE is required" required="Yes">
                                              <cfinclude template="/fatbraintoys/templates/states.cfm">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Zip/Postal Code </label>
                                        <div class="col-md-6">
                                            <input type="text" name="bill_zip" class="form-control" message="A BILLING ZIP CODE is required" placeholder="Zip/Postal Code" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Country</label>
                                        <div class="col-md-6">
                                            <select class="form-control" name="bill_country" message="A BILLING COUNTRY is required" required="Yes">
                                              <cfinclude template="/fatbraintoys/templates/countries.cfm">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--         / BILL TO INFORMATION               -->
                        <!--         SHIP TO INFORMATION               -->
                        <div class="row">
                        <div class="col-md-10 col-sm-6 col-xs-12 col-lg-offset-1">
                            <div class="panel panel-default">
                                <div class="panel-heading clearfix">
                                    
                                    <h3 class="panel-title" style="display:inline-block;">Ship To</h3>
                                    <span>&nbsp;(&nbsp;<input type="checkbox" name="shiptobilladdr" value="yes" onClick="populateShipping()"> check this box if shipping and billing address are the same&nbsp;)</span>
                                </div>

                                <div class="panel-body">

                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">First Name</label>
                                        <div class="col-md-6">
                                            <input type="text" name="ship_first_name" class="form-control" message="A SHIPPING FIRST NAME is required" placeholder="First Name" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Last Name</label>
                                        <div class="col-md-6">
                                            <input type="text" name="ship_last_name" class="form-control" message="A SHIPPING LAST NAME is required" placeholder="Last Name" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Company Name</label>
                                        <div class="col-md-6">
                                            <input type="text" name="ship_company" class="form-control"  placeholder="Company Name">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Address</label>
                                        <div class="col-md-6">
                                            <input type="text" name="ship_address" class="form-control" message="A SHIPPING ADDRESS is required" placeholder="Address" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">City</label>
                                        <div class="col-md-6">
                                            <input type="text" name="ship_city" class="form-control" message="A SHIPPING CITY is required" placeholder="City" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">State/Province</label>
                                        <div class="col-md-6">
                                            <select class="form-control" name="ship_state" message="A SHIPPING STATE is required" required="Yes">
                                              <cfinclude template="/fatbraintoys/templates/states.cfm">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Zip/Postal Code </label>
                                        <div class="col-md-6">
                                            <input type="text" name="ship_zip" class="form-control" message="A SHIPPING ZIP CODE is required" placeholder="Zip/Postal Code" required="yes">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">Country</label>
                                        <div class="col-md-6">
                                            <select class="form-control" name="ship_country" message="A SHIPPING COUNTRY is required" required="Yes">
                                              <cfinclude template="/fatbraintoys/templates/countries.cfm">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Contact Phone</label>
                                        <div class="col-md-6">
                                            <input type="text" name="ship_phone" class="form-control" placeholder="Ship Phone">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Contact Email</label>
                                        <div class="col-md-6">
                                            <input type="text" name="ship_email" class="form-control" placeholder="Ship Email" >
                                        </div>
                                    </div>
                                    <hr noshade>
                                    <div class="form-group required">
                                        <label class="col-md-3 control-label">terms and conditions</label>
                                        <div class="col-md-6">
                                             <div class="checkbox">
                                              <label>
                                                <input type="checkbox" name="terms" value="yes"> Check this box to acknowledge that you have read and agree to our <a a href="##" data-toggle="modal" data-target="#myModal-terms-and-conditions">terms and conditions</a>.
                                              </label>
                                            </div>
                                        </div>
                                    </div>
                                    <hr noshade>
                        <button type="submit"  name="submit" value="Submit Account Application" class="btn account-btn btn-danger center-block">Submit Account Application</button>
                                </div>
                            </div>
                        </div>
                            </div>
                        <!--         / SHIP TO INFORMATION               -->
                    </form>
                </div>
            </div>
            

    </div>
    <!--/container-->

    </div>
    <!--/wrap-->
    <!--  DIVIDER  -->
	<div class="container">
		<hr>
	</div>

<!--  /DIVIDER  -->

</cfif>

<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">
        
        

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

</body>

</html>