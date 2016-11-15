<%-- 
    Document   : PublicPost
    Created on : Oct 23, 2016, 4:04:30 AM
    Author     : BHAVESH GOYAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	
	
	<title>News Aggregator</title>

	<link rel="shortcut icon" href="images/favicon.png">
	
	<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="assest/css/bootstrap.min.css">
	<link rel="stylesheet" href="assest/css/font-awesome.css">
	<link rel="stylesheet" href="assest/css/font-awesome.min.css">

	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="assest/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="assest/css/style.css">

	
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
</head>
     
<body>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom" >
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<a class="navbar-brand" href="#"><img src="http://localhost:8080/NewsAggregator/assets/images/logo.png" alt="News Aggregator"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right" style="margin-left: 0px; width: 667px;">
					<div class="col-lg-6" style="margin-top: 10px;">
					<div class="input-group">
						<input class="form-control" placeholder="Search" type="text">
							<span class="input-group-btn">
								<form class="form-inline" method="post" action="#">
								<button class="btn btn-default" type="submit" style="margin-top: -1px; height: 37px; padding: 4px 19px; border-left-width: 0px; border-right-width: 0px; margin-left: -1px;">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
								</form>
							</span>
					</div>
				</div>
				
				<li><a href="index.html" style="padding-left: 39px;">Notification</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Discussion <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="private_dis_page.html">Private Discussion</a></li>
						<li><a href="exclusive_dis_page.html">Exclusive Discussion</a></li>
						<li><a href="public_discussion_page.html">Public Discussion</a></li>							
					</ul>
				</li>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"><b class="caret"></b></i></a>
					<ul class="dropdown-menu" style="padding: 5px 1px; width: 151px;">
						<li><a href="profile_page.html">User Profile</a></li>
						<li><a href="reset_pwd_page.html">Reset Password</a></li>
						<li><a href="signIn_Page.html">Logout</a></li>
					</ul>
				</li>
				<!--<li class="active" style="margin-left: 29px;"><a class="btn" href="signin_Page.html">LOGOUT</a></li>-->
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div> 
	<!-- /.navbar -->

	<header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">
		<div class="row">
			<ul class="nav navbar-nav pull-right" style="margin-top: 51px;">
				<nav id="filter" class="col-md-12 text-center">
					<ul>
						<li><a href="my_discussion_list.html" class="current btn-theme btn-small">My Discussion</a></li>
						<li><a href="Controller?action=publicdetailview" class="btn-theme btn-small">Discussion List</a></li>
						<li><a href="#" class="btn-theme btn-small">Most Viewed Post</a></li>
						<!--<li><a href="#" class="btn-theme btn-small">Print</a></li>-->
					</ul>
				</nav>
			</ul>
			<article class="col-md-8 maincontent" style="width: 1168px;">
				
				<ul class="nav nav-tabs" style="font-size:18px ">
					<li class="active"><a data-toggle="tab" href="#new_post">New Post</a></li>
				</ul>
				<div class="tab-content">
					<div id="new_post" class="tab-pane fade in active">
					  <div class="col-md-12">
					  	<form action="Controller?action=addpublicpost" method="post" style="margin-top: 2px;">
							<h3>Topic : </h3>
							<input type="text" id="topic" name="topic" placeholder="Enter the Topic" style="border-radius: 5px; width:550px; height:30px;">
							<h3>Post : </h3>
							<textarea id="content" name="content" cols="85" rows="6" placeholder="Enter the Post" style="border-radius: 5px;"></textarea>
							<h3>Select Category : </h3>
							<input type="checkbox" name="cb" value="Political"> Political <br/>
							<input type="checkbox" name="cb" value="Education"> Education  <br/>
							<input type="checkbox" name="cb" value="Sports"> Sports  <br/>
							<input type="checkbox" name="cb" value="Music"> Music <br/>
							<input type="checkbox" name="cb" value="History"> History <br/>
						
						<div style="margin-top: 50px; margin-left: -13px;">
                                                    <button type="submit" class="btn btn-action">Post</button>
							<button id="btn_post" class="btn btn-action">Reset Post</button>
						</div>
                                                        </form>
					  </div>		
					 </div>
				</div>
			</article>
			
		</div>
	</div>	<!-- /container -->
	
	<footer id="footer" class="top-space">

		<div class="footer1">
			<div class="container">
				<div class="row">
					<div class="col-md-9 panel contact"> 
						<h3 class="panel-title">Contact Info</h4>
						<div class="panel-body">
						<p>Developed by Team Black</p>
						<ul>
						  <li><i class="fa fa-phone"></i>+91-940-808-0936</li>
						  <li><a href="#"><i class="fa fa-envelope-o"></i> 201512002@daiict.ac.in</a></li>
						  <li><i class="fa fa-flag"></i>DA-IICT, Gandhinagar</li>
						</ul> 
						</div>
					</div>

					<div class="col-md-3 panel">
						<h3 class="panel-title">Follow Us</h3>
						<div class="panel-body">
							<p class="follow-me-icons">
								<a href="signin_Page.html"><i class="fa fa-twitter fa-2"></i></a>
								<a href="signin_Page.html"><i class="fa fa-github fa-2"></i></a>
								<a href="signin_Page.html"><i class="fa fa-facebook fa-2"></i></a>
								
							</p>	
						</div>
					</div>
			
				</div> <!-- /row of panels -->
			</div>
		</div>

		<div class="footer2">
			<div class="container">
				<div class="row">
					
					<div class="col-md-9 panel"></div>

					<div class="col-md-3 panel">
						<div class="panel-body">
							<p class="text-right">
								Copyright &copy; 2016. Developed by Team Black 
							</p>
						</div>
					</div>

				</div> <!-- /row of panels -->
			</div>
		</div>

	</footer>	
		



	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="js/headroom.min.js"></script>
	<script src="js/jQuery.headroom.min.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>
