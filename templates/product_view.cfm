<cfif IsDefined("product_sku")>
	<cfset #sku# = #product_sku#>
</cfif>

<cfinclude template="/fatbraintoys/wholesale/product_catalog/product_page.cfm">
