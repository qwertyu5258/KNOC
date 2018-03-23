package kr.co.knoc.survey;

public class SurveyObjectiveAnswer {
	private int surveyNum;				/* 설문 번호 */
	private int questionNum;			/* 질문 번호 */
	private int exampleNum;				/* 보기 번호 */
	private int entryNum;				/* 참가자 일련번호 */
	
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
	public int getExampleNum() {
		return exampleNum;
	}
	public void setExampleNum(int exampleNum) {
		this.exampleNum = exampleNum;
	}
	public int getEntryNum() {
		return entryNum;
	}
	public void setEntryNum(int entryNum) {
		this.entryNum = entryNum;
	}
}
