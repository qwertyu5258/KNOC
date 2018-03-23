package kr.co.knoc.survey;

public class SurveyEntry {
	private int surveyNum;					/* 설문 번호 */
	private int entryNum;					/* 참여자 일련번호 */
	private String entryId;					/* 참여자 아이디 */
	private String entryIp;					/* 참여자 아이피 */
	private String entryDate;				/* 참여 일 */
	private String entryTime;				/* 참여 시간 */
	
	public int getSurveyNum() {
		return surveyNum;
	}
	public void setSurveyNum(int surveyNum) {
		this.surveyNum = surveyNum;
	}
	public int getEntryNum() {
		return entryNum;
	}
	public void setEntryNum(int entryNum) {
		this.entryNum = entryNum;
	}
	public String getEntryId() {
		return entryId;
	}
	public void setEntryId(String entryId) {
		this.entryId = entryId;
	}
	public String getEntryIp() {
		return entryIp;
	}
	public void setEntryIp(String entryIp) {
		this.entryIp = entryIp;
	}
	public String getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}
	public String getEntryTime() {
		return entryTime;
	}
	public void setEntryTime(String entryTime) {
		this.entryTime = entryTime;
	}	
}
