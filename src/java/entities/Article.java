/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author gjk
 */
public class Article {
        private Integer aid;
        private Integer uid;
        private Integer article_folder_id;
	private String link;
	private String atitle;
        private String content;

	public String getAtitle() {
		return atitle;
	}

	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}
        
        public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}
        
        public Integer getAFid() {
		return article_folder_id;
	}

	public void setAFid(Integer article_folder_id) {
		this.article_folder_id = article_folder_id;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
        
        public String getContent() {
		return content;
	}

	public void setontent(String content) {
		this.content = content;
	}
}
