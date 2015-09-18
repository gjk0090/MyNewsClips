package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import Db.JdbcUtils;
import entities.*;

public class RssDAOImpl implements RssDAO {

	private static Connection conn = null;
	private static PreparedStatement prep = null;
	private static ResultSet rs = null;

	public ArrayList<FeedFolder> findFolderByUserID(Integer uid) {
		conn = JdbcUtils.getConnection();
		ArrayList<FeedFolder> list = new ArrayList<FeedFolder>();
		String sql = "select * from feed_folder where uid=?";
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, uid);
			rs = prep.executeQuery();
			while (rs.next()) {
				FeedFolder feedfolder = new FeedFolder();
				feedfolder.setFeed_folder_id(rs.getInt("feed_folder_id"));
				feedfolder.setUid(rs.getInt("uid"));
				feedfolder.setName(rs.getString("name"));
				list.add(feedfolder);
			}

		} catch (SQLException ex) {
			Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
					null, ex);
		} finally {
			JdbcUtils.close(rs, prep, conn);
		}
		return list;
	}

	public Feed findFeedByFeedID(Integer fid) {
		conn = JdbcUtils.getConnection();
		Feed feed = new Feed();

		String sql = "select * from feed where fid=?";
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, fid);
			rs = prep.executeQuery();
			while (rs.next()) {
				feed.setFid(fid);
				feed.setUrl(rs.getString("url"));
				feed.setFtitle(rs.getString("ftitle"));
			}

		} catch (SQLException ex) {
			Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
					null, ex);
		} finally {
			JdbcUtils.close(rs, prep, conn);
		}
		return feed;
	}

	// find feed.url feed.title by feed_folder_id and uid
	// return list of feeds
	public ArrayList<Feed> findFeedFromUidFolderID(Integer uid,
			Integer feedFolderId) {
		conn = JdbcUtils.getConnection();
		ArrayList<Feed> feedlist = new ArrayList<Feed>();
		String sql = "select feed.fid, feed.url, feed.ftitle from feed, subscribe where feed.fid = subscribe.fid"
				+ " and subscribe.uid="
				+ uid
				+ " and feed_folder_id="
				+ feedFolderId;

		try {
			prep = conn.prepareStatement(sql);
			rs = prep.executeQuery();
			while (rs.next()) {
				Feed feed = new Feed();

				feed.setFid(rs.getInt("fid"));
				feed.setUrl(rs.getString("url"));
				feed.setFtitle(rs.getString("ftitle"));
				feedlist.add(feed);
			}

		} catch (SQLException ex) {
			Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
					null, ex);
		} finally {
			JdbcUtils.close(rs, prep, conn);
		}

		return feedlist;
	}
        
        public ArrayList<ArticleFolder> findArticleFolderByUserID(Integer uid) {
		conn = JdbcUtils.getConnection();
		ArrayList<ArticleFolder> list = new ArrayList<ArticleFolder>();
		String sql = "select * from article_folder where uid=?";
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, uid);
			rs = prep.executeQuery();
			while (rs.next()) {
				ArticleFolder articleFolder = new ArticleFolder();
				articleFolder.setArticle_folder_id(rs.getInt("article_folder_id"));
				articleFolder.setUid(rs.getInt("uid"));
				articleFolder.setName(rs.getString("name"));
				list.add(articleFolder);
			}

		} catch (SQLException ex) {
			Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
					null, ex);
		} finally {
			JdbcUtils.close(rs, prep, conn);
		}
		return list;
	}
        
        public ArrayList<Article> findArticleFromUidFolderID(Integer uid,
			Integer articleFolderId) {
		conn = JdbcUtils.getConnection();
		ArrayList<Article> articlelist = new ArrayList<Article>();
		String sql = "select article.aid, article.link, article.atitle, article.content, article.uid, article.article_folder_id from article where"
				+ " uid="
				+ uid
				+ " and article_folder_id="
				+ articleFolderId;

		try {
			prep = conn.prepareStatement(sql);
			rs = prep.executeQuery();
			while (rs.next()) {
				Article article = new Article();

				article.setAid(rs.getInt("aid"));
                                article.setUid(rs.getInt("uid"));
				article.setAFid(rs.getInt("article_folder_id"));

				article.setLink(rs.getString("link"));
				article.setAtitle(rs.getString("atitle"));
				article.setontent(rs.getString("content"));
				articlelist.add(article);
			}

		} catch (SQLException ex) {
			Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
					null, ex);
		} finally {
			JdbcUtils.close(rs, prep, conn);
		}

		return articlelist;
	}

    @Override
    public void addFeedIntoFolder(String feedURL, String name) {
        
		conn = JdbcUtils.getConnection();
		String sql = "insert into feed values(null,?,?)";
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, feedURL);
			prep.setString(2, name);
			prep.executeUpdate();

		} catch (SQLException ex) {
			Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
					null, ex);
		} finally {
			try {
				conn.close();
				prep.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
        
    }

    @Override
    public void addSubscribe(Integer uid, Integer fid, Integer feed_folder_id) {
        conn = JdbcUtils.getConnection();
		String sql = "insert into subscribe values(?,?,?)";
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, uid);
			prep.setInt(2, fid);
                        prep.setInt(3, feed_folder_id);
			prep.executeUpdate();

		} catch (SQLException ex) {
			Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
					null, ex);
		} finally {
			try {
				conn.close();
				prep.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
    }

    @Override
    public int findFidByUrl(String url) {
        
        int fid = 0;
        conn = JdbcUtils.getConnection();
        
		String sql = "select fid from feed where url=?";
		try {
			prep = conn.prepareStatement(sql);
			prep.setString(1, url);
			rs = prep.executeQuery();
			while (rs.next()) {
				fid = rs.getInt("fid");
			}

		} catch (SQLException ex) {
			Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
					null, ex);
		} finally {
			JdbcUtils.close(rs, prep, conn);
		}
        return fid;
    }

    @Override
    public void addfolder(Integer uid, String foldername) {
        
                conn = JdbcUtils.getConnection();
		String sql = "insert into feed_folder values(null,?,?)";
		try {
			prep = conn.prepareStatement(sql);
			prep.setInt(1, uid);
                        prep.setString(2, foldername);
			prep.executeUpdate();

		} catch (SQLException ex) {
			Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
					null, ex);
		} finally {
			try {
				conn.close();
				prep.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
        
        
    }
    
    @Override
    public void addArticle(String aid, String atitle, String content, String link, int uid, String afid){
                conn = JdbcUtils.getConnection();
                
                if(aid.equals("-1")){
                    
                    String sql = "insert into article values(null,?,?,?,?,?)";
                    try {
                            prep = conn.prepareStatement(sql);
                            prep.setString(1, atitle);
                            prep.setString(2, content);
                            prep.setInt(3, uid);
                            prep.setInt(4, Integer.parseInt(afid));
                            prep.setString(5, link);
                            
                            prep.executeUpdate();

                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    } finally {
                            try {
                                    conn.close();
                                    prep.close();
                            } catch (SQLException e) {
                                    e.printStackTrace();
                            }
                    }
                }else{
                    	String sql = "update article set content=? where aid=?";
                        try {
                                prep = conn.prepareStatement(sql);
                                prep.setString(1, content);
                                prep.setInt(2, Integer.parseInt(aid));
                              
                                prep.executeUpdate();

                        } catch (SQLException ex) {
                                Logger.getLogger(UserDAOImpl.class.getName()).log(Level.SEVERE,
                                                null, ex);
                        } finally {
                                try {
                                        conn.close();
                                        prep.close();
                                } catch (SQLException e) {
                                        e.printStackTrace();
                                }
                        }
                }
                
                

    }

    
    
}