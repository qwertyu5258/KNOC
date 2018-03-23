package kr.co.knoc.survey;

public class SurveySubjectiveAnswer {
	private int surveyNum;					/* 설문 번호 */
	private int questionNum;				/* 질문 번호 */
	private int entryNum;					/* 참가자 일련번호 */
	private String answer;					/* 주관식 답변 */
	
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
	public int getEntryNum() {
		return entryNum;
	}
	public void setEntryNum(int entryNum) {
		this.entryNum = entryNum;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
}
