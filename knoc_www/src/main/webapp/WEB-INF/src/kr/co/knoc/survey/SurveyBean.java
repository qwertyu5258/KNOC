package kr.co.knoc.survey;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SurveyBean {
	private int surveyNum;
	private String title;
	private String purpose;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;
	private String creator;
	private String serviceFlag;
	private int maxVote;
	private int totalVote;
	private Date createDate;
	private String dupleType;
	private String islogin;

	public SurveyBean() {

	}

	public int getSurveyNum() {
		return this.surveyNum;
	}
	public void setSurveyNum(int surveyNum) {
		this.surveyNum = surveyNum;
	}

	public String getTitle() {
		return this.title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getPurpose() {
		return this.purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getStartDate() {
		return this.startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getStartTime() {
		return this.startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndDate() {
		return this.endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getEndTime() {
		return this.endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getCreator() {
		return this.creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getServiceFlag() {
		return this.serviceFlag;
	}
	public void setServiceFlag(String serviceFlag) {
		this.serviceFlag = serviceFlag;
	}

	public int getMaxVote() {
		return this.maxVote;
	}
	public void setMaxVote(int maxVote) {
		this.maxVote = maxVote;
	}

	public int getTotalVote() {
		return this.totalVote;
	}
	public void setTotalVote(int totalVote) {
		this.totalVote = totalVote;
	}

	public String getDupleType() {
		return this.dupleType;
	}
	public void setDupleType(String dupleType) {
		this.dupleType = dupleType;
	}

	public String getIslogin() {
		return this.islogin;
	}
	public void setIslogin(String islogin) {
		this.islogin = islogin;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCreateDateString() {
		return getCreateDateString("yyyy-MM-dd HH:mm:ss");
	}
	public String getCreateDateString(String pattern) {
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		if(createDate == null) return df.format(new Date());
		return df.format(this.createDate);
	}
	public void setCreateDateString(String format, String value) {
	    SimpleDateFormat df = new SimpleDateFormat(format);
	    try {
	        this.createDate = df.parse(value);
	    }catch(ParseException e) { ; }
	}

}
