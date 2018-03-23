package kr.co.knoc.koroil;

public class KoroilBean {
	private int no; 
	private String recentdt;
	private String gas_name;
	private String gas_num;
	private String gas_rate;
	private String via_name;
	private String via_num;
	private String via_rate;
	private String butane_name;
	private String butain_num;
	private String butain_rate;
	private String access_date;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getRecentdt() {
		return recentdt;
	}
	public void setRecentdt(String recentdt) {
		this.recentdt = recentdt;
	}
	public String getGas_name() {
		return gas_name;
	}
	public void setGas_name(String gas_name) {
		this.gas_name = gas_name;
	}
	public String getGas_num() {
		return gas_num;
	}
	public void setGas_num(String gas_num) {
		this.gas_num = gas_num;
	}
	public String getGas_rate() {
		return gas_rate;
	}
	public void setGas_rate(String gas_rate) {
		this.gas_rate = gas_rate;
	}
	public String getVia_name() {
		return via_name;
	}
	public void setVia_name(String via_name) {
		this.via_name = via_name;
	}
	public String getVia_num() {
		return via_num;
	}
	public void setVia_num(String via_num) {
		this.via_num = via_num;
	}
	public String getVia_rate() {
		return via_rate;
	}
	public void setVia_rate(String via_rate) {
		this.via_rate = via_rate;
	}
	public String getButane_name() {
		return butane_name;
	}
	public void setButane_name(String butane_name) {
		this.butane_name = butane_name;
	}
	public String getButain_num() {
		return butain_num;
	}
	public void setButain_num(String butain_num) {
		this.butain_num = butain_num;
	}
	public String getButain_rate() {
		return butain_rate;
	}
	public void setButain_rate(String butain_rate) {
		this.butain_rate = butain_rate;
	}
	public String getAccess_date() {
		return access_date;
	}
	public void setAccess_date(String access_date) {
		this.access_date = access_date;
	}
	
	@Override
	public String toString() {
		return "KoroilBean [no=" + no + ", recentdt=" + recentdt
				+ ", gas_name=" + gas_name + ", gas_num=" + gas_num
				+ ", gas_rate=" + gas_rate + ", via_name=" + via_name
				+ ", via_num=" + via_num + ", via_rate=" + via_rate
				+ ", butane_name=" + butane_name + ", butain_num=" + butain_num
				+ ", butain_rate=" + butain_rate + ", access_date="
				+ access_date + "]";
	}
	
}
