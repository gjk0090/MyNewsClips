/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author gjk
 */
public class ArticleFolder {
        private Integer article_folder_id;
	private Integer uid;
	private String name;
	public Integer getArticle_folder_id() {
		return article_folder_id;
	}
	public void setArticle_folder_id(Integer articleFolderId) {
		article_folder_id = articleFolderId;
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
