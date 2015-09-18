<%-- 
    Document   : about
    Created on : Dec 1, 2013, 6:50:04 AM
    Author     : gjk
--%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>RSS_Reader</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
                
               <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">

	</head>

	<body>

		

<!-- navigation bar-->
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					<button type="button" class="btn btn-navbar" data-toggle="collapse"
						data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="brand">My News Clips</a>
					<div class="nav-collapse collapse">
						<p class="navbar-text pull-right">

							<%
								String username = (String) session.getAttribute("name");
								if (username != null && !username.equals(" ")) {
							%>

							Welcome
							<a href="#" class="navbar-link"><%=username%></a>
							<a href="Logout.jsp">log out</a>

							<%
								} else {
							%>
							Welcome, visitor
							<a href="#" onclick="locking('login')">log in</a>

							<%
								}
							%>

							&nbsp;&nbsp;

						</p>
						<ul class="nav">
							<li>
								<a href="RSS_reader.jsp">RSS reader</a>
							</li>
							<li>
								<a href="news_clip.jsp">My Clips</a>
							</li>
							<li class="active">
								<a href="about.jsp">About</a>
							</li>


						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</div>
                <!-- navigation bar ends-->
    <div class="page-header"><h2>System Design</h2></div>
    <img id="image0"  src="img/design.jpg" alt="system design"  width="740" class="img-rounded">

    <div class="page-header"><h2>Member introduction</h2></div>
    <img id="image1" onclick="introduction(image1);" src="img/Jisen.jpg" alt="jisen" height="140" width="240" class="img-rounded">
    <img id="image2" onclick="introduction(image2);" src="img/Yifan.jpg" alt="yifan" height="140" width="157" class="img-rounded">
    <img id="image3" onclick="introduction(image3);" src="img/junkai.jpg" alt="Junkai" height="140" width="140" class="img-rounded">
    <img id="image4" onclick="introduction(image4);" src="img/Lingyun.jpg" alt="lingyun" height="140" width="240" class="img-rounded">

    
      <hr>

      <footer>
        <p>&copy; Jisen_Junkai_Lingyun_Yifan_INFSCI2560_Web Final</p>
      </footer>

            
	</body>
</html>
