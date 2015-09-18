package dao;

import entities.Article;
import entities.ArticleFolder;
import java.util.ArrayList;

import entities.Feed;
import entities.FeedFolder;

public interface RssDAO {

	// find folder that created by user
	// return list of feed folder
	public ArrayList<FeedFolder> findFolderByUserID(Integer uid);

	// find  feed by fid
	public Feed findFeedByFeedID(Integer fid);

	// find feed.url feed.title by feed_folder_id and uid
	// return list of feeds
	public ArrayList<Feed> findFeedFromUidFolderID (Integer uid, Integer feed_folder_id);
        
        public ArrayList<ArticleFolder> findArticleFolderByUserID(Integer uid);
        
        public ArrayList<Article> findArticleFromUidFolderID(Integer uid, Integer articleFolderId);
        
        //add feed into folder
        //alter feed  subscribe
        //return new fid id
        public void addFeedIntoFolder(String feedURL, String name);
        
        public void addSubscribe (Integer uid, Integer fid, Integer feed_folder_id);
        
        public int findFidByUrl (String url);
        
        public void addfolder(Integer uid, String foldername);
        
        public void addArticle(String aid, String atitle, String content, String link, int uid, String afid);
        
}
