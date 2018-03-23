package kr.co.knoc.gov_public;

import java.util.Date;

public class GovPublicFileBean {

	int gov_public_file_seq;
	int gov_public_nid;
	String org_file_nm;
	String save_file_nm;
	String file_path;
	Date reg_date;
	int status_no;
	String file_title;
	
	public String getFile_title() {
		return file_title;
	}
	public void setFile_title(String file_title) {
		this.file_title = file_title;
	}
	public int getGov_public_file_seq() {
		return gov_public_file_seq;
	}
	public void setGov_public_file_seq(int gov_public_file_seq) {
		this.gov_public_file_seq = gov_public_file_seq;
	}
	public int getGov_public_nid() {
		return gov_public_nid;
	}
	public void setGov_public_nid(int gov_public_nid) {
		this.gov_public_nid = gov_public_nid;
	}
	public String getOrg_file_nm() {
		return org_file_nm;
	}
	public void setOrg_file_nm(String org_file_nm) {
		this.org_file_nm = org_file_nm;
	}
	public String getSave_file_nm() {
		return save_file_nm;
	}
	public void setSave_file_nm(String save_file_nm) {
		this.save_file_nm = save_file_nm;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getStatus_no() {
		return status_no;
	}
	public void setStatus_no(int status_no) {
		this.status_no = status_no;
	}
	@Override
	public String toString() {
		return "GovPublicFileBean [gov_public_file_seq=" + gov_public_file_seq
				+ ", gov_public_nid=" + gov_public_nid + ", org_file_nm="
				+ org_file_nm + ", save_file_nm=" + save_file_nm
				+ ", file_path=" + file_path + ", reg_date=" + reg_date
				+ ", status_no=" + status_no + "]";
	}
}
