package kr.co.knoc.sague;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SagueBean {
	private int sague_nid;
	private String subject;
	private String reason;
	private String contents;
	private String opinion;
	private String opinion_term;
	private String department;
	private String representatives;
	private String tel_no;
	private String fax_no;
	private String email;
	private Date reg_date;
	private Date mod_date;
    private String reg_id;
	private String mod_id;
    private int status_no;
    private int click_cnt;
    private int comment_cnt;
    
	public int getComment_cnt() {
		return comment_cnt;
	}
	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	public int getSague_nid() {
		return sague_nid;
	}
	public void setSague_nid(int sague_nid) {
		this.sague_nid = sague_nid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	public String getOpinion_term() {
		return opinion_term;
	}
	public void setOpinion_term(String opinion_term) {
		this.opinion_term = opinion_term;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getRepresentatives() {
		return representatives;
	}
	public void setRepresentatives(String representatives) {
		this.representatives = representatives;
	}
	public String getTel_no() {
		return tel_no;
	}
	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}
	public String getFax_no() {
		return fax_no;
	}
	public void setFax_no(String fax_no) {
		this.fax_no = fax_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	
	public String getRegDateString(String pattern) {
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		if(reg_date == null) return df.format(new Date());
		return df.format(this.reg_date);
	}
	public void setRegDateString(String format, String value) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    try {
	        this.reg_date = df.parse(value);
	    }catch(ParseException e) { ; }
	}
	
	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getMod_id() {
		return mod_id;
	}
	public void setMod_id(String mod_id) {
		this.mod_id = mod_id;
	}
	public int getStatus_no() {
		return status_no;
	}
	public void setStatus_no(int status_no) {
		this.status_no = status_no;
	}
	public void setClick_cnt(int click_cnt) {
		this.click_cnt = click_cnt;
	}
	public int getClick_cnt() {
		return click_cnt;
	}
	
	@Override
	public String toString() {
		return "SagueBean [sague_nid=" + sague_nid + ", subject=" + subject
				+ ", reason=" + reason + ", contents=" + contents
				+ ", opinion=" + opinion + ", opinion_term=" + opinion_term
				+ ", department=" + department + ", representatives="
				+ representatives + ", tel_no=" + tel_no + ", fax_no=" + fax_no
				+ ", email=" + email + ", reg_date=" + reg_date + ", mod_date="
				+ mod_date + ", reg_id=" + reg_id + ", mod_id=" + mod_id
				+ ", status_no=" + status_no + ", click_cnt=" + click_cnt + "]";
	}
    
}
