<!DOCTYPE html>
<html lang="en">
<body>
<!-- Wrap all page content here -->
<div id="wrap">
     
<cfinclude template="/fatbraintoys/wholesale/templates/secondary_header.cfm">

    
<!-- SECONDARY HERO -->
    <section class="secondary-header-2" id="">
        <div class="container-fluid parallax-container">
            <div class="row">
                <div class="parallax-window" data-parallax="scroll" data-image-src="/img/CoverShot.jpg">
                    <div class="col-lg-8 col-lg-offset-2 text-right">          
                    <h2 class="secondary-header-title">Product Images</h2>
                </div>
                </div>
            </div>
        </div>
    </section>
    
<!-- /SECONDARY HERO -->    


<cfquery name="select_skus" datasource="#datasource#" dbtype="#dbtype#">
select product_sku, product_name, prod_page, left(product_sku,5) as parent_sku, upc_code, description, retail_price, product_status, country_of_origin, product_weight, product_length, product_width, product_height, case_pack_quantity, case_pack_weight, case_pack_length, case_pack_width, case_pack_height, youtube_id
from wholesale_skus
where product_status != 'inactive'
and product_sku NOT IN ('fa077-1','fa090-1','fa100-1')
group by parent_sku
order by product_name
</cfquery>

<style>

  .gallery ol
  {
    width: 100%;
    list-style-type:none;
  }  
  .gallery ol li
  {
  	text-align: center;
    float: left;
    width: 10em;
  }  
  .gallery br
  {
    clear: left;
  }  
  .gallery div.wrapper
  {
    margin-bottom: 1em;
  }
  
</style>
    
