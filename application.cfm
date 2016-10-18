<cfsilent>

<cfset remote_ip = cgi.remote_addr>
<cftry>
<cfif (IsDefined("CGI.HTTP_X_Forwarded_For")) AND (CGI.HTTP_X_Forwarded_For IS NOT '')>
	<cfset remote_ip = CGI.HTTP_X_Forwarded_For>
<cfelseif (IsDefined("GetHttpRequestData.Headers")) AND (StructFind(GetHttpRequestData.Headers, 'X-Forwarded-For') IS NOT '')>
	<cfset remote_ip = StructFind(GetHttpRequestData().Headers, 'X-Forwarded-For')>
</cfif>
<cfcatch type="Any">
	<cfmail from="webmaster@fatbraintoys.com" to="siteerror@fatbraintoys.com" subject="APPLICATION ERROR 1" type="text">#now()#</cfmail>
</cfcatch>
</cftry>

<cfif findnocase(',',remote_ip)>
	<cfset remote_ip = spanExcluding(remote_ip,',')>
<cfelseif Len(remote_ip) GT 15>
	<cfset remote_ip = cgi.remote_addr>
</cfif>

<!--- ADDED 204.238.82.22 TO BLOCK PCI METRICS 8/23/2011 --->
<cfif listFindNoCase("91.215.216.96,5.101.156.11,85.25.242.250,141.255.162.174,76.94.209.45,198.171.176.167,204.238.82.22,64.79.132.41,66.116.114.240,69.194.138.236", variables.remote_ip)>
	<cfheader statuscode="403" statustext="Forbidden" />
	<cfabort>
</cfif>

<cfinvoke component="cfc.security.xss" method="xss_guard" />

