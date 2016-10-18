<cfparam name="sku" default="FA088">

<cfquery name="select_skus" datasource="#datasource#" dbtype="#dbtype#">
select product_sku, product_name, prod_page, left(product_sku,5) as parent_sku, upc_code, description, retail_price, product_status, country_of_origin, product_weight, product_length, product_width, product_height, case_pack_quantity, case_pack_weight, case_pack_length, case_pack_width, case_pack_height
from wholesale_skus
where product_sku LIKE '#sku#%'
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

							  	<li data-thumb="/images/products/#parent_sku#/button.jpg">
									<div class="thumb-image"> <img src="/images/products/#parent_sku#/button.jpg" data-imagezoom="true" class="img-responsive"> </div>									
								</li>
							  
								<cfif directoryexists('#root_path#\fatbraintoys\images\products\detail\#parent_sku#') IS 'yes'>

									<cfdirectory action="list" directory="#root_path#\fatbraintoys\images\products\detail\#parent_sku#" name="extra_images" filter="*.jpg|*.gif">

									<cfif #extra_images.recordcount# GT 0>

										<cfloop query="extra_images" startrow="1" endrow="4">
											<cfif (findnocase("conflict", name) eq 0) AND (#left(name,1)# IS NOT '.')>
												<li data-thumb="/images/products/detail/#parent_sku#/#lcase(name)#">
													<div class="thumb-image"> <img src="/images/products/detail/#parent_sku#/#lcase(name)#" data-imagezoom="true" class="img-responsive"> </div>									
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
                    
					<div class="col-lg-6 col-lg-offset-1 col-sm-6">
						
						
                    <div class="text-container">
                        
                        <div class="text-content short-text">
                            <h2 class="section-heading descripton-head">Description</h2>
                            <p>
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

	<!--  /MEET PRODUCT -->
 
	<!--  PRODUCT SECTION -->
		<div class="content-section-a specs-background-color">
		
			   <div class="container product-section-container">
				<div class="row">
				
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
						
						<cfif fileexists('#root_path#\fatbraintoys\wholesale\downloads\sales_sheets\#parent_sku#.pdf')>
				
							<h2 class="downloadable-content-label">Sell Sheet</h2>
							<a href="/wholesale/downloads/sales_sheets/#parent_sku#.pdf" class="downloable-content-link"><span class="fa fa-file-pdf-o">&nbsp;&nbsp;</span>#parent_sku#.pdf</a>
				
						</cfif>
			
						<cfif fileexists('#root_path#\fatbraintoys\wholesale\docs\cert_of_conformity\#parent_sku#.pdf')>
				
							<h2 class="downloadable-content-label">Other Downloadables:</h2>
							<a href="/wholesale/docs/cert_of_conformity/#lcase(parent_sku)#.pdf" class="downloable-content-link"><span class="fa fa-file-pdf-o">&nbsp;&nbsp;</span>CPSIA Certificate of Conformity</a>
				
						</cfif>

						</div>
					<div>

					</div>
				</div>
			</div>
		</section>
	<!-- /DOWNLOADABLE CONTENT -->
	
	<!--  PRODUCT TAB SECTION -->
	
	
	
	
	<cfquery name="get_retailers" datasource="#datasource#" dbtype="#dbtype#">
	select count(distinct wc.wholesale_location_id) as store_counter, ws.product_name, wc.wholesale_location_id, wc.location_name, wc.address, wc.address_2, wc.city, wc.state, wc.phone, wc.website, wc.zip, wc.geo_lat, wc.geo_long, z.latitude, z.longitude
	from wholesale_customer_locations wc, wholesale_orders wo, zip_info z, wholesale_items wi, wholesale_skus ws
	where wc.customer_number = wo.customer_number
	and wo.order_number = wi.order_number
	and wi.sku = ws.product_sku
	and wc.zip = z.zip
	and wc.status = 'active'
	and wo.status = 'approved'
	and wo.date_created > #dateadd('m',-6,now())#
	and wi.sku = '#url.sku#'
	and ws.product_status != 'inactive'
	group by wc.wholesale_location_id, wi.sku
	order by wc.state, wc.city, wc.date_created, ws.product_name
	</cfquery>
	
	<cfquery name="get_online" datasource="#datasource#" dbtype="#dbtype#">
	select wcc.company_name, sum(wo.product_total) as total_purchase, ws.product_name, wcc.website
	from wholesale_orders wo, wholesale_items wi, wholesale_skus ws, wholesale_customers wcc
	where wcc.customer_number = wo.customer_number
	and wo.order_number = wi.order_number
	and wi.sku = ws.product_sku
	and wo.status = 'approved'
	and wcc.customer_number != 7277209
	and wcc.customer_number != 714208
	and wcc.website > ''
	and wo.date_created > #dateadd('m',-6,now())#
	and wi.sku = '#url.sku#'
	and ws.product_status != 'inactive'
	group by wcc.website, wi.sku
	order by total_purchase desc
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
						  	<!--- 
							<li role="presentation" class="active"><a href="##where-to-buy" aria-controls="home" role="tab" data-toggle="tab">Where to Buy?</a></li>
							<li role="presentation"><a href="##online" aria-controls="profile" role="tab" data-toggle="tab">Online</a></li>
							<li role="presentation"><a href="##stores" aria-controls="messages" role="tab" data-toggle="tab">Stores</a></li>
							--->
							<li role="presentation" class="active"><a href="##online" aria-controls="home" role="tab" data-toggle="tab">Buy Online</a></li>
							<li role="presentation"><a href="##stores" aria-controls="profile" role="tab" data-toggle="tab">Find A Store</a></li>
							<li role="presentation"><a href="##wholesale" aria-controls="messages" role="tab" data-toggle="tab">Purchase Wholesale</a></li>
							<li role="presentation"><a href="##international" aria-controls="messages" role="tab" data-toggle="tab">International</a></li>
						  </ul>
						  
						<div class="tab-content">
						  
						  <div role="tabpanel" class="tab-pane active" id="online">
						  
						  	<br>
						  	<div align="center">
						  	<a href="https://www.fatbraintoys.com#get_fbt.prod_page#?tid=fbtco" target="_new"><img width="547" height="103" border="0" alt="Fat Brain Toys" src="../img/fatbraintoys_logo.png"></a>
						  	<br><br>
						  	<div class="borderless" style="font-size:21px;">All Fat Brain Toy Co. products are available for purchasing at our online store, <a href="https://www.fatbraintoys.com#get_fbt.prod_page#?tid=fbtco" target="_new">www.FatBrainToys.com</a></div>
						  	
						  	</div>
						  	
						  </div>
						  
						  <div role="tabpanel" class="tab-pane" id="stores">
						  
						  	<div class="container">
								<iframe 
									  style="margin-top: 20px; border-style: none;" 
									  src="../map.cfm?sku=#parent_sku#" 
									  width="100%" 
									  height="650" >
								</iframe>
							</div>
						  
						  </div>
						  
						  <div role="tabpanel" class="tab-pane" id="wholesale">

							<div class="content-section-a">
								<div id="feedback">
									<div class="container">
										<div class="col-md-5">
											<h2 class="contact-lable">Wholesale Purchasing Options</h2>
											<div class="form-area">
									
												<div style="font-size:18px;">
												<li><a href="../docs/2016ToyCoCatalog.pdf">Download Digital Catalog</a></li>
												<li><a href="../send_packet.cfm">Request Wholesale Catalog & Pricing by Mail</a></li>
												<li><a href="../purchase/rep_groups.cfm">Purchase Through Our Rep Groups</a></li>
												<li><a href="../app.cfm">Register Online for New Wholesale Account</a></li>
												</div>
									
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
									<!--feedback-->
									<!-- /EXPLORE MORE -->

								</div>
								<!--/container-->

							</div>
							<!--/wrap-->
						  
						  </div>
						  
						  <div role="tabpanel" class="tab-pane" id="international">
						  	
						  	<br>
						  	<div class="borderless">
						  	
						  	<div style="font-size:21px;font-weight: 600;">
						  	Contact our distributors for purchasing in the following countries:
						  	</div>
						  	
							<table id="internalActivities" class="table table-striped">
								<thead>
								  <tr>
								  	<th>Country</th>
									<th>Distributor Name</th>
									<th>Email</th>
									<th>Phone</th>
									<th>Website</th>
								  </tr>
								</thead>
								<tbody>
									<cfloop query="get_international">
									<cf_country_convert country_abbreviation="#bill_country#">
									<tr>
										<td>#country_text#</td>
										<td>#company_name#</td>
										<td>#contact_email#</td>
										<td>#contact_phone#</td>
										<td><a href="#website#">#website#</a></td>
									</tr>
									</cfloop>
								</tbody>
							</table>
						  
						  </div>
						  
						</div>

						  <!-- Tab panes -->
						  <!---
						  <div class="tab-content">
						  
							<div role="tabpanel" class="tab-pane active" id="where-to-buy">
							
								<div class="container">
									<iframe 
										  style="margin-top: 20px; border-style: none;" 
										  src="/img/map/index.html" 
										  width="100%" 
										  height="650" >
									</iframe>
								</div>
								
							</div>
							
							<div role="tabpanel" class="tab-pane" id="online">
							
								<h2>Consumer Purchasing</h2>
							
								<table id="internalActivities" class="table table-striped">
									<thead>
									  <tr>
										<th>Retailer</th>
										<th>Link</th>
									  </tr>
									</thead>
									<tbody>
										<tr><td>Fat Brain Toys </td><td><a>http://www.fatbraintoys.com</td></tr>
										<tr><td>Marbles - The Brain Store </td><td><a>http://www.marblesthebrainstore.com</td></tr>
										<tr><td>LAP-Lavorazione Articoli Plastici </td><td><a>http://www.lap-biella.com</td></tr>
										<tr><td>School Specialty Inc. </td><td><a>http://craig.hamm@schoolspecialty.com</td></tr>
										<tr><td>North Woods General Store </td><td><a>http://www.northwoodsgs.com</td></tr>
										<tr><td>Kaplan Early Learning Company </td><td><a>http://www.kaplanco.com/</td></tr>
										<tr><td>Becker's School Supplies </td><td><a>http://www.shopbecker.com</td></tr>
										<tr><td>Beyond Play </td><td><a>http://www.beyondplay.com</td></tr>
										<tr><td>The Craft Shop of NY Inc. </td><td><a>http://www.thecraftshoponline.com</td></tr>
										<tr><td>Tout About Toys </td><td><a>http://www.toutabouttoys.com</td></tr>
										<tr><td>Clothes Pony/Dandelion Toys </td><td><a>http://www.clothespony.com</td></tr>
										<tr><td>Logical Toys Limited </td><td><a>http://www.logicaltoys.com</td></tr>
										<tr><td>Magic Beans </td><td><a>http://www.mbeans.com</td></tr>
										<tr><td>Timberdoodle Co </td><td><a>http://www.timberdoodle.com</td></tr>
										<tr><td>Poopsie's - Galena </td><td><a>http://www.poopsies.com</td></tr>
										<tr><td>The Learning Shop </td><td><a>http://www.learningshop.com</td></tr>
										<tr><td>Momo's Tree House </td><td><a>http://momostreehouse.com</td></tr>
										<tr><td>Timbuk Toys, Inc. </td><td><a>http://www.timbuktoys.com</td></tr>
										<tr><td>Building Blocks Toy Store - Chicago </td><td><a>http://www.buildingblockstoys.com/</td></tr>
										<tr><td>Mackinaw Kite Co. </td><td><a>http://www.mackite.com</td></tr>
										<tr><td>world of mirth </td><td><a>http://www.worldofmirth.com</td></tr>
										<tr><td>Limolin LLC </td><td><a>http://www.limolin.com</td></tr>
										<tr><td>Adventure Science Center </td><td><a>http://www.adventuresci.org</td></tr>
										<tr><td>Dancing Bear Toys and Gifts </td><td><a>http://www.dbeartoys.com</td></tr>
										<tr><td>Teach Your Children </td><td><a>http://www.teachyourchildren.net</td></tr>
										<tr><td>Reynolds </td><td><a>http://reynoldstx.com</td></tr>
										<tr><td>Hall of Toys </td><td><a>http://www.halloftoys.com</td></tr>
										<tr><td>Strong National Museum of Play </td><td><a>http://museumofplay.org</td></tr>
										<tr><td>Toys Forever Models & Hobbies, Inc. </td><td><a>http://www.toysforeverhobbies.com</td></tr>
										<tr><td>The Teachers' Lounge </td><td><a>http://www.theteacherslounge.com</td></tr>
										<tr><td>Kiddly Winks </td><td><a>http://www.kiddlywinks.com</td></tr>
										<tr><td>Mom and Pop Place </td><td><a>http://www.momandpopplace.com</td></tr>
										<tr><td>Hobby House Toys </td><td><a>http://www.hobbyhousetoys.com</td></tr>
										<tr><td>Achievement Products for Children </td><td><a>http://www.achievement-products.com</td></tr>
										<tr><td>Rainbow Resource Center </td><td><a>http://www.rainbowresource.com</td></tr>
										<tr><td>Five Little Monkeys - CA </td><td><a>http://www.5littlemonkeys.com</td></tr>
										<tr><td>J Paul Getty Museum </td><td><a>http://www.getty.edu</td></tr>
										<tr><td>Nature's Nook Children's Boutique </td><td><a>http://www.naturesnookchildrensboutique.com</td></tr>
										<tr><td>A2Z Science & Learning Store </td><td><a>http://www.a-two-z.com</td></tr>
										<tr><td>Learning Express - Countryside ##334 </td><td><a>http://www.countryside.learningexpress-toys.com</td></tr>
										<tr><td>Galt Toys + Galt Baby </td><td><a>http://www.GaltBaby.com</td></tr>
										<tr><td>Learning Express Toys - Madison ##322 </td><td><a>http://www.learningexpress.com/store/madison</td></tr>
										<tr><td>Kidspace Children's Museum </td><td><a>http://www.kidspacemuseum.org</td></tr>
										<tr><td>Sensory Market </td><td><a>http://www.sensorymarket.com</td></tr>
										<tr><td>RG Natural Babies </td><td><a>http://rgnaturalbabies.com</td></tr>
										<tr><td>Learning Express - Mount Lebanon ##316 </td><td><a>http://www.mtlebanon.learningexpress-toys.com/</td></tr></td></tr>
										<tr><td>King Arthur's Court Toys </td><td><a>http://www.kingarthurstoys.com</td></tr></td></tr>
										<tr><td>Beyond the Blackboard </td><td><a>http://WWW.BEYONDTHEBLACKBOARD.COM</td></tr></td></tr>
										<tr><td>TFH USA LTD. </td><td><a>http://www.specialneedstoys.com</td></tr></td></tr>
										<tr><td>OH Baby </td><td><a>http://ohbebegear>com</td></tr></td></tr>
										<tr><td>Imagination Toys - St. Louis </td><td><a>http://polly@imagination-toys.com</td></tr></td></tr>
										<tr><td>Allison Wonderland </td><td><a>http://www.allisonwonderland.com</td></tr></td></tr>
										<tr><td>Explorations Toys </td><td><a>http://www.explorationstoys.com</td></tr></td></tr>
										<tr><td>Simply Good Stuff </td><td><a>http://www.simplygoodstuff.com</td></tr></td></tr>
										<tr><td>Gingerbread House </td><td><a>http://www.gingerbreadhousetoys.com</td></tr></td></tr>
										<tr><td>The Tutoring Toy </td><td><a>http://www.tutoringtoy.com</td></tr></td></tr>
										<tr><td>Nini & Loli </td><td><a>http://www.niniandloli.com</td></tr></td></tr>
										<tr><td>United Art and Education </td><td><a>http://www.unitednow.com</td></tr></td></tr>
										<tr><td>The Mass MoCA Store </td><td><a>http://massmoca.org</td></tr>
										<tr><td>Children's Discovery Museum </td><td><a>http://www.childrensdiscoverymuseum.net</td></tr>
										<tr><td>Teich Toys & Books </td><td><a>http://www.teichdesign.com</td></tr>
										<tr><td>S&S Group Inc. </td><td><a>http://www.formomstore.com</td></tr>
										<tr><td>Eureka Puzzles </td><td><a>http://www.eurekapuzzles.com</td></tr>
										<tr><td>Pufferbellies Toys and Books </td><td><a>http://www.pufferbelliestoys.com</td></tr>
										<tr><td>The Robot Garage </td><td><a>http://www.therobotgarage.com</td></tr>
										<tr><td>Mr. Fub's Party </td><td><a>http://www.mrfubstoys.com</td></tr>
										<tr><td>G. Willikers - Saratoga Springs </td><td><a>http://www.g.willikertoys.com</td></tr>
										<tr><td>Tweak </td><td><a>http://www.tweak99.com</td></tr>
										<tr><td>The Sensory Shop </td><td><a>http://www.thesensoryshop.com</td></tr>
										<tr><td>Joslyn Art Museum </td><td><a>http://www.joslyn.org</td></tr>
										<tr><td>The Little Seedling </td><td><a>http://thelittleseedling.com</td></tr>
										<tr><td>Cheek a de...Meek a de </td><td><a>http://www.cheekademeekade.com</td></tr>
										<tr><td>ACE Educational Supplies, Inc. </td><td><a>http://www.aceeducational.com</td></tr>
										<tr><td>The Toy Box - Amherst </td><td><a>http://amhersttoybox.com</td></tr>
										<tr><td>Hartville Collectibles </td><td><a>http://www.hartvillecollectibles.com</td></tr>
										<tr><td>The Chalkboard </td><td><a>http://www.thechalkboardcatalog.com</td></tr>
										<tr><td>Loudoun Learning </td><td><a>http://www.loudounlearning.com</td></tr>
										<tr><td>The Creative Co </td><td><a>http://www.creationsforsandpoint.org</td></tr>
										<tr><td>Shenanigans </td><td><a>http://www.shenaniganstoys.net</td></tr>
										<tr><td>The Green Alligator </td><td><a>http://www.thegreenalligator.com</td></tr>
										<tr><td>Green Hippo Gifts </td><td><a>http://www.greenhippogifts.com</td></tr>
										<tr><td>Toyworks </td><td><a>http://www.sonomatoyworks.com</td></tr>
										<tr><td>Learning Express - Palm Beach Gardens ##176 </td><td><a>http://www.palmbeachgardens.learningexpresstoys.com</td></tr>
										<tr><td>Sciencenter </td><td><a>http://www.sciencenter.org</td></tr>
										<tr><td>Pirates and Pixies </td><td><a>http://toysobx.com</td></tr>
										<tr><td>Li'l Baby Sprouts </td><td><a>http://www.lilbabysprouts.com</td></tr>
										<tr><td>This Little Piggy </td><td><a>http://www.thislittlepiggyboutique.com</td></tr>
										<tr><td>Toys on the Square </td><td><a>http://www.toysonthesquare.com</td></tr>
										<tr><td>The Friendly Fox </td><td><a>http://www.friendlyfoxco.com</td></tr>
										<tr><td>Eric Armin Inc. (EAI) </td><td><a>http://www.eaieducation.com/</td></tr>
										<tr><td>Charlotte West </td><td><a>http://www.charlottewestbaby.com</td></tr>
										<tr><td>Toy Zone - TX </td><td><a>http://www.toyzoneonline.com/</td></tr>
										<tr><td>Tot To Teen Village </td><td><a>http://tottotteenvillage.com</td></tr>
										<tr><td>Berg's Baby & Teen </td><td><a>http://www.bergsbaby.com</td></tr>
										<tr><td>Therapy Nook LLC </td><td><a>http://www.therapynookllc.com</td></tr>
										<tr><td>Wondertree Kids </td><td><a>http://www.wondertreekids.com</td></tr>
										<tr><td>Math N Stuff </td><td><a>http://www.mathnificent.com</td></tr>
										<tr><td>Adler Planetarium </td><td><a>http://www.adlerplanetarium.org</td></tr>
										<tr><td>Amazing Toys </td><td><a>http://www.amazingtoys.net</td></tr>
										<tr><td>Playmatters - Pepper Pike </td><td><a>http://www.playmatterstoys.com</td></tr>
										<tr><td>ETA hand2mind </td><td><a>http://www.hand2mind.com</td></tr>
										<tr><td>A Child's Kingdom </td><td><a>http://www.achildskingdom.com</td></tr>
										<tr><td>Learning Express - New Albany ##222 </td><td><a>http://columbus.learningexpresstoys.com</td></tr>
										<tr><td>Brilliant Sky Toys and Books - Charlotte </td><td><a>http://nbrislin@brilliantskytoys.com</td></tr>
										<tr><td>I Know Science </td><td><a>http://www.iknowscience.com</td></tr>
										<tr><td>Hearthside Books, Etc. </td><td><a>http://www.hearthsidebooks.com</td></tr>
										<tr><td>Dancing Bear - WI </td><td><a>http://www.dancingbearshop.com</td></tr>
										<tr><td>Kinder Haus Toys </td><td><a>http://www.kinderhaus.com</td></tr>
										<tr><td>The Old Mill Store </td><td><a>http://www.oldmillstore.com</td></tr>
										<tr><td>Columbus Area Visitors Center </td><td><a>http://www.columbus.in.us</td></tr>
										<tr><td>TEENY BEE BOUTIQUE </td><td><a>http://www.teenybeeboutique.com</td></tr>
										<tr><td>Baby Bloomers </td><td><a>http://www.babybloomershome.com</td></tr>
										<tr><td>Simplicity ABC </td><td><a>http://www.simplicityabc.com</td></tr>
										<tr><td>Growing Up </td><td><a>http://growingupstpete.com</td></tr>
										<tr><td>Amma Parenting Center </td><td><a>http://www.ammaparentingcenter.com</td></tr>
										<tr><td>Suite Child </td><td><a>http://www.suitechild.com</td></tr>
										<tr><td>Fairbanks Museum </td><td><a>http://faibanksmuseum.org</td></tr>
										<tr><td>Kid's Stuff Superstore </td><td><a>http://www.echildstore.com</td></tr>
										<tr><td>Children's Museum of South Dakota </td><td><a>http://www.prairieplay.org</td></tr>
										<tr><td>Happy Bambino </td><td><a>http://www.happybambino.com</td></tr>
										<tr><td>Clover </td><td><a>http://clovertoys.com</td></tr>
										<tr><td>The Sensory Kids Store </td><td><a>http://www.sensorykidstore.com</td></tr>
										<tr><td>The Lilypad Children's Boutique </td><td><a>http://www.shoplilypad.com/</td></tr>
										<tr><td>The Art Project </td><td><a>http://www.artprojectmemphis.com</td></tr>
										<tr><td>WeeBee Toys </td><td><a>http://weebeetoys.com</td></tr>
										<tr><td>Sweet Be's </td><td><a>http://Www.sweetbe.com</td></tr>
										<tr><td>MIBINA, SA </td><td><a>http://www.juguetesteach.com</td></tr>
										<tr><td>Rowe's Rock Cottage Shops dba Driftless Kids </td><td><a>http://www.driftlesskids.com</td></tr>
										<tr><td>Sand Castle Toys, Inc </td><td><a>http://www.nokiddingtoys.com</td></tr>
										<tr><td>PIECE TIME PUZZLES LLC </td><td><a>http://PIECETIMEPUZZLES.COM</td></tr>
										<tr><td>The Bus Stops Here </td><td><a>http://www.the-bus-stops-here.com</td></tr>
										<tr><td>Edamama Enterprise Inc. </td><td><a>http:// http://www.nymetroparents.com/manhattan/listing/</td></tr>
										<tr><td>The Tot </td><td><a>http://www.thetot.com</td></tr>
										<tr><td>Children's Museum Houston </td><td><a>http://www.cmhouston.org</td></tr>
										<tr><td>Pocket Full of Therapy </td><td><a>http://www.pfot.com</td></tr>
										<tr><td>Museum of Mathematics </td><td><a>http://www.momath.org</td></tr>
										<tr><td>Snoozy's Kids </td><td><a>http://www.snoozysbookstore.com</td></tr>
										<tr><td>Smiley Brothers Inc. DBA Mohonk Mountain House </td><td><a>http://www.mohonk.com</td></tr>
										<tr><td>Hooray for Books! </td><td><a>http://www.hooray4books.com</td></tr>
										<tr><td>Parent-Teacher Store USA </td><td><a>http://www.parent-teacherstoreusa.com</td></tr>
										<tr><td>Playopolis Toys </td><td><a>http://www.playopolistoys.com</td></tr>
										<tr><td>Sunnyside Bicycles </td><td><a>http://www.SunnysideBicycles.com</td></tr>
										<tr><td>Baby Blossom </td><td><a>http://www.babyblossom.com</td></tr>
										<tr><td>Different Roads to Learning </td><td><a>http://www.difflearn.com</td></tr>
										<tr><td>Children's Museum of Oswego </td><td><a>http://Www.cmoo.org</td></tr>
										<tr><td>An Open Book </td><td><a>http://www.anopenbookmn.indiebound.com</td></tr>
										<tr><td>Outside the Box </td><td><a>http://www.otbee.com</td></tr>
										<tr><td>YogaKids International </td><td><a>http://yogakids.com</td></tr>
										<tr><td>Got-Autism, LLC </td><td><a>http://www.got-autism.com</td></tr>
										<tr><td>The Bump and Beyond </td><td><a>http://www.thebumpandbeyond.com</td></tr>
										<tr><td>Baby Love </td><td><a>http://www.babyloveatlanta.com</td></tr>
										<tr><td>kidsthrivenyc.com </td><td><a>http://kidsthrivenyc.com </td></tr>
	
									</tbody>
									</table>
									<input type="button" id="seeMoreRecords" class="btn account-btn btn-danger" value="+50 More" >
									<input type="button" id="seeLessRecords" class="btn account-btn btn-danger" value="-50 Less"></div>
							<div role="tabpanel" class="tab-pane" id="stores">...</div>
							--->
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
		 
				<h2 class="col-md-12 bottom-slider-header text-center">Explore Toy Category</h2>
		
			 <div class="clearfix"> </div>
			<div class="container">
				<div class="row">
					<ul id="flexiselDemo1">
						<cfoutput query="select_other_skus">
							<li><img src="/images/products/#parent_sku#/button.jpg" /><div class="grid-flex"><a href="/product_catalog/product_page.cfm?sku=#parent_sku#" class="">#product_name#</a></div></li>
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
<script type="text/javascript" src="/js/main.js"></script>
    
    

	
<cfif isdefined('url.wtb')>
	 <script type="text/javascript">
	 	document.getElementById('wtb-button').click();
	 </script>
 </cfif>
</body>

</html>