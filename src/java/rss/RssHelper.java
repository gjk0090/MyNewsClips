package rss;

import com.sun.syndication.feed.synd.SyndFeed;

public interface RssHelper {
	
	public SyndFeed fetchRss(String feedUrl);

}
