package kr.co.knoc.survey;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SurveyQuestionBean {
	private int surveyNum;				/* 설문 고유번호 */
	private int questionNum;			/* 질문 고유번호 */
	private int questionCount;			/* 질문 개수 */	
	
	private String questionType;		/* 질문 타입 ( 주관식, 객관식 ) */
	private String question;			/* 질문 */
	private String example;				/* 보기 */
	private int maxSelection;			/* 최대 선택 가능 보기 개수 */	
		
	
	public SurveyQuestionBean() {
	}
	
	public int getSurveyNum() {
		return surveyNum;
	}

	public void setSurveyNum(int surveyNum) {
		this.surveyNum = surveyNum;
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
	
	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getExample() {
		return example;
	}

	public void setExample(String example) {
		this.example = example;
	}
	
	public int getMaxSelection() { 
		return this.maxSelection;
	}
	
	public void setMaxSelection(int maxSelection){
		this.maxSelection = maxSelection;
	}	
}
