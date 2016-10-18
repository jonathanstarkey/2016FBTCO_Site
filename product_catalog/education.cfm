<!DOCTYPE html>
<html lang="en">

<body>
<!-- Wrap all page content here -->
<div id="wrap">
     
<cfinclude template="/fatbraintoys/wholesale/templates/secondary_header.cfm">

<cfquery name="select_skus" datasource="#datasource#" dbtype="#dbtype#">
select product_sku, product_name, prod_page, left(product_sku,5) as parent_sku
from wholesale_skus
where product_status != 'inactive'
and categories LIKE '%education%'
group by parent_sku
order by product_name
</cfquery>
    
<!-- SECONDARY HERO -->
    <section class="secondary-header-2" id="">
        <div class="container-fluid parallax-container">
            <div class="row">
                <div class="parallax-window" data-parallax="scroll" data-image-src="/img/education_header.jpg">
                    <div class="col-lg-8 col-lg-offset-2 text-right">          
                    <h2 class="secondary-header-title">Educational Toys</h2>
                </div>
                </div>
            </div>
        </div>
    </section>
    
<!-- /SECONDARY HERO -->     

    
<!-- Page Content -->
    
    <div class="container-fluid" id="main">
         <div class="row">
             <div class="container product-container">
        <!-- Title -->
<!--
        <div class="row">
            <div class="col-lg-12">
                <h3>Toys</h3>
            </div>
        </div>
-->
        <!-- /.row -->

        <!-- Page Features -->
         <!-- Page Features -->
        <div class="row text-center">
			<cfoutput query="select_skus">
           	<div class="col-md-3 col-sm-6 hero-feature">
                <div class="product-page-thumbnail thumbnail" style="">
                    <a href="/product_catalog/product_page.cfm?sku=#parent_sku#"><img src="https://www.fatbraintoyco.com/images/products/#parent_sku#/button.jpg"></a>
                    <div class="caption product-caption" style="">
                        <h3 class="product-catalog-label">#product_name#</h3>
                         <div >
                            <a href="/product_catalog/product_page.cfm?sku=#parent_sku#" class="btn btn-danger info-btn "><span class="glyphicon glyphicon-search"></span> Info</a> <a href="/product_catalog/product_page.cfm?sku=#parent_sku#&wtb" class="btn btn-default where-to-buy-btn">$&nbsp; Where To Buy</a>
                        </div>
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
    <!-- EXPLORE MORE -->
    <section class="explore-section content-section-a" id="">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="explore-header">EXPLORE PRODUCT CATALOG</h2>
                     
                </div>
            </div>
            <div class="row">
                    <a href="/product_catalog/toys.cfm" class="col-md-4 col-sm-6 awards-wrapper text-center">
                            <h2 class="explore-label">Toys</h2>
                            <div>
                            <img src="../img/toys.jpg" class="explore-img img-responsive center-block img-circle" alt="Responsive image">
                            </div>
                            <div class="caption text-center">
                            </div>
                            <button type="button" class="split-section-button btn btn-round-lg btn-lg">Discover Toys  &nbsp;&rsaquo;</button>
                    </a>
                    <a href="/product_catalog/games.cfm" class="col-md-4 col-sm-6 awards-wrapper text-center">
                            <h2 class="explore-label">Games</h2>
                            <div>
                            <img src="../img/games.jpg" class="explore-img img-responsive center-block img-circle" alt="Responsive image">
                            </div>
                            <div class="caption text-center">
                            </div>
                            <button type="button" class="split-section-button btn btn-round-lg btn-lg">Discover Games  &nbsp;&rsaquo;</button>
                    </a>
                    <a href="/product_catalog/brain_teasers.cfm" class="col-md-4 col-sm-12 awards-wrapper text-center">
                            <h2 class="explore-label">Brain Teasers</h2>
                            <div>
                            <img src="../img/brainteasers.jpg" class="explore-img img-responsive center-block img-circle" alt="Responsive image">
                            </div>
                            <div class="caption text-center">
                            </div>
                            <button type="button" class="split-section-button btn btn-round-lg btn-lg">Discover Brain Teasers  &nbsp;&rsaquo;</button>
                    </a>
                </div>
        </div>
    </section>
<!-- /EXPLORE MORE -->
    
</div><!--/container-->
  
</div><!--/wrap-->


<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">

    
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

</body>

</html>