<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Fat Brain Toy Co. | Fat Brain Toy Co.</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<!-- Wrap all page content here -->
<div id="wrap">
    <div class="overlay"><h1>Toys that<br>matter to<br>their gray<br>matter.</h1></div>
  <div id="mycarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
    <li data-target="#mycarousel" data-slide-to="1"></li>
    <li data-target="#mycarousel" data-slide-to="2"></li>
    <li data-target="#mycarousel" data-slide-to="3"></li>
    <li data-target="#mycarousel" data-slide-to="4"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="img/IMG_6017.jpg" data-color="lightblue" alt="First Image">
      <div class="carousel-caption">
<!--        <h3>First Image</h3>-->
      </div>
    </div>
    <div class="item">
      <img src="img/_MG_4538.jpg" data-color="firebrick" alt="Second Image">
      <div class="carousel-caption">
<!--        <h3>Second Image</h3>-->
      </div>
    </div>
    <!-- more slides here -->
      <div class="item">
      <img src="img/_MG_4707.jpg" data-color="firebrick" alt="Second Image">
      <div class="carousel-caption">
<!--        <h3>Second Image</h3>-->
      </div>
    </div>
  </div>

  <!-- Controls -->
</div>
    
<!-- Fly-in navbar -->
<div class="navbar navbar-inverse navbar-static-top" id="nav">
    <div class="container">
      <div class="navbar-header">
        
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
          <a class="navbar-brand nav-logo-lg nav-logo-sm" href="##"><img src="img/fatbraintoco.png" alt="">
        </a>
      </div>
      <div class="collapse  navbar-collapse" >
        <ul class="nav navbar-nav navbarskinny navbar-right">
          <li><a href="#">Home</a></li>
          <li><a href="#section">Product Catalog</a></li>
          <li class="dropdown"><a href="section1" class="dropdown-toggle" data-toggle="dropdown">Purchase <span class="caret"></span>
              <ul class="dropdown-menu dropdown-menu-left">
                
                    <li><a href="#">Page 1-1</a></li>
                    <li><a href="#">Page 1-2</a></li>
                    <li><a href="#">Page 1-3</a></li> 
                    
                </ul></a>
            
            </li>
          <li><a href="#section">Media</a></li>
          <li><a href="#section">About Us</a></li>
            <li><a href="#section">Contact</a></li>
            <li>
  <button type="button" class="btn class account-btn btn-danger" data-toggle="modal" data-target="#myModal">
      Account Login</button>
                
 </li>
            <li><a href="#section"><span class="glyphicon glyphicon-earphone"></span> 800.335.5621</a></li>
        </ul>
      </div><!--/.nav-collapse -->
    </div><!--/.container -->
</div><!--/.navbar -->

<!-- Modal - Account Login -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="loginmodal-container">
					<h1>Account Login</h1><br>
				  <form>
					<input type="text" name="user" placeholder="Username">
					<input type="password" name="pass" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit" value="Login">
				  </form>
					
				  <div class="login-help">
					<a data-toggle="modal" href="#myModal-newaccount">Create Account?</a> - <a data-toggle="modal" href="#myModal-forgotpassword">Forgot Password</a>
				  </div>
				</div>

  </div>
</div>
    
<!-- Modal - New Account -->
<div id="myModal-newaccount" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">

    <!-- Modal content-->
    <div class="loginmodal-container">
					<h1>Create New Account</h1><br>
				  <form>
					<input type="text" name="user" placeholder="Username">
					<input type="password" name="pass" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit" value="Sign Up">
				  </form>
				</div>

  </div>
</div>

<!-- Modal - Forgot Pasword -->
<div id="myModal-forgotpassword" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">

<!-- Modal content-->
    <div class="loginmodal-container">
					<h1>Forgot Password</h1><br>
				  <form>
					<input type="text" name="user" placeholder="Username">
					<input type="email" name="pass" placeholder="Email">
					<input type="submit" name="login" class="login loginmodal-submit" value="Send">
				  </form>
					
				  <div class="login-help">
					<a href="#">Create Account?</a>
				  </div>
				</div>

  </div>
</div>

  
<!-- Begin page content -->
<div class="divider" id="section1"></div>
  
<div class="container">
  <div class="col-sm-10 col-sm-offset-1">
    <div class="page-header text-center">
      <h1>Since 2013</h1>
    </div>
    
    <p class="lead text-center"> 
      Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    </p> 
    
    <hr>
    
    <div class="divider"></div>
    
  </div>
</div>
    
<div class="divider"></div>
  
<section class="bg-1">
  <div class="col-sm-6 col-sm-offset-3 text-center"></div>
</section>
  
<div class="divider" id="section2"></div>
   
<div class="row">
  	<div class="col-sm-10 col-sm-offset-1">
      <h1>Profile</h1>
      
      <hr>
     
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate. 
        Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis 
        dolor, in sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan. 
        Aliquam in felis sit amet augue.
	  </p> 
      
      <hr>
      
      <div class="divider"></div>
      
  	</div><!--/col-->
</div><!--/container-->

<div class="divider"></div>
  
<section class="bg-3">
  <div class="col-sm-6 col-sm-offset-3 text-center"><h2>Clients &amp; Partners</h2></div>
</section>
  
<div class="divider" id="section3"></div>
  
