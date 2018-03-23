package kr.co.knoc.tags.pager;

public class PageAnchor {
	private int page;
	private String anchor;
	private boolean empty;
	
	public PageAnchor() {
		page = 1;
		anchor = "javascript:void(0);";
		empty = true;
	}
	public boolean getEmpty()  {
		return this.empty;
	}
	public void setEmpty(boolean empty) {
		this.empty = empty;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	public String getAnchor() {
		return anchor;
	}
	public void setAnchor(String anchor) {
		this.anchor = anchor;
	}
	
	public String getAnchor(String attach) {
		if(empty) return anchor;
		else return anchor + attach;
	}
}