<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.survey.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
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

	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	ArrayList al = SurveyMa.getNeoSurveyList(schType, schText, pp.getNPage(), pp.getNPageSize());

	int count = SurveyMa.getNeoSurveyListCount(schType, schText);
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
	/**
	* 2016. 03. 21 / MYM
	* 보안약점 조치
	*/
	if(seq < 0) { seq = 1; }
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">
	function view(survey_num) {
            	document.bForm.action = 'surveyEdit.jsp';
            	document.bForm.survey_num.value = survey_num;
            	document.bForm.submit();
	}
	function DoSurvey(survey_num) {
            	document.bForm.action = 'examinationForm.jsp';
            	document.bForm.survey_num.value = survey_num;
            	document.bForm.submit();
	}
	function Result(survey_num) {
            	document.bForm.action = 'surveyContent.jsp';
            	document.bForm.survey_num.value = survey_num;
            	document.bForm.submit();
	}
	function jsWrite() {
		location.href = "surveyWrite.jsp";
	}
</script>
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
                            <table align=center class=tableBorder border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
							<td class=descBorder_r>
							<input type=button value=' 설문 등록 ' class=button onClick="jsWrite();">
							</td>
							</tr>
							</table>

	<div style="text-align:left">
		<form name="searchform" method="get" action="surveyList.jsp">
			<table cellSpacing="0" cellPadding="0" border="0" width="100%" >
			<Tr >

				<td width="50"><b>검색어:</b></td>
				<td width="120">
					<select name="schType">
						<option value="title" <% if (schType != null && !schType.equals("") && schType.equals("title")) { %>selected<% } %>>설문제목</option>
						<option value="purpose" <% if (schType != null && !schType.equals("") && schType.equals("purpose")) { %>selected<% } %>>설문목적(설명)</option>
					</select>
				</td>
				<TD width="230"><input type="text" name="schText" value="<%=schText %>" size="35"></td>
				<TD><input type="button"  style="cursor:pointer" onclick="document.searchform.submit()" value="검색"></td>
			</tr>
			</table>
		</form>
	</div>

	<table cellSpacing="0" cellPadding="0" border="1" borderColor="#B5B5B5" width="100%" class="link_board_1" style="margin-top:20; text-align:center; color:#5c5c5c;">
<form name="bForm" method="post" action="surveyList.jsp">
<input type=hidden name=page value="<%=nowpage%>">
<input type="hidden" name="schType" value="<%=schType%>">
<input type="hidden" name="schText" value="<%=schText%>">
<input type="hidden" name="survey_num" value="">
		<TR height="25" style="background:#E7E7E7; color:#000;">
			<TD width="50">번호</td>
			<TD width="200">기간</td>
			<TD>설문제목</td>
			<TD width="100">등록일</td>
			<TD width="110">참가자</td>
			<TD width="80">상태</td>
			<TD width="120">보기</td>
			<TD width="120">보기2</td>
		</tr>
<%  if(count==0) { %>
		<TR height="25">
			<TD colspan="8" align="center" height="100">등록된 설문이 존재하지 않습니다.</td>
		</tr>
<%
	} else {
		Iterator iter = al.iterator();
		while(iter.hasNext()){
			SurveyBean sb = (SurveyBean)iter.next();
%>
		<TR height="25">
			<TD width="50"><%=seq %></td>
			<TD width="200"><%=StringUtil.getDateType(sb.getStartDate(),"-") %>~<%=StringUtil.getDateType(sb.getEndDate(),"-") %></td>
			<TD><a href="javascript:view('<%= sb.getSurveyNum() %>')"><%= sb.getTitle() %></a>
			</td>
			<TD width="100"><%=sb.getCreateDateString("yyyy-MM-dd") %></td>
			<TD width="110">
			<% if (sb.getTotalVote() == 0) { %>
				무제한
			<% } else { %>
				<%=sb.getTotalVote() %>
			<% } %>
			</td>
			<TD width="80">
			<% if (sb.getServiceFlag().equals("Y")) { %>
			<% 	if (Integer.parseInt(sb.getStartDate()) <= Integer.parseInt(DateUtil.getFormattedDate(new Date(),"yyyyMMdd"))
					&& Integer.parseInt(sb.getEndDate()) >= Integer.parseInt(DateUtil.getFormattedDate(new Date(),"yyyyMMdd"))
					&& (sb.getTotalVote() < sb.getMaxVote() || sb.getMaxVote() == 0)) { %>
				진행중
			<%	} else if (Integer.parseInt(sb.getStartDate()) > Integer.parseInt(DateUtil.getFormattedDate(new Date(),"yyyyMMdd"))
					&& Integer.parseInt(sb.getEndDate()) > Integer.parseInt(DateUtil.getFormattedDate(new Date(),"yyyyMMdd"))) { %>
				예정
			<%  } else { %>
				종료
			<%  } %>
			<% } else { %>
				미사용
			<% } %>
			</td>
			<TD width="120">
			<input type=button value=' 투표 ' class=button onClick="DoSurvey('<%=sb.getSurveyNum() %>');">
			</td>
			<TD width="120">
			<input type=button value=' 결과 ' class=button onClick="Result('<%=sb.getSurveyNum() %>');">
			</td>
		</tr>
<%
			seq--;
		}
	}
%>
</form>
	</table>
		<br>
<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=SurveyMa.getNeoSurveyListCount(schType,schText)%>" />
	<table class="pagezig_table" align="center">
		<tr>
			<td><a href="<%=prevBlock.getAnchor("&schType="+schType+"&schText="+schText)%>"><img src="../images/btn_list_first.gif" alt="처음페이지로"></a><a href="<%=prevPage.getAnchor("&schType="+schType+"&schText="+schText)%>"><img src="../images/btn_prev_1.gif" alt="이전페이지로"></a></td>
			<td class="pagezig">
			<% int ll = 1; %>
			<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
			<% if ( p.getPage() == pp.getNPage()) { %>
			<span><b><%=p.getPage()%></b></span> <% if (ll != pages.size()) {%> / <% } %>
			<% } else { %>
			<a href="<%=p.getAnchor("&schType="+schType+"&schText="+schText)%>" class="num01"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> / <% } %>
			<% } %>
			<% ll++; %>
			</stl:loop>
			</td>
			<td><a href="<%=nextPage.getAnchor("&schType="+schType+"&schText="+schText)%>"><img src="../images/btn_next_1.gif" alt="다음페이지로"></a><a href="<%=nextBlock.getAnchor("&schType="+schType+"&schText="+schText)%>"><img src="../images/btn_list_last.gif" alt="맨끝페이지로"></a></td>
		</tr>
	</table>

	</td>
	</tr>
	</table>
</td>
</tr>
</table>
<%@ include file="../inc/bottom.jsp" %>