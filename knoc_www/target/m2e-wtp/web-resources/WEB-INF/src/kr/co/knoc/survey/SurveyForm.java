package kr.co.knoc.survey;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SurveyForm {
	private String creator;				/* 설문 등록자 */
	
	private int surveyNum;				/* 설문 일련번호 */
	private String title;				/* 설문 제목 */
	private String purpose;				/* 설문 목적 */
	
	private String startDate;			/* 설문 시작 일 */
	private String startYear;			/* 설문 시작 년도 */
	private String startMonth;			/* 설문 시작 월 */
	private String startDay;			/* 설문 시작 일 */
	private String startTime;			/* 설문 시작 시간 */
	
	private String endDate;				/* 설문 종료 일 */
	private String endYear;			/* 설문 종료 년도 */
	private String endMonth;			/* 설문 종료 월 */
	private String endDay;			/* 설문 종료 일 */
	private String endTime;			    /* 설문 종료 시간 */
	
	private String serviceFlag;			/* 사용여부 */	
	private int maxVote;				/* 최대 제한 인원 0 이면 무제한*/
	private int totalVote;				/* 총 설문 인원 */
	private Date createDate;			/* 설문생성일 */
	private String dupleType;			/* 설문 등록 중복 타입 */
	private String isLogin;						/* 로그인 체크여부 */
	
	private int questionNum;			/* 질문 고유번호 */
	private int questionCount;			/* 질문 개수 */	
	
	private String[] questionType;					/* 질문 타입 ( 주관식, 객관식 ) */
	private String[] question;						/* 질문 */
	private String[] example;						/* 보기 */
	private String[] maxSelection;					/* 최대 선택 가능 보기 개수 */
	
	private String initEx;						/* 보기 수정 여부 */
		
	
	public SurveyForm() {
		//questionType = new ArrayList();
		//question = new ArrayList();
		//example = new ArrayList();
		//maxSelection = new ArrayList();
	}

	public String getInitEx() { 
		return this.initEx;
	}
	
	public void setInitEx(String initEx) {
		this.initEx = initEx;
	}
	
	public String getCreator() { 
		return this.creator;
	}
	
	public void setCreator(String creator) {
		this.creator = creator;
	}
	
	public int getSurveyNum() {
		return surveyNum;
	}

	public void setSurveyNum(int surveyNum) {
		this.surveyNum = surveyNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	public String getStartYear() {
		return startYear;
	}

	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}
	
	public String getStartMonth() {
		return startMonth;
	}

	public void setStartMonth(String startMonth) {
		this.startMonth = startMonth;
	}
	
	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public String getEndYear() {
		return endYear;
	}

	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}
	
	public String getEndMonth() {
		return endMonth;
	}

	public void setEndMonth(String endMonth) {
		this.endMonth = endMonth;
	}
	
	public String getEndDay() {
		return endDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getMaxVote() {
		return maxVote;
	}

	public void setMaxVote(int maxVote) {
		this.maxVote = maxVote;
	}
	
	public int getTotalVote() {
		return totalVote;
	}

	public void setTotalVote(int totalVote) {
		this.totalVote = totalVote;
	}

	public String getDupleType() {
		return dupleType;
	}

	public void setDupleType(String dupleType) {
		this.dupleType = dupleType;
	}
	
	public int getQuestionNum() {
		return questionNum;
	}

	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}

	public int getQuestionCount() {
		return questionCount;
	}

	public void setQuestionCount(int questionCount) {
		this.questionCount = questionCount;
	}

	public String getServiceFlag() {
		return serviceFlag;
	}

	public void setServiceFlag(String serviceFlag) {
		this.serviceFlag = serviceFlag;
	}

	public String[] getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String[] questionType) {
		this.questionType = questionType;
	}

	public String[] getQuestion() {
		return question;
	}

	public void setQuestion(String[] question) {
		this.question = question;
	}

	public String[] getExample() {
		return example;
	}

	public void setExample(String[] example) {
		this.example = example;
	}
	
	public String[] getMaxSelection() { 
		return this.maxSelection;
	}
	
	public void setMaxSelection(String[] maxSelection){
		this.maxSelection = maxSelection;
	}

	public String getIsLogin() {
		return isLogin;
	}

	public void setIsLogin(String isLogin) {
		this.isLogin = isLogin;
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
