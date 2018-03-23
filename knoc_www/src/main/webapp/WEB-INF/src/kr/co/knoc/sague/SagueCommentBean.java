package kr.co.knoc.sague;

import java.util.Date;

public class SagueCommentBean {
	
	private int comment_nid;
	private int	sague_nid;
	private String user_name;
	private String tel_no;
	private String user_opinion;
	private Date reg_date;
	private Date mod_date;
	private int status_no;
	private String vertual_no;
	
	public String getVertual_no() {
		return vertual_no;
	}
	public void setVertual_no(String vertual_no) {
		this.vertual_no = vertual_no;
	}
	public int getComment_nid() {
		return comment_nid;
	}
	public void setComment_nid(int comment_nid) {
		this.comment_nid = comment_nid;
	}
	public int getSague_nid() {
		return sague_nid;
	}
	public void setSague_nid(int sague_nid) {
		this.sague_nid = sague_nid;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getTel_no() {
		return tel_no;
	}
	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}
	public String getUser_opinion() {
		return user_opinion;
	}
	public void setUser_opinion(String user_opinion) {
		this.user_opinion = user_opinion;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getMod_date() {
		return mod_date;
	}
	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}
	public int getStatus_no() {
		return status_no;
	}
	public void setStatus_no(int status_no) {
		this.status_no = status_no;
	}
	
	@Override
	public String toString() {
		return "SagueCommentBean [comment_nid=" + comment_nid + ", sague_nid="
				+ sague_nid + ", user_name=" + user_name + ", tel_no=" + tel_no
				+ ", user_opinion=" + user_opinion + ", reg_date=" + reg_date
				+ ", mod_date=" + mod_date + ", status_no=" + status_no + "]";
	}
	
}
