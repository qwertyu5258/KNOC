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
	}
	SurveyBean sb = view.getSurvey();
	if("Y".equals(sb.getServiceFlag())) {
		/* 설문 기간 안에 있고 최대 설문 인원이 초과되지 않았을 경우 응시 */
		String today = StringUtil.getCurrentDate("yyyyMMdd");
		if( ( today.compareTo(sb.getStartDate()) >= 0
				&& today.compareTo(sb.getEndDate()) <= 0 
				&& (sb.getMaxVote() == 0 || sb.getTotalVote() 
						< sb.getMaxVote() ))) {
			;
		} else {
%>			
			<stl:msgBack msg="설문 기간이 아닙니다."/>
<%			
			return;
		}
	} else {
%>
			<stl:msgBack msg="사용중인 설문이 아닙니다."/>
<%		
		 	return;
	}
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
<script type="text/javascript">
//<![CDATA[
	function applySurvey(f) {
		for( var i = 1 ; i <= parseInt(f.elements["questionCount"].value) ; i++)
		{
				var ele = f.elements["questionType" + i];
				if(ele.value == "1") {
					// 주관식
					if(f.elements["example"+i].value == ""){
						alert("글을적어주세요");
						return;
					}
				}
				else {
					// 객관식
					maxSelect = parseInt(f.elements["maxSelection" + i ].value);
					example = f.elements["example"+i];
					if(typeof(example.length) == "undefined"){
						if(!example.checked) {
							alert("보기를 선택해 주세요.");
							example.focus();
							return;
						}
					} else {
						clickCount = 0;
						for(var k=0; k < example.length;k++) {
							if(example[k].checked) clickCount++;
						}
						if(clickCount < 1) {
							alert("보기를 선택해 주세요.");
							example[0].focus();
							return;
						}
						else if( maxSelect < clickCount) {
							alert("보기는 최대 " + maxSelect + "개 만큼 선택가능합니다.");
							return;
						}
					}
				}
		}

		f.submit();	
	}

	function list() {
    	document.pollform.action = 'surveyList.jsp';
    	document.pollform.submit();
	}
//]]>
</SCRIPT>
<form name="pollform" method="post" action="examinationFormOk.jsp">
<input type="hidden" name="surveyNum" value="<%=survey_num%>">
<input type=hidden name=page value="<%=nowpage%>">		
<input type="hidden" name="schType" value="<%=schType%>">	
<input type="hidden" name="schText" value="<%=schText%>">
<input type="hidden" name="questionCount" value="<%=questionViewList.size()%>">     
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
					<%=sb.getStartDate() %>
					~
					<%=sb.getEndDate() %>
			</td>
		</tr>	
		<tr height="30">
			
		
			<td colspan=2 style="color:#000;padding-left:10px">
<%	

for (int q = 0; q < questionViewList.size(); q++) {
	SurveyQuestionView questionView = (SurveyQuestionView)questionViewList.get(q);	
	SurveyQuestionBean sqb = questionView.getQuestion();
	List exampleList = questionView.getExamples();	
%>			
				<table cellSpacing="0" cellPadding="0" border="1" borderColor="#B5B5B5" width="90%" style="margin-top:20; color:#000;">
				<tr height="30">
					<td width="100" style="background:#EBEBEB; color:#000;padding-left:10px">질문-<%=q+1 %></td>
					<td  style="text-align:left"> &nbsp;<%=sqb.getQuestion() %></td>
						<input type=hidden name="questionNum" value="<%=sqb.getQuestionNum()%>">
						<input type=hidden name="maxSelection<%=q+1 %>" value="<%=sqb.getMaxSelection()%>">
				</tr>
				<% if (sqb.getQuestionType().equals("1")) { %>
						<input type="hidden" name="questionType<%=q+1 %>" value="1">
						<tr height="30">
						<td>&nbsp;</td>
						<td>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
									<td  width="100%" >
										<TEXTAREA NAME="example<%=q+1 %>" ROWS="10" COLS="100"></TEXTAREA>
									</td>
								</tr>
							</table>
						</td>
						</tr>
				<% } else { %>
						<input type="hidden" name="questionType<%=q+1 %>" value="0">
					
				<%
						int questionVoteTotal = 0;
						String example = "";
						for (int e = 0; e < exampleList.size(); e++) {
							SurveyExampleBean seb = (SurveyExampleBean)exampleList.get(e);
							questionVoteTotal = questionVoteTotal + seb.getVote();
						}
						for (int e = 0; e < exampleList.size(); e++) {
							SurveyExampleBean seb = (SurveyExampleBean)exampleList.get(e);
				%>
							<tr>
							<td>&nbsp;</td> 
							<td>
								<% if (sqb.getMaxSelection() == 1) { %>
										<input type="radio" name="example<%=q+1 %>" 
												value="<%=seb.getExampleNum() %>" />
								<% } else { %>
										<input type="checkbox" name="example<%=q+1 %>" 
												value="<%=seb.getExampleNum()%>" />
								<% } %>
								<%=seb.getExample() %>
							</td>
							</tr>
				<%					
						}
				 	} 
				%>
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
		<a href="javascript:applySurvey(document.pollform);">투표하기</a> | 
		<a href="javascript:list()">목록</a>
	</div> 
</form>
<!-- 본문 끝 -->
							<BR>
						</td>
                      </tr>
                  </table></td>
          </tr>
        </table>
<%@ include file="../inc/bottom.jsp" %>