<cfset #title# = "Wholesale Books - Fat Brain Toy Co.">
<cfset #keyword# = "wholesale books toy distributor Dado Cubes, The Learning Calendar">
<cfset #description# = " Fat Brain Toy Co. is a retailer, distributor, and developer of educational books, games, and gifts. We sell ONLY quality, non-violent books that challenge a child's imaginaton.">
<cfset #hidden_1# = "<H1> Fat Brain Toy Co. is a retailer, distributor, and developer of educational books, games, and gifts. We sell ONLY quality, non-violent books that challenge a child's imaginaton.</H1>">
<cfset #alt_1# = " Fat Brain Toy Co. is a retailer, distributor, and developer of educational books, games, and gifts. We sell ONLY quality, non-violent books that challenge a child's imaginaton.">
<cfset #alt_2# = "wholesale books">
<cfset #hidden_2# = "Wholesale Books, Dado Cubes, The Learning Calendar, Fat Brain Toy Co.">

<cfinclude template="/fatbraintoys/wholesale/templates/header.cfm">

<cfquery name="select_skus" datasource="#datasource#" dbtype="#dbtype#">
select product_sku, product_name, prod_page, left(product_sku,5) as parent_sku
from wholesale_skus
where product_status != 'inactive'
and categories LIKE '%books%'
group by parent_sku
order by product_name
</cfquery>

<H1>Books</H1>

<cfinclude template="/fatbraintoys/wholesale/templates/category_view.cfm">

<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">

