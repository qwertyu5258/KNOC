<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.survey.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="SurveyMa" scope="page" class="kr.co.knoc.survey.SurveyManager" />
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","04");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>   
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
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
<%@include file="/include/comheader.jsp"%>


  	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
		<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_04.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>고객참여</span>
					&gt; <span class="locanow">설문조사</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h2 class="tleimg"><img src="/images/customer/ttl_sub04_7.gif" alt="설문조사" /></h2>
				</div>
				
				<div id="boardsec">
					<table cellspacing="0" cellpadding="0" class="viewtype" summary="해당게시판에 게시물을 등록합니다">
					<caption>게시물등록</caption>
					<colgroup><col width="110px" /><col width="590Px" /></colgroup>
						<tr>
							<th class="th1">설문제목</th>
							<td class="td1"><%=sb.getTitle() %></td>
						</tr>
                        <tr>
							<th class="th1">설문목적</th>
							<td class="td1"><%=sb.getPurpose() %></td>
						</tr>
                        <tr>
							<th class="th1">설문기간</th>
							<td class="td1"><%=StringUtil.getDateType(sb.getStartDate(),"-") %> ~ <%=StringUtil.getDateType(sb.getEndDate(),"-") %></td>
						</tr>
<%	

for (int q = 0; q < questionViewList.size(); q++) {
	SurveyQuestionView questionView = (SurveyQuestionView)questionViewList.get(q);	
	SurveyQuestionBean sqb = questionView.getQuestion();
	List exampleList = questionView.getExamples();
%>						
                        <tr>
							<th class="th1">질문-<%=q+1 %></th>
							<td class="td1"><%=sqb.getQuestion() %>&nbsp;&nbsp;
							<% if (sqb.getQuestionType().equals("1")) { %>
								주관식 답변 <a href="subjectiveResult.jsp?survey_num=<%=survey_num %>&exNum=<%=sqb.getQuestionNum() %>" target="_blank"><img src="/images/board/btn_view.gif" align="absmiddle" alt="보기" /></a>
							<% } %>
							</td>
						</tr>
				<% if (sqb.getQuestionType().equals("1")) { %>						
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
                        	<th class="th1"></th>
							<td class="td1"><span><%=e+1 %>.&nbsp;<%=seb.getExample() %></span> <span class="reseh" style="width:100px;">&nbsp;</span> 
							<span><strong><%=seb.getVote() %>/<%=sb.getTotalVote() %>
							(
							<% if ((sb.getTotalVote()*1) != 0) { %>
							<%=seb.getVote()/sb.getTotalVote()*100 %>%
							<% } else { %>
							0.0%
							<% } %>								
							)</strong></span></td>
						</tr>
<%
	}
%>
					<% } %>						
<%
}
%>					                        
					</table>
                    <!--// prev/next list: end //-->
					
					<div class="boardbtm mtm10">
						<div class="btnsec">
						    <a href="surveyList.jsp?schType=<%=schType %>&schText=<%=schText %>&page=<%=nowpage %>"><img src="/images/board/btn_list.gif" alt="목록" /></a>
						</div>
					</div>                    
				</div>
			</div>
	  </div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>