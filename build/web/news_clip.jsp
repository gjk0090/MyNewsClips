<%-- 
    Document   : news_clip
    Created on : Dec 1, 2013, 6:50:04 AM
    Author     : gjk
--%>

<%@page import="dao.*"%>
<%@page import="Db.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>RSS_Reader</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
                
                <script src="http://code.jquery.com/jquery-1.9.1.js"></script>

		<link href="css/bootstrap.css" rel="stylesheet">
		<style type="text/css">
                    body {
                            padding-top: 60px;
                            padding-bottom: 40px;
                    }

                    .sidebar-nav {
                            padding: 9px 0;
                    }

                    @media ( max-width : 980px) { /* Enable use of floated navbar text */
                            .navbar-text.pull-right {
                                    float: none;
                                    padding-left: 5px;
                                    padding-right: 5px;
                            }
                    }

                    .form-signin {
                            max-width: 300px;
                            padding: 19px 29px 29px;
                            margin: 0 auto 20px;
                            background-color: #fff;
                            border: 1px solid #e5e5e5;
                            -webkit-border-radius: 5px;
                            -moz-border-radius: 5px;
                            border-radius: 5px;
                            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
                            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
                            box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
                    }

                    .form-signin .form-signin-heading,.form-signin .checkbox {
                            margin-bottom: 10px;
                    }

                    .form-signin input[type="text"],.form-signin input[type="password"] {
                            font-size: 16px;
                            height: auto;
                            margin-bottom: 15px;
                            padding: 7px 9px;
                    }
                </style>
		<link href="css/bootstrap-responsive.css" rel="stylesheet">


	</head>

	<body>

		<!-- add,file pop out here -->
		<div id="add"
			style="height: 0px; width: 0px; position: absolute; z-index: 3; background-color: #fff; display: none;">
			<div class="container">

				<form class="form-signin">
					<h2 class="form-signin-heading">
						Add new seed
					</h2>
					<input type="text" class="input-block-level" placeholder="url">
					<select id="category" onchange="getOption(this.value)">
						category
						<option value="1">
							category1
						</option>
						<option value="2">
							category2
						</option>
						<option value="3">
							category3
						</option>
					</select>
					<button class="btn btn btn-primary" type="submit"
						style="float: left; margin-left: 140px; margin-top: 15px; width: 70px;"
						onclick="Lock_CheckForm('add');">
						Add
					</button>
					<button name="actiontype" value="cancel"
                                                class="btn btn btn-default"
						onclick="Lock_CheckForm('add')"
						style="margin-left: 15px; margin-top: 15px;">
						Cancel
					</button>
				</form>
			</div>
		</div>
		<div id="file"
			style="height: 0px; width: 0px; position: absolute; z-index: 3; background-color: #fff; display: none;">
			<div class="container">

				<form class="form-signin">
					<h2 class="form-signin-heading">
						Add file
					</h2>
					<input type="text" class="input-block-level"
						placeholder="file name">
					<button class="btn btn btn-primary" type="submit"
						style="float: left; margin-left: 140px; margin-top: 15px; width: 70px;"
						onclick="Lock_CheckForm('file');">
						Confirm
					</button>
					<button name="actiontype" value="cancel"
                                                class="btn btn btn-default"
						onclick="Lock_CheckForm('file')"
						style="margin-left: 15px; margin-top: 15px;">
						Cancel
					</button>
				</form>
			</div>
		</div>
		<!-- add,file pop out here -->


		<!-- user login -->
		<div id="login" align="center"
			style="height: 0px; width: 0px; position: absolute; z-index: 3;  background-color: #fff; display: none;">
			<div class="container">

				<form class="form-signin" method="post"
					action="/My_News_Clips/UserServlet">
					<h2 class="form-signin-heading">
						Please sign in
					</h2>
					<input id="email0" name="username" type="text"
						class="input-block-level" placeholder="Email address">
					<input id="psw0" name="password" type="password"
						class="input-block-level" placeholder="Password">
					<label class="checkbox">
						<input type="checkbox" value="remember-me">
						Remember me
					</label>
					<button name="actiontype" value="login"
						class="btn btn-large btn-primary" type="submit"
						style="float: left; margin-left: 40px;" onclick="LoginCheck()">
						Sign in
					</button>
					<button name="actiontype" value="cancel"
                                                class="btn btn-large btn-default"
						onclick="Lock_CheckForm('login')" style="margin-left: 15px">
						Cancel
					</button>
					<p style="float: right;">
						<a href="#" onclick="locking('createnew');">create new user</a>
					</p>
				</form>

			</div>
		</div>
		<!--log in pop out ends -->

		<div id="ly"
			style="position: absolute; top: 0px; filter: alpha(opacity = 60); background-color: #000777; z-index: 2; left: 0px; display: none;">
		</div>


		<!-- create user -->
		<div id="createnew" align="center"
			style="height: 0px; width: 0px; position: absolute; z-index: 4;  background-color: #fff; display: none;">
			<div class="container">

				<form class="form-signin" method="post"
					action="/My_News_Clips/UserServlet">
					<h2 class="form-signin-heading">
						Create new user
					</h2>
					<input id="email1" "username" name="username" type="text" class="input-block-level"
						placeholder="Email address">
					<input id="psw1" name="password" type="password"
						class="input-block-level" placeholder="Password">
					<input id="psw2" name="repassword" type="password"
						class="input-block-level" placeholder="Re-enter Password">
					<button name="actiontype" value="register"
						class="btn btn-large btn-primary" type="submit"
						style="margin-left: 10px;" onclick="CreateCheck()">
						Create
					</button>
					<button name="actiontype" value="cancel"
                                                class="btn btn-large btn-default"
						onclick="Lock_CheckForm('createnew');Lock_CheckForm('login');
						"
						style="margin-left: 15px">
						Cancel
					</button>
				</form>
			</div>
		</div>
		<!--create user pop out ends here-->

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
							<li class="active">
								<a href="news_clip.jsp">My Clips</a>
							</li>
							<li>
								<a href="about.jsp">About</a>
							</li>


						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</div>
                <!-- navigation bar ends-->
                               
                <!--/.fluid-container-->
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span3">
					<div class="well sidebar-nav">
						<ul class="nav nav-list">

							<%
								int uid = FinalFactory.getUserDAOInstance().findIdByUserName(username);

								ArrayList<ArticleFolder> articlefolder = new ArrayList<ArticleFolder>();

								articlefolder = FinalFactory.getRssDAOInstance().findArticleFolderByUserID(uid);
							%>

							<!-- rss menu -->

							<%
								if (!articlefolder.isEmpty()) {

									Iterator<ArticleFolder> it = articlefolder.iterator();
									int count = 0;
									while (it.hasNext()) {
										ArticleFolder af = it.next();
										count++;
							%>
							<li class="nav-header" onclick="dropdown('<%=count%>')">
                                                            
								<a href="#"><%=af.getName()%></a>
                                                                
							</li>
                                                        
							<ul id="<%=count%>" style="display: none">

								<%
									ArrayList<Article> articlelist = new ArrayList<Article>();
									articlelist = FinalFactory.getRssDAOInstance().findArticleFromUidFolderID(uid,af.getArticle_folder_id());

									Iterator<Article> itarticles = articlelist.iterator();

									while (itarticles.hasNext()) {
										Article article = itarticles.next();

								%>

								<li>
									<a href="news_clip.jsp?atitle=<%=article.getAtitle()%>&content=<%=article.getContent()%>&aid=<%=article.getAid()%>&link=<%=article.getLink()%>&afid=<%=article.getAFid()%>"><%=article.getAtitle()%></a>
								</li>

								<%
									}
								%>
							</ul>
							<%
								}
								}else{
                                                        %>        
                                                        <br>
                                                        <br>
                                                        <li style="font-size:18px;">your</li>
                                                        <li style="font-size:18px;">clips</li>
                                                        <li style="font-size:18px;">will</li>
                                                        <li style="font-size:18px;">be</li>
                                                        <li style="font-size:18px;">displayed</li>
                                                        <li style="font-size:18px;">here</li>
                                                        <br>
                                                        <br>
                                                        <%        
                                                                }
							%>

						</ul>
					</div>
					<!--/.well -->
				</div>
				<!--/span-->

				<!-- rss contents -->
				<div class="span9">

					<%
						String atitle = request.getParameter("atitle");
                                                String content = request.getParameter("content");
                                                String aid = request.getParameter("aid");
                                                String link = request.getParameter("link");
                                                String afid = request.getParameter("afid");
					%>

					<% if(session.getAttribute("name")!=null && ""!=session.getAttribute("name") && atitle!=null){ %>
                                            <jsp:include page="article_editor.jsp" flush="true">
                                                <jsp:param name="atitle" value="<%=atitle%>" />
                                                <jsp:param name="content" value="<%=content%>" />
                                                <jsp:param name="aid" value="<%=aid%>" />
                                                <jsp:param name="link" value="<%=link%>" />
                                                <jsp:param name="afid" value="<%=afid%>" />
                                            </jsp:include>
                                        <%}else if(session.getAttribute("name")!=null && ""!=session.getAttribute("name") && atitle==null){%>
                                        <div class="hero-unit" style="height:150px;">
                                        Welcome to newspaper clips!
                                        <br>
                                        Please click on an article to start editing!
                                        </div>
                                        <%}else{%>
                                        
                                        <div class="hero-unit" style="height:150px;">
                                        Welcome to newspaper clips!
                                        <br>
                                        Please log in or register to see more!
                                        </div>
                                        
                                        <%}%>


				</div>
				<!--/span-->
			</div>
			<!--/row-->
			<hr>

			<footer>
			<p>
				&copy; Jisen_Junkai_Lingyun_Yifan_INFSCI2560_Web Final
			</p>
			</footer>

		</div>
		<!--/.fluid-container ends-->

		<script type="text/javascript">
                    
                    function LoginCheck(){
                      var m0 = document.getElementById("email0").value;
                      var z = document.getElementById("psw0").value;
                       if(m0 == "" || z == ""){
                        alert("cannot be null value");
                        return;
                        }
                      Lock_CheckForm('login');
                    }

                    function CreateCheck(){
                       var m1 = document.getElementById("email1").value;
                       var x =  document.getElementById("psw1").value;
                       var y = document.getElementById("psw2").value;
                       if(m1 == "" || x == "" || y == "")
                       {
                        alert("cannot be null value");
                        return;
                       }
                       if(x != y){
                        alert("the password cannot be different");
                        return;
                       }
                       Lock_CheckForm('createnew');
                       Lock_CheckForm('ly'); 

                    }

                    /*show and hide function*/
                    var counter=0;
                    function dropdown(id){
                      if(counter==0)
                      showlist(id);
                      else if(counter==1)
                      hidelist(id);
                    }

                    function showlist(id){
                        document.getElementById(id).style.display='block';
                      counter=1;

                    }
                    function hidelist(id){
                        document.getElementById(id).style.display='none';
                      counter=0;
                    }

                  /* log in pop out  */
                   function  locking(id){ 
                    /*document.all.ly.style.display="block"; 
                    document.all.ly.style.width=document.body.clientWidth; 
                    document.all.ly.style.height=document.body.clientHeight; 
                    document.all.login.style.display='block'; */
                    document.getElementById(id).style.display='block';

                    } 

                   function  Lock_CheckForm(id){ 
                    document.all.ly.style.display='none';document.getElementById(id).style.display='none';
                    return  false; 
                    }

            </script>
            
	</body>
</html>