<div id="where-to-buy" class="content-section-a where-to-buy-section">
	<div class="container">
		<div class="row">
			
			<cfoutput>
			
			<ul class="nav nav-tabs" role="tablist">
				
				<li role="presentation" class="active" style="width:340px;"><a href="##main_fbtc" aria-controls="home" role="tab" data-toggle="tab">Fat Brain Toy Co.</a></li>
				<li role="presentation"><a href="##images_fbtc" aria-controls="home" role="tab" data-toggle="tab">Images</a></li>
				<li role="presentation"><a href="##logos_fbtc" aria-controls="profile" role="tab" data-toggle="tab">Logos</a></li>
				<li role="presentation"><a href="##videos_fbtc" aria-controls="messages" role="tab" data-toggle="tab">Videos</a></li>
				<li role="presentation"><a href="##materials_fbtc" aria-controls="messages" role="tab" data-toggle="tab">Sales Materials</a></li>
				
			</ul>
			
			<div class="tab-content">
				
				<div role="tabpanel" class="tab-pane" id="main_fbtc">

					<br>

					Main...

				</div>
		  
				<div role="tabpanel" class="tab-pane" id="images_fbtco">
				
					<br>
					
					<cfif directoryexists('#root_path#\fatbraintoys\wholesale\downloads\fbtc\images') IS 'yes'>
						
						<div class="gallery">
							<cfdirectory action="list" directory="#root_path#\fatbraintoys\wholesale\downloads\fbtc\images" name="images" filter="*.jpg|*.gif|*.pdf|*.png">
							<cfif #images.recordcount# GT 0>
								<div class="wrapper"><div class="col-md-12">
								<cfloop query="images">
									<cfif (findnocase("conflict", name) eq 0) AND (#left(name,1)# IS NOT '.')>
										<div class="col-xs-3 col-sm-2 col-md-1">
											<a href="/downloads/fbtc/images/#lcase(name)#" target="_new"><img class="img-responsive" src="/downloads/fbtc/images/#lcase(name)#"></a><br>										
											<p style="word-break: break-all;"><b>#name#</b></p><br>
											<!--- <cfif #right(name,3)# IS NOT 'pdf'>
												<cfimage source="#root_path#\fatbraintoys\wholesale\downloads\fbtc\images\#name#" name="myImage"> 
												<cfset width=#ImageGetWidth(myImage)#> 
												<cfset height=#ImageGetHeight(myImage)#> 
												#width# X #height#
											</cfif> --->
										</div>
									</cfif>
								</cfloop>
								<br />
								</div></div>
							</cfif>
						</div>
						
					<cfelse>
						
						<br>
						<div align="center">No images available at this time. Please check back again soon!</div>
						<br>

					</cfif>

				</div>

				<div role="tabpanel" class="tab-pane" id="logos_fbtc">

					<br>
					
					<cfif directoryexists('#root_path#\fatbraintoys\wholesale\downloads\fbtc\logos') IS 'yes'>
					
						<div class="gallery">
							<cfdirectory action="list" directory="#root_path#\fatbraintoys\wholesale\downloads\fbtc\logos" name="images" filter="*.jpg|*.gif|*.pdf|*.png|*.eps">
							<cfif #images.recordcount# GT 0>
								<div class="wrapper"><div class="col-md-12">
								<cfloop query="images">
									<cfif (findnocase("conflict", name) eq 0) AND (#left(name,1)# IS NOT '.')>
										<div class="col-xs-3 col-sm-2 col-md-1">
											<a href="/downloads/fbtc/logos/#lcase(name)#" target="_new">
											<cfif #right(name,4)# IS '.pdf'>
												<img src="/img/pdf_icon.png" width="30">
											<cfelseif #right(name,4)# IS '.eps'>
												<img src="/img/eps_icon.png" width="30">
											<cfelse>
												<img class="img-responsive" src="/downloads/fbtc/logos/#lcase(name)#">
											</cfif>
											</a><br>										
											<p style="word-break: break-all;"><b>#name#</b></p><br>
											<!--- <cfif #right(name,3)# IS NOT 'pdf'>
												<cfimage source="#root_path#\fatbraintoys\wholesale\downloads\fbtc\logos\#name#" name="myImage"> 
												<cfset width=#ImageGetWidth(myImage)#> 
												<cfset height=#ImageGetHeight(myImage)#> 
												#width# X #height#
											</cfif> --->
										</div>
									</cfif>
								</cfloop>
								<br />
								</div></div>
							</cfif>
						</div>
						
					<cfelse>
						
						<br>
						<div align="center">No logos available at this time. Please check back again soon!</div>
						<br>
						
					</cfif>

				</div>

				<div role="tabpanel" class="tab-pane" id="videos_fbtco">
					
					<br>
					
					

				</div>

				<div role="tabpanel" class="tab-content tab-pane" id="materials_fbtco">
				
					<br>

					<cfif directoryexists('#root_path#\fatbraintoys\wholesale\downloads\fbtc\materials') IS 'yes'>
					
						<div class="gallery">
							<cfdirectory action="list" directory="#root_path#\fatbraintoys\wholesale\downloads\fbtc\materials" name="images" filter="*.jpg|*.gif|*.pdf|*.png">
							<cfif #images.recordcount# GT 0>
								<div class="wrapper">
                                    <div class="col-md-12">
								<cfloop query="images">
									<cfif (findnocase("conflict", name) eq 0) AND (#left(name,1)# IS NOT '.')>
										<div class="col-xs-3 col-sm-2 col-md-1">
											<a href="/downloads/products/fbtc/#lcase(name)#" target="_new">
											<cfif #right(name,4)# IS '.pdf'>
												<img src="/img/pdf_icon.png" width="30">
											<cfelseif #right(name,4)# IS '.eps'>
												<img src="/img/eps_icon.png" width="30">
											<cfelse>
												<img class="img-responsive" src="/downloads/fbtc/materials/#lcase(name)#">
											</cfif>	
											</a><br>									
											<p style="word-break: break-all;"><b>#name#</b></p><br>
											<!--- <cfif #right(name,3)# IS NOT 'pdf'>
												<cfimage source="#root_path#\fatbraintoys\wholesale\downloads\fbtc\materials\#name#" name="myImage"> 
												<cfset width=#ImageGetWidth(myImage)#> 
												<cfset height=#ImageGetHeight(myImage)#> 
												#width# X #height#
											</cfif> --->
										</div>
									</cfif>
								</cfloop>
								<br />
								</div></div>
							</cfif>
						</div>
						
					<cfelse>
						
						<br>
						<div align="center">No sales material available at this time. Please check back again soon!</div>
						<br>
						
					</cfif>

				</div>
		  
			</div>
			
			</cfoutput>
			
			<br>
			
			<cfoutput query="select_skus">	

				<ul class="nav nav-tabs" role="tablist">
				
					<li role="presentation" style="width:340px;"><a href="##main_#parent_sku#" aria-controls="home" role="tab" data-toggle="tab">#product_name#</a></li>
					<li role="presentation"><a href="##images_#parent_sku#" aria-controls="home" role="tab" data-toggle="tab">Images</a></li>
					<li role="presentation"><a href="##logos_#parent_sku#" aria-controls="profile" role="tab" data-toggle="tab">Logos</a></li>
					<li role="presentation"><a href="##videos_#parent_sku#" aria-controls="messages" role="tab" data-toggle="tab">Videos</a></li>
					<li role="presentation"><a href="##materials_#parent_sku#" aria-controls="messages" role="tab" data-toggle="tab">Sales Materials</a></li>
				
				</ul>

				<div class="tab-content">
				
					<div role="tabpanel" class="tab-pane" id="main_#parent_sku#">

						<br>
                        <div class="col-md-4">
                            <img class="img-responsive" src="https://www.fatbraintoys.com/images/products/large/#parent_sku#.jpg">
                        </div>
                        <div class="col-md-7 col-md-offset-1">
						<table class="table table-condensed borderless">
							<tbody>
							<tr>
								
								<td style="font-weight:600;">Product Name:</td>
								<td>#product_name#</td>
							</tr>
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
			  
					<div role="tabpanel" class="tab-pane" id="images_#parent_sku#">
					
						<br>
						
						<div class="gallery">
						<div class="wrapper">
                            
                            <div  class="list-group col-md-12">
						
						<cfif fileexists('#root_path#\fatbraintoys\images\products\extralarge\#lcase(parent_sku)#.jpg') IS 'yes'>

							<div class="col-xs-3 col-sm-2 col-md-1">
								<a href="https://www.fatbraintoys.com/images/products/extralarge/#lcase(parent_sku)#.jpg" target="_new"><img class="img-responsive" src="https://www.fatbraintoys.com/images/products/extralarge/#lcase(parent_sku)#.jpg" ></a><br>										
								<b>#lcase(parent_sku)#.jpg</b><br>
								<!--- <cfimage source="#root_path#\fatbraintoys\images\products\extralarge\#lcase(parent_sku)#.jpg" name="myImage"> 
								<cfset width=#ImageGetWidth(myImage)#> 
								<cfset height=#ImageGetHeight(myImage)#> 
								#width# X #height# --->
							</div>
							
						</cfif>
						

						<cfif directoryexists('#root_path#\fatbraintoys\images\products\detail\#lcase(parent_sku)#') IS 'yes'>
							

								<cfdirectory action="list" directory="#root_path#\fatbraintoys\images\products\detail\#lcase(parent_sku)#" name="images" filter="*.jpg|*.gif|*.pdf|*.png">
								<cfif #images.recordcount# GT 0>

									<cfloop query="images">
										<cfif (findnocase("conflict", name) eq 0) AND (#left(name,1)# IS NOT '.')>
											<div class="col-xs-3 col-sm-2 col-md-1">
												<a href="https://www.fatbraintoys.com/images/products/detail/#parent_sku#/#lcase(name)#" target="_new"><img class="img-responsive" src="https://www.fatbraintoys.com/images/products/detail/#parent_sku#/#lcase(name)#"></a><br>										
												<p style="word-break: break-all;"><b>#name#</b></p><br>
												<!--- <cfif #right(name,3)# IS NOT 'pdf'>
													<cfimage source="#root_path#\fatbraintoys\images\products\detail\#parent_sku#\#lcase(name)#" name="myImage"> 
													<cfset width=#ImageGetWidth(myImage)#> 
													<cfset height=#ImageGetHeight(myImage)#> 
													#width# X #height#
												</cfif> --->
											</div>
										</cfif>
									</cfloop>

								</cfif>

							
						</cfif>

						
						
						<cfif directoryexists('#root_path#\fatbraintoys\wholesale\downloads\products\#parent_sku#\images') IS 'yes'>
							
								<cfdirectory action="list" directory="#root_path#\fatbraintoys\wholesale\downloads\products\#parent_sku#\images" name="images" filter="*.jpg|*.gif|*.pdf|*.png">
								<cfif #images.recordcount# GT 0>

									<cfloop query="images">
										<cfif (findnocase("conflict", name) eq 0) AND (#left(name,1)# IS NOT '.')>
											<div class="col-xs-3 col-sm-2 col-md-1">
												<a href="/downloads/products/#parent_sku#/images/#lcase(name)#" target="_new"><img class="img-responsive" src="/downloads/products/#parent_sku#/images/#lcase(name)#"></a><br>										
												<p style="word-break: break-all;"><b>#name#</b></p><br>
												<!--- <cfif #right(name,3)# IS NOT 'pdf'>
													<cfimage source="#root_path#\fatbraintoys\wholesale\downloads\products\#parent_sku#\images\#name#" name="myImage"> 
													<cfset width=#ImageGetWidth(myImage)#> 
													<cfset height=#ImageGetHeight(myImage)#> 
													#width# X #height#
												</cfif> --->
											</div>
										</cfif>
									</cfloop>
									
								</cfif>
							</div>
							
						<cfelse>
							
							<br>
							<div align="center">No images available at this time. Please check back again soon!</div>
							<br>

						</cfif>
						
						<br />
						</div></div>

					</div>

					<div role="tabpanel" class="tab-pane" id="logos_#parent_sku#">

						<br>
						
						<cfif directoryexists('#root_path#\fatbraintoys\wholesale\downloads\products\#parent_sku#\logos') IS 'yes'>
						
							<div class="gallery">
								<cfdirectory action="list" directory="#root_path#\fatbraintoys\wholesale\downloads\products\#parent_sku#\logos" name="images" filter="*.jpg|*.gif|*.pdf|*.png|*.eps">
								<cfif #images.recordcount# GT 0>
									<div class="wrapper">
                                        
                                    <div class="col-md-12">
									<cfloop query="images">
										<cfif (findnocase("conflict", name) eq 0) AND (#left(name,1)# IS NOT '.')>
											<div class="col-xs-3 col-sm-2 col-md-1">
												<a href="/downloads/products/#parent_sku#/logos/#lcase(name)#" target="_new">
												<cfif #right(name,4)# IS '.pdf'>
													<img  src="/img/pdf_icon.png"  width="30">
												<cfelseif #right(name,4)# IS '.eps'>
													<img  src="/img/eps_icon.png" width="30">
												<cfelse>
													<img class="img-responsive" src="/downloads/products/#parent_sku#/logos/#lcase(name)#">
												</cfif>	
                                                    </a><br><p style="word-break: break-all;"><b>#name#</b></p>										
												<br>
												<!--- <cfif #right(name,3)# IS NOT 'pdf'>
													<cfimage source="#root_path#\fatbraintoys\wholesale\downloads\products\#parent_sku#\logos\#name#" name="myImage"> 
													<cfset width=#ImageGetWidth(myImage)#> 
													<cfset height=#ImageGetHeight(myImage)#> 
													#width# X #height#
												</cfif> --->
											</div>
										</cfif>
									</cfloop>
									<br />
									</div></div>
								</cfif>
							</div>
							
						<cfelse>
							
							<br>
							<div align="center">No logos available at this time. Please check back again soon!</div>
							<br>
							
						</cfif>

					</div>

					<div role="tabpanel" class="tab-pane" id="videos_#parent_sku#">
						
						<br>
                        <div class="col-md-6 col-md-offset-3" >
						<div class="embed-responsive embed-responsive-16by9" style="margin-bottom: 40px;">
						<iframe class="embed-responsive-item" src="//www.youtube.com/embed/#youtube_id#?rel=0&showinfo=0&autohide=1&contols=0"></iframe>
						</div>
                        </div>

                        <div class="col-md-12">
						Link to YouTube Video: <a href="https://www.youtube.com/embed/#youtube_id#?rel=0&showinfo=0&autohide=1&contols=0" target="_new">https://www.youtube.com/embed/#youtube_id#?rel=0&showinfo=0&autohide=1&contols=0</a>
						<br>
						<br>
						<div class="form-group">
						<textarea class="form-control" rows="1" name="video"  onclick="this.focus();this.select()" readonly="readonly">https://www.youtube.com/embed/#youtube_id#?rel=0&showinfo=0&autohide=1&contols=0</textarea><br>
						Click on text area above and copy and paste as needed.
                        </div>
                        
					   </div>
                                    </div>
					<div role="tabpanel" class="tab-content tab-pane" id="materials_#parent_sku#">
					
						<br>

						<cfif directoryexists('#root_path#\fatbraintoys\wholesale\downloads\products\#parent_sku#\materials') IS 'yes'>
						
							<div class="gallery">
								<cfdirectory action="list" directory="#root_path#\fatbraintoys\wholesale\downloads\products\#parent_sku#\materials" name="images" filter="*.jpg|*.gif|*.pdf|*.png">
								<cfif #images.recordcount# GT 0>
									<div class="wrapper"> 
                                        
                                    <div class="col-md-12">
									<cfloop query="images">
										<cfif (findnocase("conflict", name) eq 0) AND (#left(name,1)# IS NOT '.')>
											<div class="col-xs-3 col-sm-2 col-md-1">
												<a href="/downloads/products/#parent_sku#/materials/#lcase(name)#" target="_new">
												<cfif #right(name,4)# IS '.pdf'>
													<img  src="/img/pdf_icon.png" width="30">
												<cfelseif #right(name,4)# IS '.eps'>
													<img  src="/img/eps_icon.png" width="30">
												<cfelse>
													<img class="img-responsive" src="/downloads/products/#parent_sku#/materials/#lcase(name)#" >
												</cfif>	
												</a><br>										
												<p style="word-break: break-all;"><b>#name#</b></p><br>
												<!--- <cfif #right(name,3)# IS NOT 'pdf'>
													<cfimage source="#root_path#\fatbraintoys\wholesale\downloads\products\#parent_sku#\materials\#name#" name="myImage"> 
													<cfset width=#ImageGetWidth(myImage)#> 
													<cfset height=#ImageGetHeight(myImage)#> 
													#width# X #height#
												</cfif> --->
											</div>
										</cfif>
									</cfloop>
									<br />
									</div></div>
								</cfif>
							</div>
							
						<cfelse>
							
							<br>
							<div align="center">No sales material available at this time. Please check back again soon!</div>
							<br>
							
						</cfif>

					</div>
			  
				</div>
				
				<br>

			</cfoutput>


		</div>
	 </div>
</div>
  
  
</div><!--/container-->
  
</div><!--/wrap-->


<!--  DIVIDER  -->
    <div class="container">
        <hr>
    </div>


<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">

    
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

</body>

</html>