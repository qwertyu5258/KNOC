package kr.co.knoc.sague;

import oracle.sql.DATE;

public class SagueFileBean {
	
	private int sague_nid;
	private int file_nid;
	private DATE reg_date;
	private DATE mod_date;
	private String org_filenm;
	private String save_filenm;
	private String file_path;
	private int status_no;
	private String last_modifier;
	private int file_size;
	
	public int getSague_nid() {
		return sague_nid;
	}
	public void setSague_nid(int sague_nid) {
		this.sague_nid = sague_nid;
	}
	public int getFile_nid() {
		return file_nid;
	}
	public void setFile_nid(int file_nid) {
		this.file_nid = file_nid;
	}
	public DATE getReg_date() {
		return reg_date;
	}
	public void setReg_date(DATE reg_date) {
		this.reg_date = reg_date;
	}
	public DATE getMod_date() {
		return mod_date;
	}
	public void setMod_date(DATE mod_date) {
		this.mod_date = mod_date;
	}
	public String getOrg_filenm() {
		return org_filenm;
	}
	public void setOrg_filenm(String org_filenm) {
		this.org_filenm = org_filenm;
	}
	public String getSave_filenm() {
		return save_filenm;
	}
	public void setSave_filenm(String save_filenm) {
		this.save_filenm = save_filenm;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public int getStatus_no() {
		return status_no;
	}
	public void setStatus_no(int status_no) {
		this.status_no = status_no;
	}
	public String getLast_modifier() {
		return last_modifier;
	}
	public void setLast_modifier(String last_modifier) {
		this.last_modifier = last_modifier;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	@Override
	public String toString() {
		return "SagueFileBean [sague_nid=" + sague_nid + ", file_nid="
				+ file_nid + ", reg_date=" + reg_date + ", mod_date="
				+ mod_date + ", org_filenm=" + org_filenm + ", save_filenm="
				+ save_filenm + ", file_path=" + file_path + ", status_no="
				+ status_no + ", last_modifier=" + last_modifier
				+ ", file_size=" + file_size + "]";
	}
	
	
	
}
