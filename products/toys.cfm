<cfset #title# = "Wholesale Toys - Fat Brain Toy Co.">
<cfset #keyword# = "wholesale toys toy distributor Dado Cubes, The Learning Calendar">
<cfset #description# = " Fat Brain Toy Co. is a retailer, distributor, and developer of educational toys, games, and gifts. We sell ONLY quality, non-violent toys that challenge a child's imaginaton.">
<cfset #hidden_1# = "<H1> Fat Brain Toy Co. is a retailer, distributor, and developer of educational toys, games, and gifts. We sell ONLY quality, non-violent toys that challenge a child's imaginaton.</H1>">
<cfset #alt_1# = " Fat Brain Toy Co. is a retailer, distributor, and developer of educational toys, games, and gifts. We sell ONLY quality, non-violent toys that challenge a child's imaginaton.">
<cfset #alt_2# = "wholesale toys">
<cfset #hidden_2# = "Wholesale Toys, Dado Cubes, The Learning Calendar, Fat Brain Toy Co.">

<cfinclude template="/fatbraintoys/wholesale/templates/header.cfm">

<cfquery name="select_skus" datasource="#datasource#" dbtype="#dbtype#">
select product_sku, product_name, prod_page, left(product_sku,5) as parent_sku
from wholesale_skus
where product_status != 'inactive'
and categories LIKE '%toys%'
group by parent_sku
order by product_name
</cfquery>

<H1>Toys</H1>

<cfinclude template="/fatbraintoys/wholesale/templates/category_view.cfm">

<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">

