<!-- Page Content -->
    
    <div class="container-fluid" id="main">
         <div class="row">
             <div class="container">
        <!-- Title -->
        <div class="row">
            <div class="col-lg-12">
                <h3>Latest Features</h3>
            </div>
        </div>
        <!-- /.row -->

        <!-- Page Features -->
       
            
            
<cfoutput query="select_skus">

	<cfset #parent_sku# = #spanexcluding(product_sku,'-')#>

	<cfif #evaluate(currentrow mod 2)# EQ 1>
		<tr>
	</cfif>
<style>

</style>
	 <div class="row text-center">
         

            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <a href="#prod_page#"><cfif fileexists('#root_path#\fatbraintoys\wholesale\images\products\#parent_sku#\button.jpg')><img src="/images/products/#parent_sku#/button.jpg" alt="" border="0"><cfelse><img src="/images/coming_soon.gif" width="250" height="250" alt="Coming Soon"></cfif></a>
                    
                    <div class="caption">
                        <h3>Feature Label</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        <p>
                            <a href="index.cfm?sku=#product_sku#" id="product_buy" class="btn btn-primary">Purchase</a> <a href="#prod_page#" class="btn btn-default">More Info</a>
                        </p>
                    </div>
                </div>
            </div>
</cfoutput>
            
            
            
            
            
            
            
            
            
            
        </div>
        </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->