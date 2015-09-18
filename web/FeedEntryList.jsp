<%-- 
    Document   : FeedEntryList
    Created on : Nov 27, 2013, 10:46:58 PM
    Author     : gjk
--%>
<%@page import="java.net.URL"%>
<%@page import="dao.*"%>
<%@page import="Db.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP Page</title>

		<link rel="stylesheet"
			href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

		<script>
	$(function() {
		$("#accordion").accordion();
	});
</script>

	</head>

	<body>

		<%
			java.util.Properties systemSettings = System.getProperties();

			systemSettings.put("http.proxyHost", "mywebcache.com");

			systemSettings.put("http.proxyPort", "8080");

			System.setProperties(systemSettings);

			System.out.println("feedentrylist");

			String urlStr = request.getParameter("url");

			System.out.println("url in feedentrylist is:" + urlStr);

			if (urlStr == null) {
				System.out.println("test1");
				urlStr = "http://rss.sina.com.cn/news/marquee/ddt.xml";

			}
			//String urlStr = "http://feeds.feedburner.com/GoogleEarthBlog";

			java.net.URLConnection feedUrl = new java.net.URL(urlStr)
					.openConnection();

			feedUrl.setRequestProperty("User-Agent",
					"Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");

			com.sun.syndication.io.SyndFeedInput input = new com.sun.syndication.io.SyndFeedInput();

			com.sun.syndication.feed.synd.SyndFeed feed = input
					.build(new com.sun.syndication.io.XmlReader(feedUrl));
		%>


		<div id="accordion">
			<!-- http://jqueryui.com/accordion/ -->

			<%
				java.util.List list = feed.getEntries();

				for (int i = 0; i < list.size(); i++) {

					com.sun.syndication.feed.synd.SyndEntry entry = (com.sun.syndication.feed.synd.SyndEntry) list.get(i);
			%>

			<h3><%=entry.getTitle()%>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<%=entry.getPublishedDate()%></h3>
			<div>
				<p>
					<%=entry.getDescription().getValue()%>
                                </p>
                                <br>
                                <br>
                                <p><b>
                                        <a href="news_clip.jsp?aid=-1&afid=-1&atitle=<%=entry.getTitle()%>&link=<%=entry.getLink()%>&content="Please copy and paste news article">save this page to news clip</a>
                                </b></p>
                                <p><b>
					link :
					<a href="<%=entry.getLink()%>"><%=entry.getTitle()%></a>
                                </b></p>
			</div>

			<%
				}
			%>

		</div>

	</body>
</html>
