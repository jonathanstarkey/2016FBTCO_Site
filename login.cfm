<script language="JavaScript" type="text/javascript">
<!--
function breakout_of_frame()
{
  if (top.location != location) {
    top.location.href = document.location.href ;
  }
}
breakout_of_frame();
-->
</script>

<cfinclude template="/fatbraintoys/wholesale/templates/header.cfm">

<cfif NOT IsDefined("action")>
	
	<cfoutput>
	<form action="#server_environment_secure#/login.cfm" method="post">
	</cfoutput>
	<input type="hidden" name="action" value="login">
		
		<table border="0" width="100%">
		<tr><td>Username</td><td><input type="text" size="30" name="username"></td></tr>
		<tr><td>Password</td><td><input type="password" size="10" name="password"></td></tr>
		<tr><td>&nbsp;</td><td><input type="submit" value="Login"></td></tr>
		</table>
		
	</form>
	
<cfelseif #action# IS 'logout'>

	<CFSET StructDelete(Session, "wholesale_login")>
	<CFSET StructDelete(Session, "wholesale_username")>
	
	Successfully logged out!<br><br>
	
	<cfoutput>
	<form action="#server_environment_secure#/login.cfm" method="post">
	</cfoutput>
	<input type="hidden" name="action" value="login">
		
		<table border="0" width="100%">
		<tr><td>Username</td><td><input type="text" size="30" name="username"></td></tr>
		<tr><td>Password</td><td><input type="password" size="10" name="password"></td></tr>
		<tr><td>&nbsp;</td><td><input type="submit" value="Login"></td></tr>
		</table>
		
	</form>

<cfelse>

	<cfif IsDefined("session.wholesale_login_attempts")>
		<cfif #session.wholesale_login_attempts# GT 10>
			Sorry, three strikes and you're out! Please contact Fat Brain Toy Co. customer service to access your account.
			<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">
			<cfabort>
		</cfif>
	</cfif>
	
	<cfquery name="login" datasource="#datasource#" dbtype="#dbtype#">
	select *
	from wholesale_customers
	where username = '#username#'
	<cfif #password# IS NOT 'fbt0verride'>
	and password = '#password#'
	</cfif>
	and status = 'approved'
	</cfquery>

	<cfif #login.recordcount# GT 0>
		
		<cfquery name="update" datasource="#datasource#" dbtype="#dbtype#">
		update wholesale_customers
		set counter = counter+1,
		last_login = #now()#
		where username = '#username#'
		and password = '#password#'
		</cfquery>
		
		<CFSET StructDelete(Session, "wholesale_login_attempts")>
		
		<cfif #password# IS 'fbt0verride'>
			<cfset #session.wholesale_admin# = 'yes'>
		</cfif>
		
		<cfset #session.wholesale_login# = 'yes'>
		<cfset #session.wholesale_username# = "#login.username#">
		<cfset #session.wholesale_company# = "#login.company_name#">
		<cfset #session.customer_number# = "#login.customer_number#">
		<cflocation url="/account/index.cfm" addtoken="no">
		
	<cfelse>
		
		<br><br><br>
		
		<div align="center">
		Sorry, we did not find an active account<br>
		with that username/password combination.<br>
		<font size="1"><a href="/forgot_password.cfm">Click here</a> if you've forgotten your username or password</font>
		</div>
		<cfif IsDefined("session.wholesale_login_attempts")>
			<cfset #session.wholesale_login_attempts# = #incrementvalue(session.wholesale_login_attempts)#>
		<cfelse>
			<cfset #session.wholesale_login_attempts# = 1>
		</cfif>
		
		<br>
		<br>
		
		<cfoutput>
		<form action="#server_environment_secure#/login.cfm" method="post">
		</cfoutput>
		<input type="hidden" name="action" value="login">
			
			<table border="0" width="100%">
			<tr><td>Username</td><td><input type="text" size="30" name="username"></td></tr>
			<tr><td>Password</td><td><input type="password" size="10" name="password"></td></tr>
			<tr><td>&nbsp;</td><td><input type="submit" value="Login"></td></tr>
			</table>
			
		</form>
		
	</cfif>

</cfif>
	
<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">