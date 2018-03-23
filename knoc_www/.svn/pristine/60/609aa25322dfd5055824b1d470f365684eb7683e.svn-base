<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.survey.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="SurveyMa" scope="page" class="kr.co.knoc.survey.SurveyManager" />
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
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
<%@include file="/include/comheader.jsp"%>
<script type="text/javascript">
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
</script>

	<%@include file="/include/subtopnavi.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
		<%@include file="/include/subleftmenu.jsp"%><!--// leftmenu: start //-->

		<div id="rightarea">
			<div id="subcnts">
				<h1><img src="/images/board/sub_title.jpg" alt="공사소개(About Us) 대한민국 경제를 움직이는 에너지,그 시작은 언제나 한국석유공사입니다" /></h1>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>공사소개</span>
					&gt; <span>CEO소개</span>
					&gt; <span class="locanow">말씀자료</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h2 class="tleimg"><img src="/images/board/stle_1.gif" alt="말씀자료" /></h2>
				</div>
				<div id="boardsec">
				  <table cellspacing="0" cellpadding="0" class="listtype" summary="해당게시판은 말씀자료의 목록을 보여줍니다">
					<caption>해당게시판 목록</caption>
					<colgroup><col width="55px" /><col width="150px" /><col width="214px" /><col width="100px" /><col width="60px" /><col width="60px" /><col width="60px" /></colgroup>
<form name="bForm" method="post" action="17-1list.jsp">
<input type=hidden name=page value="<%=nowpage%>">
<input type="hidden" name="schType" value="<%=schType%>">
<input type="hidden" name="schText" value="<%=schText%>">
<input type="hidden" name="survey_num" value="">
						<tr>
							<th>번호</th>
							<th>기간</th>
							<th>설문제목</th>
							<th>등록일</th>
						    <th>참가자</th>
                            <th>상태</th>
                            <th>결과보기</th>
						</tr>
<%  if(count==0) { %>
						<TR>
							<TD colspan="7" align="center">등록된 설문이 존재하지 않습니다.</td>
						</tr>
<%
	} else {
		Iterator iter = al.iterator();
		while(iter.hasNext()){
			SurveyBean sb = (SurveyBean)iter.next();
%>
						<tr>
							<td><%=seq %></td>
							<td><%=StringUtil.getDateType(sb.getStartDate(),"-") %>~<%=StringUtil.getDateType(sb.getEndDate(),"-") %></td>
							<td class="subj"><a href="javascript:view('<%= sb.getSurveyNum() %>')"><%= sb.getTitle() %></a></td>
							<td><%=sb.getCreateDateString("yyyy-MM-dd") %></td>
						    <td>
						    <% if (sb.getTotalVote() == 0) { %>
								무제한
							<% } else { %>
								<%=sb.getTotalVote() %>
							<% } %>
							</td>
                            <td>
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
                            <td><input type=button value=' 투표 ' class=button onclick="DoSurvey('<%=sb.getSurveyNum() %>');" onkeypress="return true;"><img src="/images/board/btn_view.gif" alt="보기" onclick="Result('<%=sb.getSurveyNum() %>');" style="cursor:pointer" /></td>
						</tr>
<%
			seq--;
		}
	}
%>
</form>
					</table>

			  <div class="boardbtm">
						<div class="leftdv">
							<!--// paging: start //-->
<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=SurveyMa.getNeoSurveyListCount(schType,schText)%>" />
							<div class="paging">
								<a href="<%=prevBlock.getAnchor("&schType="+schType+"&schText="+schText)%>"><img src="/images/board/preview.gif" alt="처음" /></a>
								<a href="<%=prevPage.getAnchor("&schType="+schType+"&schText="+schText)%>"><img src="/images/board/ppreview.gif" alt="이전" /></a>
								<% int ll = 1; %>
								<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
								<% if ( p.getPage() == pp.getNPage()) { %>
								<span class="pagenow"><%=p.getPage()%></span> <% if (ll != pages.size()) {%> <% } %>
								<% } else { %>
								<a href="<%=p.getAnchor("&schType="+schType+"&schText="+schText)%>"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> <% } %>
								<% } %>
								<% ll++; %>
								</stl:loop>
								<a href="<%=nextPage.getAnchor("&schType="+schType+"&schText="+schText)%>"><img src="/images/board/nnext.gif" alt="다음" /></a>
								<a href="<%=nextBlock.getAnchor("&schType="+schType+"&schText="+schText)%>"><img src="/images/board/next.gif" alt="끝" /></a>
							</div>
							<!--// paging: end //-->
						</div>
						<!--<div class="rightdv">
							<a href="#"><img src="/images/board/btn_write4.gif" alt="설문등록" /></a>
						</div>-->
					</div>
					<!--// searchbox: end //-->
					<div id="schsec">
<form name="searchform" method="get" action="17-1list.jsp">
						<fieldset class="schset">
							<legend>Search Box</legend>

							<label for="schsel" class="nlabel">목록검색선택</label>
							<select id="schType" name="schType" style="width:80px;">
								<option value="title" <% if (schType != null && !schType.equals("") && schType.equals("title")) { %>selected="selected"<% } %>>설문제목</option>
								<option value="purpose" <% if (schType != null && !schType.equals("") && schType.equals("purpose")) { %>selected="selected"<% } %>>설문목적</option>
							</select>

							<label for="schinput" class="nlabel">목록검색</label>
							<input type="text" value="<%=schText %>" id="schText" name="schText" class="input" />

							<div class="btndv"><img src="/images/board/btn_search.gif" alt="검색" onclick="document.searchform.submit()" style="cursor:pointer" /></div>
					  </fieldset>
</form>
					</div>
					<!--// searchbox: end //-->
				</div>
			</div>
		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>