<div class="bg-4">
  <div class="container">
	<div class="row">
	   <div class="col-sm-4 col-xs-6">
      
        <div class="panel panel-default">
          <div class="panel-thumbnail"><a href="#"><img src="//placehold.it/600x400/444/F8F8F8" class="img-responsive"></a></div>
          <div class="panel-body">
            <p>Renovations</p>
            <p></p>

          </div>
        </div><!--/panel-->
      </div><!--/col-->
      
      <div class="col-sm-4 col-xs-6">
      
      	<div class="panel panel-default">
          <div class="panel-thumbnail"><a href="#"><img src="//placehold.it/600x400/454545/FFF" class="img-responsive"></a></div>
          <div class="panel-body">
            <p>Projects</p>
            <p></p>
            
          </div>
        </div><!--/panel--> 
      </div><!--/col-->
      
      <div class="col-sm-4 col-xs-6">
      
      	<div class="panel panel-default">
          <div class="panel-thumbnail"><a href="#" title="Interiors"><img src="//placehold.it/600x400/555/F2F2F2" class="img-responsive"></a></div>
          <div class="panel-body">
            <p>Interiors</p>
            <p></p>
            
          </div>
        </div><!--/panel--> 

      </div><!--/col--> 
      
      <div class="col-sm-4 col-xs-6">
      
      	<div class="panel panel-default">
          <div class="panel-thumbnail"><a href="#"><img src="//placehold.it/600x400/555/FFF" class="img-responsive"></a></div>
          <div class="panel-body">
            <p>Design</p>
            <p></p>
            
          </div>
        </div><!--/panel--> 

      </div><!--/col--> 
      
      <div class="col-sm-4 col-xs-6">
      
      	<div class="panel panel-default">
          <div class="panel-thumbnail"><a href="#"><img src="//placehold.it/600x400/555/EEE" class="img-responsive"></a></div>
          <div class="panel-body">
            <p>Site Planning</p>
            <p></p>
            
          </div>
        </div><!--/panel--> 

      </div><!--/col--> 
      
      <div class="col-sm-4 col-xs-6">
      
      	<div class="panel panel-default">
          <div class="panel-thumbnail"><a href="#"><img src="//placehold.it/600x400/666/F4F4F4" class="img-responsive"></a></div>
          <div class="panel-body">
            <p>More</p>
            <p></p>
            
          </div>
        </div><!--/panel--> 

      </div><!--/col--> 
      
	</div><!--/row-->
  </div><!--/container-->
</div>

<div class="divider" id="section4"></div>

<div class="row">
  <div class="col-md-8 col-md-offset-1">
  </div>
</div>
  
<div class="row">
  
  <div class="col-sm-10 col-sm-offset-1">
      <h1>Location</h1>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis pharetra varius quam sit amet vulputate. 
    Quisque mauris augue, molestie tincidunt condimentum vitae, gravida a libero. Aenean sit amet felis 
    dolor, in sagittis nisi. Sed ac orci quis tortor imperdiet venenatis. Duis elementum auctor accumsan. 
    Aliquam in felis sit amet augue.
  </div>   
       
  
  <hr>
  
</div><!--/row-->
  
<div class="divider" id="section5"></div>  

<div class="row">
  
  <hr>
  
  <div class="col-sm-9 col-sm-offset-1">
      
      <div class="row form-group">
        <div class="col-md-12">
        <h1>Contact Us</h1>        
        </div>
        <div class="col-xs-4">
          <input class="form-control" id="firstName" name="name" placeholder="Your Name" type="text">
        </div>
        <div class="col-xs-6">
          <input class="form-control" id="organization" name="organization" placeholder="Company or Organization" type="text">
        </div>
      </div>
      <div class="row form-group">
          <div class="col-xs-5">
          <input class="form-control" name="email" placeholder="Email" type="text">
          </div>
          <div class="col-xs-5">
          <input class="form-control" name="phone" placeholder="Phone" type="text">
          </div>
      </div>
      <div class="row form-group">
          <div class="col-xs-10">
            <textarea class="form-control" placeholder="Comments"></textarea>
          </div>
      </div>
      <div class="row form-group">
          <div class="col-xs-10">
            <button class="btn btn-default pull-right">Contact Us</button>
          </div>
      </div>
    
  </div>
  
</div><!--/row-->
  
<div class="container">
  	<div class="col-sm-8 col-sm-offset-2 text-center">

      <ul class="list-inline center-block">
        <li><a href="http://facebook.com/bootply"><img src="/assets/example/soc_fb.png"></a></li>
        <li><a href="http://twitter.com/bootply"><img src="/assets/example/soc_tw.png"></a></li>
        <li><a href="http://google.com/+bootply"><img src="/assets/example/soc_gplus.png"></a></li>
        <li><a href="http://pinterest.com/in1"><img src="/assets/example/soc_pin.png"></a></li>
      </ul>
      
  	</div><!--/col-->
</div><!--/container-->
  
</div><!--/wrap-->

<div id="footer">
  <div class="container">
    <p class="text-muted">Copyright ©2014 ACME, Inc.</p>
  </div>
</div>

<ul class="nav pull-right scroll-top">
  <li><a href="#" title="Scroll to top"><i class="glyphicon glyphicon-chevron-up"></i></a></li>
</ul>


<div class="modal" id="myModal" role="dialog">
  <div class="modal-dialog">
  <div class="modal-content">
	<div class="modal-header">
		<button class="close" type="button" data-dismiss="modal">×</button>
		<h3 class="modal-title"></h3>
	</div>
	<div class="modal-body">
		<div id="modalCarousel" class="carousel">
 
          <div class="carousel-inner">
           
          </div>
          
          <a class="carousel-control left" href="#modaCarousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
          <a class="carousel-control right" href="#modalCarousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
          
        </div>
	</div>
	<div class="modal-footer">
		<button class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
   </div>
  </div>
</div>




    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
</body>

</html>