<cfif NOT IsDefined("application_init")>

	<cfif #findnocase('DECLARE%20@',CGI.QUERY_STRING)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	<cfelseif #findnocase('@@version',CGI.QUERY_STRING)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	<cfelseif #findnocase('%40%40version',CGI.QUERY_STRING)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	<cfelseif #findnocase('TABLE_NAME',CGI.QUERY_STRING)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	<cfelseif #findnocase('COLUMN_NAME',CGI.QUERY_STRING)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	<cfelseif #findnocase('INFORMATION_SCHEMA',CGI.QUERY_STRING)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	</cfif>
	<cfif #findnocase('SELECT%20',CGI.QUERY_STRING)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	</cfif>
	<cfif #findnocase('SELECT+',CGI.QUERY_STRING)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	</cfif>
	<cfif #findnocase('UNION%20',CGI.QUERY_STRING)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	</cfif>
	<cfif #findnocase('unhex',CGI.QUERY_STRING)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	</cfif>
	<cfif #findnocase('order+by',CGI.QUERY_STRING)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	</cfif>
	<cfif #findnocase('order%20by',CGI.QUERY_STRING)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	</cfif>
	<cfif #findnocase('Synapse',CGI.HTTP_USER_AGENT)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	<cfelseif #findnocase('Arachni',CGI.HTTP_USER_AGENT)# GT 0>
		<cfheader statuscode="403" statustext="Forbidden">
		<cfabort>
	</cfif>
	
	<cfset application_init = 'yes'>
	<cfparam name="site_id" default="8">
	<cfparam name="site_name" default="">
	<cfparam name="site_path" default="">
	<cfparam name="site_label" default="Fat Brain Toy Co.">
	<cfparam name="site_domain" default="fatbraintoyco.com">
	<cfparam name="pfp_u" default="fatbrain06">
	<cfparam name="pfp_p" default="mk91amjb2">
	<cfparam name="cs_phone_number" default="1-800-335-5621">
	<cfparam name="fax_number" default="402-779-3253">
	<cfparam name="gift_info_display" default="no">
	<cfparam name="discount_code_display" default="no">
	<cfparam name="gift_certificate_display" default="no">
	<cfparam name="survey_display" default="no">
	<cfparam name="virtual_gift_display" default="no">
	<cfparam name="primary_color" default="##0098a6">
	<cfparam name="accent_color" default="##DBCFC4">
	
	<cfparam name="right_nav" default="no">
	<cfparam name="alt_2" default="">
	<cfparam name="hidden_2" default="">
	
	<cfif structKeyExists(server, "railo")>
		<cfset server_type = 'Railo'>
	<cfelse>
		<cfset server_type = 'ColdFusion'>
	</cfif>
	<cfif (CGI.SERVER_NAME IS '192.168.1.220') OR (CGI.SERVER_NAME IS '192.168.1.77')>
		<cfparam name="operating_context" default="dev">
		<cfparam name="server_environment" default="http://#CGI.SERVER_NAME#">
		<cfparam name="server_environment_secure" default="http://#CGI.SERVER_NAME#">
		<cfparam name="server_environment_admin" default="http://#CGI.SERVER_NAME#">
		<cfparam name="site_domain" default="#CGI.SERVER_NAME#">
		<cfparam name="datasource" default="fatbraintoys">
	    <cfset request.dsn = "fatbraintoys">
		<cfparam name="dbtype" default="ODBC">
		<cfif server_type IS 'railo'>
			<cfparam name="root_path" default="\Volumes\dev\wwwroot">
			<cfparam name="root_path_shared" default="\Volumes\tran_files">
			<cfparam name="server_id_path" default="\Volumes\Macintosh HD2">
			<cfparam name="image_uploads" default="\\fbt-nas\tran_files\image_uploads">
		<cfelse>
			<cfparam name="root_path" default="d:\inetpub\wwwroot">
			<cfparam name="root_path_shared" default="d:\tran_files">
			<cfparam name="server_id_path" default="c:">
			<cfparam name="image_uploads" default="d:\tran_files\image_uploads">
		</cfif>
		<cfparam name="content_path" default="#root_path#\fatbraintoys\images\members">
		<cfset admin_url = "http://192.168.1.220">
	<cfelseif CGI.SERVER_NAME IS '192.168.100.70' OR left(cgi.server_name,10) IS '192.168.1.'>
		<cfparam name="operating_context" default="live">
		<cfparam name="server_environment" default="http://#cgi.SERVER_NAME#">
		<cfparam name="server_environment_secure" default="http://#cgi.SERVER_NAME#">
		<cfparam name="server_environment_admin" default="http://#cgi.SERVER_NAME#">
		<cfparam name="site_domain" default="fatbraintoyco.com">
		<cfparam name="datasource" default="fatbraintoys">
	    <cfset request.dsn = "fatbraintoys">
		<cfparam name="dbtype" default="ODBC">
		<cfparam name="root_path" default="\Volumes\Macintosh HD2\Dropbox\inetpub\wwwroot">
		<cfparam name="root_path_shared" default="\Volumes\data\tran_files">
		<cfparam name="server_id_path" default="\Volumes\Macintosh HD2">
		<cfparam name="image_uploads" default="\Volumes\data\tran_files\image_uploads">
		<cfparam name="content_path" default="#root_path#\fatbraintoys\images\members">
		
	<cfelseif (server.os.name IS 'Windows Server 2012')>
		<!--- <cfmail from="mark@fatbraintoys.com" to="markcarson@mac.com" subject="COOKIES" type="html"><cfdump var="#cookie#"></cfmail> --->
		<cfparam name="operating_context" default="live">
		<cfparam name="server_environment" default="https://www.fatbraintoyco.com">
		<cfparam name="server_environment_secure" default="https://www.fatbraintoyco.com">
		<cfparam name="server_environment_admin" default="https://www.fatbraintoyco.com">
		<cfparam name="site_domain" default="fatbraintoyco.com">
		<cfparam name="datasource" default="fatbraintoys">
		<cfset request.dsn = "fatbraintoys">
		<cfparam name="dbtype" default="ODBC">
		<cfparam name="root_path" default="d:\Dropbox\inetpub\wwwroot">
		<cfparam name="root_path_shared" default="\\10.10.100.51\data\tran_files">
		<cfparam name="server_id_path" default="c:">
		<cfparam name="image_uploads" default="\\10.10.100.51\data\tran_files\image_uploads">
		<cfparam name="content_path" default="\\10.10.100.51\data\tran_files\image_uploads\members">
		
	<cfelse>
		<cfparam name="operating_context" default="live">
		<cfparam name="server_environment" default="http://www.fatbraintoyco.com">
		<cfparam name="server_environment_secure" default="https://www.fatbraintoyco.com">
		<cfparam name="server_environment_admin" default="http://www.fatbraintoyco.com">
		<cfparam name="site_domain" default="fatbraintoyco.com">
		<cfparam name="datasource" default="fatbraintoys">
		<cfset request.dsn = "fatbraintoys">
		<cfparam name="dbtype" default="ODBC">
		<cfif server_type IS 'railo'>
			<cfparam name="root_path" default="\Volumes\Macintosh HD2\Dropbox\inetpub\wwwroot">
			<cfparam name="root_path_shared" default="\Volumes\data\tran_files">
			<cfparam name="server_id_path" default="\Volumes\Macintosh HD2">
			<cfparam name="image_uploads" default="\Volumes\data\tran_files\image_uploads">
		<cfelse>
			<cfparam name="root_path" default="d:\codetree\My Dropbox\inetpub\wwwroot">
			<cfparam name="root_path_shared" default="\\Fbt-nas\tran_files">
			<cfparam name="server_id_path" default="c:">
			<cfparam name="image_uploads" default="\\fbt-nas\tran_files\image_uploads">
		</cfif>
		<cfparam name="content_path" default="#root_path#\fatbraintoys\images\members">
	</cfif>
	
	<cfset #image_source# = '//d3tvemk8zf61cc.cloudfront.net'>
	<cfset #product_image_source# = '//d1jqecz1iy566e.cloudfront.net'>
	
	<cftry>
		<cffile action="read" file="#server_id_path#\server_id.txt" variable="current_server_id">
		<cfcatch type="any">
			<cfmail from="webmaster@fatbraintoys.com" to="siteerror@fatbraintoys.com" subject="APPLICATION ERROR 2" type="text">#now()#</cfmail>
			<cfparam name="current_server_id" default="00">
		</cfcatch>
	</cftry>
	
	<cfapplication 
	name="fatbraintoyco" 
	clientmanagement="Yes" 
	sessionmanagement="Yes" 
	setclientcookies="Yes" 
	sessiontimeout="#CreateTimeSpan(0,4,0,0)#" 
	applicationtimeout="#CreateTimeSpan(0,4,0,0)#"
	setdomaincookies="no">
	
	<cfset #maintenance_message# = "">
	<cfset #abort_site# = "">
	<cfset #ups_rates# = "on">
	<cfset #customer_service_start# = 8>
	<cfset #customer_service_end# = 17>
	<cfset #cutoff_time# = 15>
	
	<cfif NOT #IsDefined("cookie.session_id")#>
		<cfset #session.sid# = #createUUID()#>
		<cfcookie name="session_id" value="#session.sid#">	
	</cfif>
	
	<cfset #session.site_id# = #site_id#>
	
	<cfif structKeyExists(url, "reset_cache")>
		<CFOBJECTcache ACTION="CLEAR" />
		<cfscript>
			pagePoolClear();
			componentCacheClear();
			ctCacheClear();
		</cfscript>
	</cfif>
	
	<cfparam name="query_cache" default="#CreateTimeSpan(0,6,0,0)#">
	<cfparam name="query_cache_short" default="#CreateTimeSpan(0,0,30,0)#">
	<cfparam name="query_cache_long" default="#CreateTimeSpan(1,0,0,0)#">
	
	<cfinclude template="/fatbraintoys/fbt_udfs.cfm">
	
	<cfif server_type IS 'railo'>
		<cfparam name="is_mobile" default="no">
		<cfparam name="AMAZON_CO" default="no">
		<!--- NO ERROR TEMPLATE REQUIRED --->
	<cfelseif operating_context IS 'dev'>
		<!--- NO ERROR TEMPLATE REQUIRED --->
	<cfelse>
		<cfparam name="is_mobile" default="no">
		<cferror type="REQUEST" template="/templates/error.cfm" mailto="webmaster@fatbraintoys.com">
	</cfif>
	
</cfif>
	
</CFSILENT>
