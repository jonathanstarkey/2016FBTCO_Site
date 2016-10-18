<cfparam name="sku" default="FA088">

<cfquery name="select_skus" datasource="#datasource#" dbtype="#dbtype#">
select product_sku, product_name, prod_page, left(product_sku,5) as parent_sku, upc_code, description, retail_price, product_status, country_of_origin, product_weight, product_length, product_width, product_height, case_pack_quantity, case_pack_weight, case_pack_length, case_pack_width, case_pack_height, youtube_id
from wholesale_skus
where product_sku LIKE '#sku#%'
limit 0,1
</cfquery>

<cfquery name="get_fbt" datasource="#datasource#" dbtype="#dbtype#">
select prod_page
from sku_parents
where sku = '#select_skus.parent_sku#'
</cfquery>

<!DOCTYPE html>
<html lang="en">


    <link rel="stylesheet" href="/css/flexslider.css" type="text/css" media="screen">


</head>

<body>
<!-- Wrap all page content here -->
<div id="wrap">
     
<cfinclude template="/fatbraintoys/wholesale/templates/secondary_header.cfm">

<cfoutput query="select_skus">

	<!-- SECONDARY HERO -->
		<section class="secondary-header-2" id="">
			<div class="container-fluid parallax-container">
				<div class="row">
					<div class="parallax-window" data-parallax="scroll" data-image-src="/img/prod_header.jpg">
						<div class="col-lg-8 col-lg-offset-2 text-right">          
						<h2 class="secondary-header-title-3">#product_name#</h2>
					</div>
					</div>
				</div>
			</div>
		</section>
	
	<!-- /SECONDARY HERO -->  
	
	<!-- Page Content -->
		<!--  MEET US -->
		<div class="content-section-a">
			<div class="container meet-fat-brain-container">
				<div class="row">
