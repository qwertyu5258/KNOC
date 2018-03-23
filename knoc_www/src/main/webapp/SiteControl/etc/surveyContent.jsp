<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.survey.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="SurveyMa" scope="page" class="kr.co.knoc.survey.SurveyManager" />
<% request.setCharacterEncoding("euc-kr"); %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "기타 관리";  		// 서브 Depth 제목
    String gNavSubName = "etc";				// 서브 Depth 이름
    String gNavDepthTitle1 = "05"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

    application.setAttribute("gNavMenuDepth1", "01");
    application.setAttribute("gNavMenuDepth2", "01");

	String gNavPage = "설문 목록";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");
	String schType = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schType")),"8859_1");
	String schText = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schText")),"8859_1");
	int	survey_num	= (request.getParameter("survey_num")==null)?0:Integer.parseInt(request.getParameter("survey_num"));

	SurveyView view = new SurveyView();
	view = SurveyMa.getSurveyView(survey_num);
	if(view == null) {
%>
		<stl:msgBack msg="존재하지 않는 설문입니다."/>
<%
		return;
	}
	SurveyBean sb = view.getSurvey();
	List questionViewList = view.getQuestions();
%>
<%@ include file="../inc/top.jsp" %>

<table width="100%"  border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="195" valign="top">
			<%@ include file="left.jsp" %>
		</td>
		<td valign="top">
			<table width="100%" height="200"  border="0" cellpadding="0" cellspacing="0">
            	<tr>
              		<td valign="top">
                  		<table width="100%" border="0" cellpadding="0" cellspacing="0">
                      		<tr>
                          		<td valign="top">
                              		<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
									<tr>
									<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 기타 관리 > 설문목록</td>
									<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">기타 관리 > 설문목록</span></td>
									</tr>
									<tr>
									<td height="2" colspan="2" bgcolor="EAEAEC"></td>
									</tr>
									</table>
                                 </td>
                            </tr>
                            </table>
                            <table width="100%" height="15"  border="0" cellpadding="0" cellspacing="0">
                            	<tr>
                                	<td></td>
                                </tr>
                            </table>
<!-- 본문  -->

	<table cellSpacing="0" cellPadding="0" border="1" borderColor="#B5B5B5" width="100%" style="margin-top:20; color:#000;">
		<tr height="30">
			<td width="15%" style="background:#f9f9f9; color:#000;padding-left:10px">설문제목</td>
			<td style="padding-left:10;"><%=sb.getTitle() %></td>
		</tr>
		<tr height="30">
			<td width="15%" height="60" style="background:#EBEBEB; color:#000;padding-left:10px">설문 목적(설명)</td>
			<td  valign="top" style="padding-left:10;"><%=sb.getPurpose() %></td>
		</tr>
		<tr height="30">
			<td width="15%" style="background:#f9f9f9; color:#000;padding-left:10px">설문 기간</td>
			<td style="padding-left:10;">
					<%=StringUtil.getDateType(sb.getStartDate(),"-") %>
					~
					<%=StringUtil.getDateType(sb.getEndDate(),"-") %>
			</td>
		</tr>
		<tr height="30">


			<td colspan="2" style="color:#000;padding-left:10px">
<%

for (int q = 0; q < questionViewList.size(); q++) {
	SurveyQuestionView questionView = (SurveyQuestionView)questionViewList.get(q);
	SurveyQuestionBean sqb = questionView.getQuestion();
	List exampleList = questionView.getExamples();
%>

				<table cellSpacing="0" cellPadding="0" border="1" borderColor="#B5B5B5" width="90%" style="margin-top:20; color:#000;">
				<tr height="30">
					<td width="50" style="background:#EBEBEB; color:#000;padding-left:10px">질문-<%=q+1 %></td>
					<td  style="text-align:left"> &nbsp;<%=sqb.getQuestion() %>&nbsp;&nbsp;
						<% if (sqb.getQuestionType().equals("1")) { %>
							<a href="subjectiveResult.jsp?survey_num=<%=survey_num %>&exNum=<%=sqb.getQuestionNum() %>" target="_blank">주관식 답변 보기</a>
						<% } %>
					</td>
				</tr>
				<% if (sqb.getQuestionType().equals("1")) { %>
						<tr height="1">
						<td></td><td></td>
						</tr>
				<% } else { %>
<%
	int questionVoteTotal = 0;
	for (int e = 0; e < exampleList.size(); e++) {
		SurveyExampleBean seb = (SurveyExampleBean)exampleList.get(e);
		questionVoteTotal = questionVoteTotal + seb.getVote();
	}
%>
<%
	for (int e = 0; e < exampleList.size(); e++) {
		SurveyExampleBean seb = (SurveyExampleBean)exampleList.get(e);
%>
							<tr>
							<td></td>
							<td>&nbsp;<%=e+1 %>.&nbsp;<%=seb.getExample() %></td>
							<td width="80">
								<%=seb.getVote() %>
								/
								<%=sb.getTotalVote() %>
								(
								<%
								/**
								* 2016. 03. 21 / MYM
								* 보안약점 조치
								*/
								int intTotalVote = sb.getTotalVote() * 1;
								if(intTotalVote < 0) { intTotalVote = 0; }

								if (intTotalVote != 0) { %>
								<%=seb.getVote()/sb.getTotalVote()*100 %>%
								<% } else { %>
								0.0%
								<% } %>
								)
							</td>
							</tr>
<%
	}
%>
					<% } %>
				</table>
<%
}
%>
			<br>
		</td>
		</tr>
	</table>
	<br />
	<div style="text-align:center">
		<input type="button" onclick="location.href='surveyList.jsp?schType=<%=schType %>&schText=<%=schText %>&page=<%=nowpage %>';" style="cursor:pointer" value="목록">
	</div>
<!-- 본문 끝 -->
							<br>
						</td>
                      </tr>
                  </table></td>
          </tr>
        </table>
<%@ include file="../inc/bottom.jsp" %>