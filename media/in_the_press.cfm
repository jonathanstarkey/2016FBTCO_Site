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
                    <h2 class="secondary-header-title">In the Press</h2>
                </div>
                </div>
            </div>
        </div>
    </section>
    
<!-- /SECONDARY HERO -->    

    
<!-- Page Content -->
    
    <!--  FAT BRAIN TOY CO PRESS KIT -->
    <div class="content-section-a">

        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <h2 class="section-heading in-the-press-heading">Fat Brain Toy Co.<br>Press Kit</h2>
                    <p class="lead">What has Fat Brain Toy Co. been up to? Check out what others are saying about us in the press.</p>
                    
                    <a href="../downloads/presskit.pdf" class="center-block press-kit-button btn btn-round-lg btn-lg">Download Current Press Kit  &nbsp;&rsaquo;</a>
                </div>
                <div class="col-lg-5 col-lg-offset-1 col-sm-6">
                    <a  href="../downloads/presskit.pdf" ><img class="img-responsive" src="../img/press_kit.jpg" alt="Fat Brain Toy Co. - Current Press Kit"></a>
                </div>
                
            </div>

        </div>
        <!-- /.container -->

    </div>

<!--  / FAT BRAIN TOY CO PRESS KIT -->  
    
<!-- IN THE PRESS HEADER -->
    <section class="in-the-press-section content-section-a" id="">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h2 class="in-the-press-header-2">In the Press</h2>
                     
                </div>
            </div>
        </div>
    </section>
<!-- /IN THE PRESS HEADER -->
    
<!-- ARTICLE SECTION -->
     <div class="content-section-a">

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table id="internalActivities" class="table table-striped">
<!--
                    <thead>
                      <tr>
                        <th>Retailer</th>
                      </tr>
                    </thead>
-->
                    <h2 class="section-heading article-head ">Who's talking about us?</h2>
                    
                    <cfquery name="get_content" datasource="#datasource#" dbtype="#dbtype#">
                    select *
                    from pr_content
                    where sites LIKE '%fat brain toy co%'
                    order by date_created desc
                    </cfquery>
                    
                    <tbody>
                        <cfoutput query="get_content">
                            <cfif #trim(external_url)# IS NOT ''>
                                <tr><td><span>Read Article &rarr;  &nbsp;</span><a href="#external_url#" target="_new">#title#</a></td></tr>
                            <cfelse>
                                 <tr><td><span>Read Article &rarr;  &nbsp;</span><a href="/press/index.cfm?pr_id=#pr_id#">#title#</a></td></tr>
                            </cfif>
                        </cfoutput>
                    </tbody>
                </table>
                <input type="button" id="seeMoreRecords" class="btn account-btn btn-danger" value="+50 More" >
                <input type="button" id="seeLessRecords" class="btn account-btn btn-danger" value="-50 Less"></div>
            </div>
        </div>
    </div>
<!-- /ARTICLE SECTION -->
    
 <!-- EXPLORE MORE -->
    <section class="explore-section content-section-a" id="">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="explore-header">EXPLORE PRODUCT CATALOG</h2>
                     
                </div>
            </div>
            <div class="row">
                    <a href="/product_catalog/toys.cfm" class="col-md-6 col-sm-6 col-lg-3 awards-wrapper text-center">
                            <h2 class="explore-label">Toys</h2>
                            <div>
                            <img src="../img/toys.jpg" class="explore-img img-responsive center-block img-circle" alt="Responsive image">
                            </div>
                            <div class="caption text-center">
                            </div>
                            <button type="button" class="split-section-button btn btn-round-lg btn-lg">Discover Toys  &nbsp;&rsaquo;</button>
                    </a>
                    <a href="/product_catalog/games.cfm" class="col-md-6 col-sm-6 col-lg-3 awards-wrapper text-center">
                            <h2 class="explore-label">Games</h2>
                            <div>
                            <img src="../img/games.jpg" class="explore-img img-responsive center-block img-circle" alt="Responsive image">
                            </div>
                            <div class="caption text-center">
                            </div>
                            <button type="button" class="split-section-button btn btn-round-lg btn-lg">Discover Games  &nbsp;&rsaquo;</button>
                    </a>
                    <a href="/product_catalog/brain_teasers.cfm" class="col-md-6 col-sm-6 col-lg-3 awards-wrapper text-center">
                            <h2 class="explore-label">Brain Teasers</h2>
                            <div>
                            <img src="../img/brainteasers.jpg" class="explore-img img-responsive center-block img-circle" alt="Responsive image">
                            </div>
                            <div class="caption text-center">
                            </div>
                            <button type="button" class="split-section-button btn btn-round-lg btn-lg">Discover Brain Teasers  &nbsp;&rsaquo;</button>
                    </a>
                    <a href="/product_catalog/education.cfm" class="col-md-6 col-sm-6 col-lg-3 awards-wrapper text-center">
                            <h2 class="explore-label">Education</h2>
                            <div>
                                <img src="../img/education.jpg" class="explore-img img-responsive center-block img-circle" alt="Responsive image">
                            </div>
                            <div class="caption text-center">
                            </div>
                            <button type="button" class="split-section-button btn btn-round-lg btn-lg">Discover Education  &nbsp;&rsaquo;</button>
                    </a>
                </div>
        </div>
    </section>
<!-- /EXPLORE MORE -->
  
  
</div><!--/container-->
  
</div><!--/wrap-->


<cfinclude template="/fatbraintoys/wholesale/templates/footer.cfm">

    
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script type="text/javascript" src="/js/main.js"></script>
    
</script>

</body>

</html>