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
    <!-- Custom CSS   -->
    <link href="css/main.css" rel="stylesheet">
<!--    <link href="css/landing-page.css" rel="stylesheet">-->

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,900,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Exo+2:400,300,600,700,800,900,500' rel='stylesheet' type='text/css'>
    
    <script src="https://use.fontawesome.com/d0c538d1aa.js"></script>


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
     
<!-- Fly-in navbar -->
<div class="navbar navbar-inverse navbar-static-top" id="nav">
    <div class="container">
      <div class="navbar-header">
        
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
          <a class="navbar-brand nav-logo-lg nav-logo-sm" href="/index.cfm"><img src="img/fatbraintoco.png" alt="">
        </a>
      </div>
      <div class="collapse  navbar-collapse" >
        <ul class="nav navbar-nav navbarskinny navbar-right">
          <li><a href="/index.cfm">Home</a></li>
          <li class="dropdown nav-hover"><a href="section1" class="header-dropdown  dropdown-toggle" data-toggle="dropdown">Product Catalog <span class="caret"></span></a>
              <ul class="header-dropdown-menu dropdown-menu dropdown-menu-left">
                <ul class="list-inline">
                    <li><a href="/product_catalog/toys.cfm">Toys</a></li>
                    <li><a href="/product_catalog/games.cfm">Games</a></li>
                    <li><a href="/product_catalog/brain_teasers.cfm">Brain Teasers</a></li> 
                    <li><a href="/product_catalog/education.cfm">Education</a></li>
                  </ul>  
                </ul>
            </li>
          <li><a href="#section">Purchase</a></li>
          <li class="dropdown"><a href="section1" class="header-dropdown  dropdown-toggle" data-toggle="dropdown">Media <span class="caret"></span></a>
              <ul class="header-dropdown-menu dropdown-menu dropdown-menu-left">
                <ul class="list-inline">
                    <li><a href="/media/in_the_press.cfm">In the Press</a></li>
                    <li><a href="/media/awards.cfm">Awards</a></li>
                    <li><a href="/media/product_images.cfm">Product Images</a></li> 
                  </ul>  
                </ul>
            </li>
          <li><a href="/about_us/index.cfm">About Us</a></li>
            <li><a href="/contact/index.cfm">Contact</a></li>
            <li><button type="button" class="btn class account-btn btn-danger" data-toggle="modal" data-target="#account-login">
      Account Login</button>
            </li>
            <li><a href="#section"><span class="glyphicon glyphicon-earphone"></span> 800.335.5621</a></li>
        </ul>
      </div><!--/.nav-collapse -->
    </div><!--/.container -->
</div><!--/.navbar -->
 
<!-- Begin page content -->

<!-- Modal - Account Login -->
<div id="account-login" class="modal fade" role="dialog">
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
    

    
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>-->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<!--<script type="text/javascript"  src="js/bootstrap.min.js"></script>-->
<!--<script type="text/javascript" src="js/main.js"></script>-->

</body>

</html>