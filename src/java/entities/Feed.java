package entities;

public class Feed {

	private Integer fid;
	private String url;
	private String ftitle;

	public String getFtitle() {
		return ftitle;
	}

	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}

	public Integer getFid() {
		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
