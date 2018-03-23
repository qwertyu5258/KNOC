<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="SurveyMa" scope="page" class="kr.co.knoc.term.SurveyManager" />		


<%

	String userId = etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("user_id"), ""), "8859_1");	

	SurveyMa.insertSurvey("q1_1", 	userId, etcutil.checkNullInt(request.getParameter("a1"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("b1"), ""), "8859_1"), 1);
	SurveyMa.insertSurvey("q1_1_1", userId, etcutil.checkNullInt(request.getParameter("a1_1"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("b1_1"), ""), "8859_1"), 2);
	SurveyMa.insertSurvey("q1_1_2", userId, etcutil.checkNullInt(request.getParameter("a1_2"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("b1_2"), ""), "8859_1"), 3);
	SurveyMa.insertSurvey("q1_2", 	userId, etcutil.checkNullInt(request.getParameter("a2"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("b2"), ""), "8859_1"), 4);
	SurveyMa.insertSurvey("q1_3", 	userId, etcutil.checkNullInt(request.getParameter("a3"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("b3"), ""), "8859_1"), 5);
	SurveyMa.insertSurvey("q1_4", 	userId, etcutil.checkNullInt(request.getParameter("a4"), 0),	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("b4"), ""), "8859_1"), 6);
	SurveyMa.insertSurvey("q1_5", 	userId, etcutil.checkNullInt(request.getParameter("a5"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("b5"), ""), "8859_1"), 7);
	SurveyMa.insertSurvey("q1_6", 	userId, etcutil.checkNullInt(request.getParameter("a6"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("b6"), ""), "8859_1"), 8);
	SurveyMa.insertSurvey("q1_7", 	userId, etcutil.checkNullInt(request.getParameter("a7"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("b7"), ""), "8859_1"), 9);
	SurveyMa.insertSurvey("q1_8", 	userId, 0,	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("b_8"), ""), "8859_1"), 10);
	SurveyMa.insertSurvey("q1_9", 	userId, 0, 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("b_9"), ""), "8859_1"), 11);
	SurveyMa.insertSurvey("q1_10", 	userId, 0, 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("b_10"), ""), "8859_1"), 12);
	SurveyMa.insertSurvey("q2_1", 	userId, etcutil.checkNullInt(request.getParameter("c1"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d1"), ""), "8859_1"), 13);
	SurveyMa.insertSurvey("q2_2", 	userId, etcutil.checkNullInt(request.getParameter("c2"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d2"), ""), "8859_1"), 14);
	SurveyMa.insertSurvey("q2_2_1", userId, etcutil.checkNullInt(request.getParameter("c2_1"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d2_1"), ""), "8859_1"), 15);
	SurveyMa.insertSurvey("q2_2_2", userId, etcutil.checkNullInt(request.getParameter("c2_2"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d2_2"), ""), "8859_1"), 16);
	SurveyMa.insertSurvey("q2_3", 	userId, etcutil.checkNullInt(request.getParameter("c3"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d3"), ""), "8859_1"), 17);
	SurveyMa.insertSurvey("q2_3_1", userId, etcutil.checkNullInt(request.getParameter("c3_1"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d3_1"), ""), "8859_1"), 18);
	SurveyMa.insertSurvey("q2_3_2", userId, etcutil.checkNullInt(request.getParameter("c3_2"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d3_2"), ""), "8859_1"), 19);
	SurveyMa.insertSurvey("q2_4", 	userId, etcutil.checkNullInt(request.getParameter("c4"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d4"), ""), "8859_1"), 20);
	SurveyMa.insertSurvey("q2_4_1", userId, etcutil.checkNullInt(request.getParameter("c4_1"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d4_1"), ""), "8859_1"), 21);
	SurveyMa.insertSurvey("q2_5", 	userId, etcutil.checkNullInt(request.getParameter("c5"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d5"), ""), "8859_1"), 22);
	SurveyMa.insertSurvey("q2_6", 	userId, etcutil.checkNullInt(request.getParameter("c6"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d6"), ""), "8859_1"), 23);
	SurveyMa.insertSurvey("q2_7", 	userId, etcutil.checkNullInt(request.getParameter("c7"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d7"), ""), "8859_1"), 24);
	SurveyMa.insertSurvey("q2_8", 	userId, etcutil.checkNullInt(request.getParameter("c8"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d8"), ""), "8859_1"), 25);
	SurveyMa.insertSurvey("q2_9", 	userId, etcutil.checkNullInt(request.getParameter("c9"), 0), 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d9"), ""), "8859_1"), 26);
	SurveyMa.insertSurvey("q2_10", 	userId, 0, 	etcutil.strBlockSpecialTags(etcutil.checkNullString(request.getParameter("d10"), ""), "8859_1"), 27);
 
%>


    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link rel="stylesheet" type="text/css" href="/survey/survey.css" />
<title>한국석유공사 설문</title>


<script type="text/javascript"> 
alert('설문등록이 완료되었습니다.');
window.close();
</script>
