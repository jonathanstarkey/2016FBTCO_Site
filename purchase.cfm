<cfquery name="select_skus" datasource="#datasource#" dbtype="#dbtype#">
    select product_sku, product_name, prod_page, left(product_sku,5) as parent_sku, upc_code, description, retail_price, product_status, country_of_origin, product_weight, product_length, product_width, product_height, case_pack_quantity, case_pack_weight, case_pack_length, case_pack_width, case_pack_height, youtube_id from wholesale_skus limit 0,1
</cfquery>

<cfquery name="get_fbt" datasource="#datasource#" dbtype="#dbtype#">
    select prod_page from sku_parents where sku = '#select_skus.parent_sku#'
</cfquery>


<!DOCTYPE html>
<html lang="en">

<body>
    <!-- Wrap all page content here -->
    <div id="wrap">

        <cfinclude template="/fatbraintoys/wholesale/templates/secondary_header.cfm">

            <cfoutput query="select_skus">
                <!-- SECONDARY HERO -->
                <section class="secondary-header-2" id="">
                    <div class="container-fluid parallax-container">
                        <div class="row">
                            <div class="parallax-window" data-parallax="scroll" data-image-src="./img/covershot.jpg">
                                <div class="col-lg-8 col-lg-offset-2 text-right">
                                    <h2 class="secondary-header-title">Purchase</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- /SECONDARY HERO -->

                <!--PAGE CONENT-->

                <!-- PURCHASE WHOLESALE SECTION -->
                <section class="wholsale-purchase-section content-section-a" id="">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-10">
                                <h2 class="wholsale-purchase-header">4 Ways to Purchase Wholesale from Fat Brain To Co.</h2>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- /PURCHASE WHOLESALE SECTION -->

                <!-- 4 WAYS TO PURCHASE WHOLESALE SECTION -->
                <section class="content-section-a four-way-content-section" id="">
                    <div class="container">
                        <div class="row">

                            <div class="col-md-8 col-md-offset-2  text-center">
                                <a href="##" class="btn btn-danger four-way-btn-1 text-center" data-toggle="modal" data-target="##myModal-whole-cat-request"><span class="pull-left">A.&nbsp;&nbsp;</span> Request wholesale catalog & Pricing by mail</a>
                                <a href="##" class="btn btn-danger four-way-btn-1 text-center" data-toggle="modal" data-target="##myModal-rep-groups"><span class="pull-left">B.&nbsp;&nbsp;</span> Purchase through our rep groups</a>
                                <a href="./app.cfm" class="btn btn-danger four-way-btn-1 text-center"><span class="pull-left">C.&nbsp;&nbsp;</span> Register online for new wholesale account</a>
                                <span class="four-way-or">OR</span>
                                <a href="##" class="btn btn-danger  four-way-btn-1 four-way-btn-red text-center" data-toggle="modal" data-target="##account-login"><span class="pull-left">D.&nbsp;&nbsp;</span> Login to existing account</a>

                            </div>
                            <ul class="wholsale-contact col-md-5 col-md-offset-2">
                                <li>To contact us:</li>
                                <li>Phone: 1-800-335-5621</li>
                                <li>Email:<a> sales@fatbraintoyco.com</a></li>

                            </ul>
                        </div>
                    </div>
                </section>
                <!-- /4 WAYS TO PURCHASE WHOLESALE SECTION -->

                <!-- CONSUMER PURCHASING OPTIONS SECTION -->

                <section class="consumer-purchase-section content-section-a" id="">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8">
                                <h2 class="consumer-purchase-header">Consumer Purchasing Options</h2>
                            </div>
                        </div>
                    </div>
                </section>

                <!--  PRODUCT TAB SECTION -->



                <!---
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
	--->

                <cfquery name="get_international" datasource="#datasource#" dbtype="#dbtype#">
                    select wcc.company_name, wcc.contact_phone, wcc.contact_email, wcc.bill_country, wcc.website from wholesale_orders wo, wholesale_items wi, wholesale_skus ws, wholesale_customers wcc where wcc.customer_number = wo.customer_number and wo.order_number = wi.order_number and wi.sku = ws.product_sku and wo.status = 'approved' and wo.date_created > '2015-10-12' and ws.product_status != 'inactive' and wcc.reseller_type = 'distributor' group by wo.customer_number limit 0,100
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
                                    <li role="presentation" class="active class-sm-12"><a href="##online" aria-controls="home" role="tab" data-toggle="tab">Buy Online</a></li>
                                    <li role="presentation"  class=" class-sm-12"><a href="##stores" aria-controls="profile" role="tab" data-toggle="tab">Find A Store</a></li>
                                    <li role="presentation"  class=" class-sm-12"><a href="##wholesale" aria-controls="messages" role="tab" data-toggle="tab">Purchase Wholesale</a></li>
                                    <li role="presentation"  class=" class-sm-12"><a href="##international" aria-controls="messages" role="tab" data-toggle="tab">International</a></li>
                                </ul>

                                <div class="tab-content">

                                    <div role="tabpanel" class="tab-pane active" id="online">

                                        <br>
                                        <div align="center">
                                            <a href="https://www.fatbraintoys.com#get_fbt.prod_page#?tid=fbtco" target="_new"><img class="img-responsive" border="0" alt="Fat Brain Toys" src="./img/fatbraintoys_logo.png"></a>
                                            <br>
                                            <br>
                                            <div class="borderless" style="font-size:21px;">All Fat Brain Toy Co. products are available for purchasing at our online store, <a href="https://www.fatbraintoys.com#get_fbt.prod_page#?tid=fbtco" target="_new">www.FatBrainToys.com</a></div>

                                        </div>

                                    </div>

                                    <div role="tabpanel" class="tab-pane" id="stores">


                                        <div class="col-md-8 col-md-offset-2">
                                            <div class="row">
                                                <iframe style="margin-top: 20px; border-style: none;" src="./map.cfm?sku=#parent_sku#" width="100%" height="400">
                                                </iframe>
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
                                                                <li><a href="##" "##" data-toggle="modal" data-target="##myModal-whole-cat-request" >Request Wholesale Catalog & Pricing by Mail</a></li>
                                                                <li><a href="##" data-toggle="modal" data-target="##myModal-rep-groups">Purchase Through Our Rep Groups</a></li>
                                                                <li><a href="./app.cfm">Register Online for New Wholesale Account</a></li>
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
                                                <!--feedback-->
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
<!--                                                    <th>Website</th>-->
                                                  </tr>
                                                </thead>
                                                <tbody class="tab-table-body">
                                                    <cfloop query="get_international">
                                                    <cf_country_convert country_abbreviation="#bill_country#">
                                                    <tr class="tab-table-row">
                                                        <td class="tab-table-cell" valign="middle" data-header-title="Country">#country_text#</td>
                                                        <td class="tab-table-cell" valign="middle" data-header-title="Co. Name">#company_name#</td>
                                                        <td class="tab-table-cell" valign="middle" data-header-title="Co. Email">#contact_email#</td>
                                                        <td class="tab-table-cell" valign="middle" data-header-title="Co. Phone">#contact_phone#</td>
<!--                                                        <td class="tab-table-cell tab-table-last" valign="middle" data-header-title="Co. Website"><a href="#website#">#website#</a></td>-->
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

            
            <!-- /CONSUMER PURCHASING OPTIONS SECTION -->

            <!--/PAGE CONENT-->

    </div>
    <!--/wrap-->
    <!--  DIVIDER  -->
    <div class="container">
        <hr>
    </div>

    <!--  /DIVIDER  -->
    <cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

        <!-- Include all compiled plugins (below), or include individual files as needed -->

<!--        <script type="text/javascript" src="./js/bootstrap-formhelpers-states.js"></script>-->


</body>

</html>