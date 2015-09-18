package entities;

public class FeedFolder {
	
	private Integer feed_folder_id;
	private Integer uid;
	private String name;
	public Integer getFeed_folder_id() {
		return feed_folder_id;
	}
	public void setFeed_folder_id(Integer feedFolderId) {
		feed_folder_id = feedFolderId;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
