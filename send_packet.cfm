<cfset #title# = "Wholesale Toys - Fat Brain Toy Co.">
<cfset #keyword# = "wholesale toys toy distributor UberOrbs (formerly Magnetoids)">
<cfset #description# = " Fat Brain Toy Co. is a retailer, distributor, and developer of educational toys, games, and gifts. We sell ONLY quality, non-violent toys that challenge a child's imaginaton.">
<cfset #hidden_1# = "<H1> Fat Brain Toy Co. is a retailer, distributor, and developer of educational toys, games, and gifts. We sell ONLY quality, non-violent toys that challenge a child's imaginaton.</H1>">
<cfset #alt_1# = " Fat Brain Toy Co. is a retailer, distributor, and developer of educational toys, games, and gifts. We sell ONLY quality, non-violent toys that challenge a child's imaginaton.">
<cfset #alt_2# = "wholesale toys">
<cfset #hidden_2# = "Wholesale Toys, UberOrbs, Magnetoids, Fat Brain Toy Co.">

<cfinclude template="/fatbraintoys/wholesale/templates/header.cfm">

<cfif NOT IsDefined("action")>
	
	<font size="3"><b>Wholesale Catalog Request</b></font>
	
	<br>
	<br>
	
	<cfform action="/send_packet.cfm" method="post">
	<input type="hidden" name="action" value="add">
	
	<table border="0">
		<tr><td>First Name</td><td><cfinput type="Text" name="first_name" size="15" message="Your first name is required" required="Yes"></td></tr>
		<tr><td>Last Name</td><td><cfinput type="text" name="last_name" size="15" message="Your last name is required" required="Yes"></td></tr>
		<tr><td>Company</td><td><cfinput type="text" name="company" size="15" message="A company is required" required="Yes"></td></tr>
		<tr><td>Address</td><td><cfinput type="text" name="address_1" size="30" message="Your address is required" required="Yes"></td></tr>
		<tr><td>Address 2</td><td><cfinput type="text" name="address_2" size="30" required="No"></td></tr>
		<tr><td>City</td><td><cfinput type="text" name="city" size="20" message="Your city is required" required="Yes"></td></tr>
		<tr><td>State</td><td><select name="state">
		<cfinclude template="/fatbraintoys/templates/states.cfm">
        </select></td></tr>
		<tr><td>Zip</td><td><cfinput type="text" name="zip" size="10" message="Your zip code is required" required="Yes"></td></tr>
		<tr><td>E-mail</td><td><cfinput type="text" name="email" size="40" message="Your email address is required" required="Yes"></td></tr>
		<tr><td>&nbsp;</td><td><input type="submit" value="Request Wholesale Catalog"></td></tr>
	</table>
	
	</cfform>

<cfelse>
	
	<cfparam name="isemailresult" default="true">
	
	<cfset #email# = #form.email#>
	
	<cfif #trim(email)# IS NOT ''>
	
		<cfinclude template="/fatbraintoys/templates/isemail.cfm">
		
	</cfif>
	
	<cfif #isemailresult# IS "false">
		
		<br>
		<br>
		<div align="center">
		<cfoutput>
		Sorry, but there was a problem with the email address you submitted.<br>
		#isemailerrortext#
		</cfoutput>
		</div>
		
	<cfelse>
	
		<cfquery name="insert" datasource="#datasource#" dbtype="#dbtype#">
		insert into trade_show_prospects(first_name, last_name, company, address_1, address_2, city, state, zip, email, date_created, date_modified)
		values('#first_name#','#last_name#','#company#','#address_1#','#address_2#','#city#','#state#','#zip#','#email#',#now()#,#now()#)
		</cfquery>
	
		<cfquery name="get_rep_group" datasource="#datasource#" dbtype="#dbtype#">
		select *, r.email as rep_email, r.first_name as rep_first_name, r.last_name as rep_last_name, r.phone as rep_phone, r.fax as rep_fax
		from wholesale_rep_group_states s, wholesale_rep_groups g, wholesale_reps r
		where s.rep_group_id = g.rep_group_id
		and g.default_rep_id = r.rep_id
		and s.state = '#state#'
		</cfquery>
		
		<!---
		<cfmail
			to="#get_rep_group.rep_email#"
			from="Fat Brain Toy Co. <sales@fatbraintoyco.com>"
			subject="Fat Brain Toy Co. Prospect Inquiry"
			type="html">Hello! The following company in your territory has requested a wholesale catalog from the Fat Brain Toy Co. We will be fulfilling this request, but want to give you the opportunity to follow-up with this prospect if they should already be a client.			
			<br><br>
			#first_name# #last_name#<br>
			#company#<br>
			#address_1#<br>
			#address_2#<br>
			#city#, #state# #zip#<br>
			<br><br>
			#email#
		</cfmail>
		
		<cfif #get_rep_group.rep_group_id# NEQ 1001>
		<cfmail
			to="#form.email#"
			from="Fat Brain Toy Co. <sales@fatbraintoyco.com>"
			subject="Fat Brain Toy Co."
			type="html">
#first_name#, thank you for your request of wholesale purchasing information from the Fat Brain Toy Co.! We will be mailing a packet to you via First Class Mail but wanted to make you aware of another option. In your area, the following rep group represents our product line and would be happy to personally work with you and/or provide a hands on demonstration of our toys. If interested, please contact them directly and ask about the Fat Brain Toy Co.
<br><br>
#get_rep_group.company_name#<br>
#get_rep_group.rep_first_name# #get_rep_group.rep_last_name#<br>
Phone: #get_rep_group.rep_phone#<br>
Fax: #get_rep_group.rep_fax#<br>
Email: #get_rep_group.rep_email#
		</cfmail>
		</cfif>
		--->
		
		<cfmail
			to="sales@fatbraintoyco.com"
			from="sales@fatbraintoyco.com"
			subject="Wholesale Catalog Request"
			type="html">
#first_name# #last_name#<br>
#company#<br>
#address_1#<br>
#address_2#<br>
#city#, #state# #zip#<br><br>

#email#
		</cfmail>
	
		<br>
		<br>
		
		<cfoutput>
		<div align="center"><b>
		Thank you! Your Fat Brain Toy Co. wholesale catalog request has been received!
		</b>
		</cfoutput>
		
		<br>
		<br>
		
		<a href="/index.cfm">Return to Home Page</a>
		
		<br>
		<br>
		</div>
		
		<IFRAME SRC="/info_conversion.cfm" WIDTH=20 HEIGHT=5 scrolling="no" MARGINWIDTH=0 MARGINheight=0></IFRAME>
	
	</cfif>
	
</cfif>


<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">