<!--                    <h2 class="section-heading about-us-heading">#product_name#</h2> -->
                    <!--  PRODUCT IMAGE SLIDER -->
						<div class="col-md-5">	
							<div class="flexslider">
							  <ul class="slides">

							  	<li data-thumb="//www.fatbraintoys.com/images/products/med4/#parent_sku#.jpg">
									<div class="thumb-image"> <img src="//www.fatbraintoys.com/images/products/large/#parent_sku#.jpg" data-imagezoom="true" class="img-responsive"> </div>									
								</li>
							  
								<cfif directoryexists('#root_path#\fatbraintoys\images\products\detail\#parent_sku#') IS 'yes'>

									<cfdirectory action="list" directory="#root_path#\fatbraintoys\images\products\detail\#parent_sku#" name="extra_images" filter="*.jpg|*.gif">

									<cfif #extra_images.recordcount# GT 0>

										<cfloop query="extra_images" startrow="1" endrow="4">
											<cfif (findnocase("conflict", name) eq 0) AND (#left(name,1)# IS NOT '.')>
												<li data-thumb="//www.fatbraintoys.com/images/products/detail/#parent_sku#/#lcase(name)#">
													<div class="thumb-image"> <img src="//www.fatbraintoys.com/images/products/detail/#parent_sku#/#lcase(name)#" data-imagezoom="true" class="img-responsive"> </div>									
												</li>
											</cfif>
										</cfloop>

									</cfif>

								</cfif>							  
								
							  </ul>
							<div class="clearfix"></div>
						</div>	
						</div>
						<!--  /PRODUCT IMAGE SLIDER -->
                    <!--  DESCRIPTION -->
					<div class="col-lg-6 col-md-6 col-md-offset-1 col-lg-offset-1 col-sm-10">
						
						
                    <div class="text-container">
                        
                        <div class="text-content short-text">
                            <h2 class="section-heading descripton-head">#product_name#</h2>
                            <p class="description-container">
						#description#
						</p>
                        </div>
                        <div class="show-more">
                            <a href="##">Show more</a>
                        </div>
                        </div>              
                        
                        <div class="col-lg-5 col-sm-6">
						 <a href="##where-to-buy" type="button" class="center-block press-kit-button btn btn-round-lg btn-lg" id="wtb-button">Where to Buy? </a>
                        						
					</div>
                        
					</div>
				</div>
			</div>
			<!-- /.container -->
		</div>

	<!--  /DESCRIPTION -->
 
	<!--  VIDEO SECTION -->
		<div class="content-section-a specs-background-color">
		
			   <div class="container product-section-container">
				<div class="row">
                        
                    <!--  VIDEO SECTION  -->
                        <div class="col-md-5">
                            <div class="row">
                                <h2 class="section-heading descripton-head">Video</h2>
                                <cfif #youtube_id# IS NOT ''>
									<!-- 16:9 aspect ratio -->
									<div class="embed-responsive embed-responsive-16by9" style="margin-bottom: 40px;">
									<iframe class="embed-responsive-item" src="//www.youtube.com/embed/#youtube_id#?rel=0&showinfo=0&autohide=1&contols=0"></iframe>
									</div>
								</cfif>
                            </div>
                        </div>
                        <!--  /VIDEO SECTION  -->
                    
						<!--  PRODUCT SPECS SECTION  -->
						<div class="col-md-6 col-md-offset-1 specs-wrapper" >
							 <div class="row">
							<div class="col-md-8 col-md-offset-1">
								<div class="table-responsive">

									<table class="table table-condensed borderless">
										<thead>
											<tr>
												<th> Specifications</th>
											</tr>
										</thead>
										<tbody>
										<tr>
											<td> Item ##:</td>
											<td> #product_sku#</td>
										</tr>
										<tr>
											<td> UPC:</td>
											<td> #upc_code#</td>
										</tr>
										<tr>
											<td> Suggested Retail:</td>
											<td> #dollarformat(retail_price)#</td>
										</tr>
										<tr>
											<td> Current Status:</td>
											<td> #product_status#</td>
										</tr>
										<tr>
											<td> Country of Origin:</td>
											<td> #country_of_origin#</td>
										</tr>
										 <tr>
											<td> Item Weight:</td>
											<td> #product_weight# lbs.</td>
										</tr>
										<tr>
											<td> Item Dimensions:</td>
											<td> #product_length#" x #product_width#" x #product_height#"</td>
										</tr>
										<tr>
											<td> Case Pack Qty:</td>
											<td> #case_pack_quantity#</td>
										</tr>
										<tr>
											<td> Case Weight:</td>
											<td> #case_pack_weight# lbs.</td>
										</tr>
										<tr>
											<td> Case Dimensions:</td>
											<td> #case_pack_length#" x #case_pack_width#" x #case_pack_height#"</td>
										</tr>
										</tbody>
									</table>
								</div>
								 </div>
							</div>
								<!--  /PRODUCT SPECS SECTION  -->
							</div>
						</div>
						
						</div>
				

		</div>
	<!--  /PRODUCT SECTION -->
	
	<!-- DOWNLOADABLE CONTENT -->
		<section class="downloadable-content-section content-section-a" id="">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<h2 class="downloadable-content-header">Downloadable Content</h2>
					</div>
					<div class="col-md-4 downloadable-content-wrapper">
						<div class="downloadable-content-spacer">
						
						<h2 class="downloadable-content-label">Image Downloads</h2>
						<a href="/media/product_images.cfm" class="downloable-content-link"><span class="fa fa-file-jpg-o">&nbsp;&nbsp;</span>View available downloads</a>
						
						<cfif directoryexists('#root_path#\fatbraintoys\wholesale\downloads\products\#parent_sku#\materials') IS 'yes'>
							
							<cfdirectory action="list" directory="#root_path#\fatbraintoys\wholesale\downloads\products\#parent_sku#\materials" name="images" filter="*.jpg|*.gif|*.pdf|*.png">
							<cfif #images.recordcount# GT 0>
								<h2 class="downloadable-content-label">Literature</h2>
								<cfloop query="images">
									<a href="/downloads/products/#parent_sku#/materials/#name#" class="downloable-content-link"><span class="fa fa-file-pdf-o">&nbsp;&nbsp;</span>#name#</a>
								</cfloop>
							</cfif>
				
						</cfif>
			
						<cfif fileexists('#root_path#\fatbraintoys\wholesale\docs\cert_of_conformity\#parent_sku#.pdf')>
				
							<h2 class="downloadable-content-label">CPSIA Certificate of Conformity:</h2>
							<a href="/docs/cert_of_conformity/#lcase(parent_sku)#.pdf" class="downloable-content-link"><span class="fa fa-file-pdf-o">&nbsp;&nbsp;</span>CPSIA Certificate of Conformity</a>
				
						</cfif>

						</div>
					<div>

					</div>
				</div>
			</div>
		</section>
	<!-- /DOWNLOADABLE CONTENT -->
	
	<!--  PRODUCT TAB SECTION -->
	
	<cfquery name="get_orders" datasource="#datasource#" dbtype="#dbtype#" CACHEDWITHIN="#query_cache#">
	select count(distinct wc.wholesale_location_id) as store_counter, ws.product_name, wc.wholesale_location_id, wc.location_name, wc.address, wc.address_2, wc.city, wc.state, wc.phone, wc.website, wc.zip, wc.geo_lat, wc.geo_long, z.latitude, z.longitude
	from wholesale_customer_locations wc, wholesale_orders wo, zip_info z, wholesale_items wi, wholesale_skus ws
	where wc.customer_number = wo.customer_number
	and wo.order_number = wi.order_number
	and wi.sku = ws.product_sku
	and wc.zip = z.zip
	and wc.status = 'active'
	and wo.status = 'approved'
	and wo.date_created > #dateadd('m',-12,now())#
	and wi.sku LIKE '#sku#%'
	and ws.product_status != 'inactive'
	group by wc.wholesale_location_id
	order by wc.state, wc.city
	limit 0,50
	</cfquery>
	
	<cfquery name="get_international" datasource="#datasource#" dbtype="#dbtype#">
	select wcc.company_name, wcc.contact_phone, wcc.contact_email, wcc.bill_country, wcc.website
	from wholesale_orders wo, wholesale_items wi, wholesale_skus ws, wholesale_customers wcc
	where wcc.customer_number = wo.customer_number
	and wo.order_number = wi.order_number
	and wi.sku = ws.product_sku
	and wo.status = 'approved'
	and wo.date_created > '2015-10-12'
	and ws.product_status != 'inactive'
	and wcc.reseller_type = 'distributor'
	group by wo.customer_number
	limit 0,100
	</cfquery>
	
	<div id="where-to-buy" class="content-section-a where-to-buy-section">
		<div class="container">
			<div class="row">
				<div>

				  <!-- Nav tabs -->
				  <ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="##online" aria-controls="home" role="tab" data-toggle="tab">Buy Online</a></li>
					<li role="presentation"><a href="##stores" aria-controls="profile" role="tab" data-toggle="tab">Find A Store</a></li>
					<li role="presentation"><a href="##wholesale" aria-controls="messages" role="tab" data-toggle="tab">Purchase Wholesale</a></li>
					<li role="presentation"><a href="##international" aria-controls="messages" role="tab" data-toggle="tab">International</a></li>
				  </ul>

				<div class="tab-content">
				  
				  <div role="tabpanel" class="tab-pane active" id="online">
				  
					<br>
					<div align="center">
					<a href="https://www.fatbraintoys.com#get_fbt.prod_page#?tid=fbtco" target="_new"><img  class="img-responsive" border="0" alt="Fat Brain Toys" src="../img/fatbraintoys_logo.png"></a>
					<br><br>
					<div class="borderless" style="font-size:21px;">All Fat Brain Toy Co. products are available for purchasing at our online store, <a href="https://www.fatbraintoys.com#get_fbt.prod_page#?tid=fbtco" target="_new">www.FatBrainToys.com</a></div>
					
					</div>
					
				  </div>
				  
				  <div role="tabpanel" class="tab-pane" id="stores">
					  
					  Coming soon!
					  
					<!---  
					<cfloop query="get_orders">
						
						#location_name# #address# #address_2# #city# #state# #phone# #website# #zip# #geo_lat# #geo_long# #latitude# #longitude#<br>

					</cfloop>  
					 ---> 
				  
					<div class="col-md-8 col-md-offset-2">
						<div class="row">
						<!--- <cfinclude template="/fatbraintoys/map.cfm"> --->
						<!--- <iframe  
							  style="margin-top: 20px; border-style: none;" 
							  src="../map.cfm?sku=#parent_sku#" 
							  width="100%" 
							  height="400" >
						</iframe> --->	
						
						</div>
					</div>
				  
				  </div>
				  
				  <div role="tabpanel" class="tab-pane" id="wholesale">

					<div class="content-section-a">
						<div id="feedback">
							<div class="container">
								<div class="col-md-5">
									<h2 class="contact-lable">Wholesale Purchasing Options</h2>
									<div class="form-area">
							             <ul style="list-style-type: square;">
                                            <div style="font-size:18px;">
                                            <li><a href="./downloads/2016ToyCoCatalog.pdf">Download Digital Catalog</a></li>
                                            <li><a href="##" data-toggle="modal" data-target="##myModal-whole-cat-request">Request Wholesale Catalog & Pricing by Mail</a></li>
                                            <li><a href="##" data-toggle="modal" data-target="##myModal-rep-groups">Purchase Through Our Rep Groups</a></li>
                                            <li><a href="../app.cfm">Register Online for New Wholesale Account</a></li>
                                            </div>
							             </ul>
									</div>
								</div>
								<div class="col-md-6 contact-info">
									<div class="col-md-4 col-sm-2"><img src="/img/brain.png" style="width:140px; height: auto;" class=""></div>
									<div class="col-md-8 col-sm-12">
										<h2 class="contact-lable">Contact Us</h2>
										<br>
										<p class="contact-address"><b>Fat Brain Toy Co.</b>
											<br>Toll Free Number: 1-800-335-5621
											<br>International Phone: 1-402-779-3181
											<br>Fax: 402-779-3253
											<br>E-Mail: <a href="mailto:sales@fatbraintoyco.com">sales@fatbraintoyco.com</a>
										</p>
									</div>
								</div>
							</div>
							<!-- /EXPLORE MORE -->

						</div>
						<!--/container-->

					</div>
					<!--/wrap-->
				  
				  </div>
					<!-- Tab panes -->
			  
				  <div role="tabpanel" class="tab-content tab-pane" id="international">
					
					<br>
					<div class="borderless">
					
					<div style="font-size:21px;font-weight: 600;">
					Contact our distributors for purchasing in the following countries:
					</div>
					
					<table id="internalActivities" class="table ">
						<thead class="tab-table-head">
						  <tr>
							<th>Country</th>
							<th>Distributor Name</th>
							<th>Email</th>
							<th>Phone</th>
<!--									<th>Website</th>-->
						  </tr>
						</thead>
						<tbody class="tab-table-body ">
							<cfloop query="get_international">
							<cf_country_convert country_abbreviation="#bill_country#">
							<tr class="tab-table-row">
								<td class="tab-table-cell" valign="middle" data-header-title="Country">#country_text#</td>
								<td class="tab-table-cell" valign="middle" data-header-title="Co. Name">#company_name#</td>
								<td class="tab-table-cell" valign="middle" data-header-title="Co. Email">#contact_email#</td>
								<td class="tab-table-cell" valign="middle" data-header-title="Co. Phone">#contact_phone#</td>
<!--										<td class="tab-table-cell tab-table-last" valign="middle" data-header-title="Co. Website"><a href="#website#">#website#</a></td>-->
							</tr>
							
							</cfloop>
						</tbody>
					</table>
				  
				  </div>
				  
				</div>
				  <!-- Tab panes -->
				  </div>

				</div>
			</div>
		 </div>
	</div>
		
<!--  PRODUCT TAB SECTION -->
	
</cfoutput> 
 
<!--  BOTTOM SLIDER -->

<cfquery name="select_other_skus" datasource="#datasource#" dbtype="#dbtype#">
select product_sku, product_name, prod_page, left(product_sku,5) as parent_sku
from wholesale_skus
where product_status != 'inactive'
and product_sku != '#select_skus.product_sku#'
and product_sku NOT IN ('fa077-1','fa090-1','fa100-1')
and inventory_count > 0
group by parent_sku
order by rand()
limit 0,10
</cfquery>

 <div class="content-section-a slider-section">
	 <div class="container-fluid header-wrap">
		 <div class="row">
		 
				<h2 class="col-md-12 bottom-slider-header text-center">Explore More Toys & Games</h2>
		
			 <div class="clearfix"> </div>
			<div class="container">
				<div class="row">
					<ul id="flexiselDemo1">
						<cfoutput query="select_other_skus">
							<li><a href="/product_catalog/product_page.cfm?sku=#parent_sku#" class=""><img src="/images/products/#parent_sku#/button.jpg" /></a><div class="grid-flex"><a href="/product_catalog/product_page.cfm?sku=#parent_sku#" class="">#product_name#</a></div></li>
						</cfoutput>								
					  </ul>
					</div>
			 </div>
		</div>
	<div>
</div>

<!--  /BOTTOM SLIDER -->

</div><!--/container-->

</div><!--/wrap-->

<!--  DIVIDER  -->
	<div class="container">
		<hr>
	</div>

<!--  /DIVIDER  -->
	
<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">

<!-- Include all compiled plugins (below), or include individual files as needed -->
<!--<script type="text/javascript" src="/js/main.js"></script>-->
    
<script type="text/javascript">
    
    $(".show-more a").each(function() {
    var $link = $(this);
    var $content = $link.parent().prev("div.text-content");

    console.log($link);

    var visibleHeight = $content[0].clientHeight;
    var actualHide = $content[0].scrollHeight - 1;

    console.log(actualHide);
    console.log(visibleHeight);

    if (actualHide > visibleHeight) {
        $link.show();
    } else {
        $link.hide();
    }
});

$(".show-more a").on("click", function() {
    var $link = $(this);
    var $content = $link.parent().prev("div.text-content");
    var linkText = $link.text();

    $content.toggleClass("short-text, full-text");

    $link.text(getShowLinkText(linkText));

    return false;
});

function getShowLinkText(currentText) {
    var newText = '';

    if (currentText.toUpperCase() === "SHOW MORE") {
        newText = "Show less";
    } else {
        newText = "Show more";
    }

    return newText;
}
    
    
</script>

<cfif isdefined('url.wtb')>
	 <script type="text/javascript">
	 	document.getElementById('wtb-button').click();
	 </script>
 </cfif>
</body>

</html>