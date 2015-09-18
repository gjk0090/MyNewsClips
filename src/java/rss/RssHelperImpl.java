package rss;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

public class RssHelperImpl implements RssHelper {

	public SyndFeed fetchRss(String url) {

		SyndFeedInput input = null;
		SyndFeed feed = null;

		try {

			URLConnection feedUrl = new URL(url).openConnection();

			feedUrl.setRequestProperty("User-Agent",
					"Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");

			input = new SyndFeedInput();

			feed = input.build(new XmlReader(feedUrl));

		} catch (IllegalArgumentException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (FeedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return feed;
	}

}
