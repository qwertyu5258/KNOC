package kr.co.knoc.survey;

import java.util.ArrayList;
import java.util.List;

public class SurveyView {
	private SurveyBean survey;
	private List questions;
	
	public SurveyView() {
		this.survey = new SurveyBean();
		this.questions = new ArrayList();
	}
	public SurveyView(SurveyBean survey) {
		this.survey = survey;
		this.questions = new ArrayList();
	}
	public SurveyBean getSurvey() {
		return survey;
	}
	public void setSurvey(SurveyBean survey) {
		this.survey = survey;
	}
	public List getQuestions() {
		return questions;
	}
	public void setQuestions(List questions) {
		this.questions = questions;
	}
}
