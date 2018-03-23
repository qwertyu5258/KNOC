package kr.co.knoc.survey;

import java.util.ArrayList;
import java.util.List;

public class SurveyQuestionView {
	private SurveyQuestionBean question;
	private List examples;
	
	public SurveyQuestionView(){
		this.question = new SurveyQuestionBean();
		this.examples = new ArrayList();
	}
	public SurveyQuestionView(SurveyQuestionBean question){
		this.question = question;
		this.examples = new ArrayList();
	}
	public SurveyQuestionBean getQuestion() {
		return question;
	}
	public void setQuestion(SurveyQuestionBean question) {
		this.question = question;
	}
	public List getExamples() {
		return examples;
	}
	public void setExamples(List examples) {
		this.examples = examples;
	}
}
