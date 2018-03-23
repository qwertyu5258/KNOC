package kr.co.knoc.gov_public;

import java.sql.Date;

public class GovPublicBean {

	private int gov_public_nid;
	private int gov_public_kind;
	private String gov_public_kind_nm;
	private String title;
	private String department;
	private String public_time;
	private String public_cycle;
	private String public_link;
	private String reg_id;
	private String mod_id;
	private Date reg_dt;
	private Date mod_dt;
	private int status_no;
	
	public int getGov_public_nid() {
		return gov_public_nid;
	}
	public void setGov_public_nid(int gov_public_nid) {
		this.gov_public_nid = gov_public_nid;
	}
	public int getGov_public_kind() {
		return gov_public_kind;
	}
	public void setGov_public_kind(int gov_public_kind) {
		this.gov_public_kind = gov_public_kind;
	}
	public String getGov_public_kind_nm() {
		return gov_public_kind_nm;
	}
	public void setGov_public_kind_nm(String gov_public_kind_nm) {
		this.gov_public_kind_nm = gov_public_kind_nm;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPublic_time() {
		return public_time;
	}
	public void setPublic_time(String public_time) {
		this.public_time = public_time;
	}
	public String getPublic_cycle() {
		return public_cycle;
	}
	public void setPublic_cycle(String public_cycle) {
		this.public_cycle = public_cycle;
	}
	public String getPublic_link() {
		return public_link;
	}
	public void setPublic_link(String public_link) {
		this.public_link = public_link;
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
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public Date getMod_dt() {
		return mod_dt;
	}
	public void setMod_dt(Date mod_dt) {
		this.mod_dt = mod_dt;
	}
	public int getStatus_no() {
		return status_no;
	}
	public void setStatus_no(int status_no) {
		this.status_no = status_no;
	}
	@Override
	public String toString() {
		return "GovPublicBean [gov_public_nid=" + gov_public_nid
				+ ", gov_public_kind=" + gov_public_kind
				+ ", gov_public_kind_nm=" + gov_public_kind_nm + ", title="
				+ title + ", department=" + department + ", public_time="
				+ public_time + ", public_cycle=" + public_cycle
				+ ", public_link=" + public_link + ", reg_id=" + reg_id
				+ ", mod_id=" + mod_id + ", reg_dt=" + reg_dt + ", mod_dt="
				+ mod_dt + ", status_no=" + status_no + "]";
	}
}
