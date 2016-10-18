<!---<cftry><cfset #sid# = #createUUID()#><cfquery name="log_session" datasource="#datasource#" dbtype="#dbtype#">insert into session_log(date_created,session_id,network_id,tracking_id,keyword_id,aid,pid,last_visit,referring_site,cfid,cftoken,hit_count,target,ip_address,site_id)
values(#now()#,'#sid#','','','','','',#client.lastvisit#,'GlobalNetWatch',#client.cfid#,#client.cftoken#,#client.hitcount#,'#cgi.SCRIPT_NAME#','#cgi.REMOTE_ADDR#',1)</cfquery><cfcatch type="Database">Dead!<cfabort></cfcatch></cftry>Alive!--->
<cftry>
<!--- 	<cfquery datasource="#datasource#" dbtype="#dbtype#">
	select now() from skus limit 0,1
	</cfquery> --->

	Alive!
<cfcatch type="Any">
</cfcatch>
</cftry>