<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.survey.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
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
	String schType = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schType")));
	String schText = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schText")));

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

	window.onload = function(){
		window.open("/survey/survey.jsp", "_survey2011", "width=617px, height=800px, status=1, scrollbars=yes");
	}
</script>

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
					<h3 class="tleimg"><img src="/images/customer/ttl_sub04_7.gif" alt="설문조사" /></h3>
				</div>
				<div id="boardsec">
<form name="bForm" method="post" action="sub04_7.jsp">
<input type="hidden" name="page" value="<%=nowpage%>" />
<input type="hidden" name="schType" value="<%=schType%>" />
<input type="hidden" name="schText" value="<%=schText%>" />
<input type="hidden" name="survey_num" value="" />
				  <table cellspacing="0" cellpadding="0" class="listtype" summary="등록된 설문조사 목록을 확인할 수 있습니다.">
					<caption>설문조사 목록</caption>
					<colgroup><col width="55px" /><col width="150px" /><col width="214px" /><col width="100px" /><col width="60px" /><col width="60px" /><col width="60px" /></colgroup>

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
						<tr>
							<td colspan="7" align="center">등록된 설문이 존재하지 않습니다.</td>
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
							<td class="subj"><%= sb.getTitle() %></td>
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
                            <td>
                            <% if (sb.getServiceFlag().equals("Y")) { %>
							<% 	if (Integer.parseInt(sb.getStartDate()) <= Integer.parseInt(DateUtil.getFormattedDate(new Date(),"yyyyMMdd"))
									&& Integer.parseInt(sb.getEndDate()) >= Integer.parseInt(DateUtil.getFormattedDate(new Date(),"yyyyMMdd"))
									&& (sb.getTotalVote() < sb.getMaxVote() || sb.getMaxVote() == 0)) { %>
							<input type=button value=' 투표 ' class=button onclick="DoSurvey('<%=sb.getSurveyNum() %>');" onkeypress="return true;" />
							<%	} else if (Integer.parseInt(sb.getStartDate()) > Integer.parseInt(DateUtil.getFormattedDate(new Date(),"yyyyMMdd"))
									&& Integer.parseInt(sb.getEndDate()) > Integer.parseInt(DateUtil.getFormattedDate(new Date(),"yyyyMMdd"))) { %>

							<%  } else { %>
							<img src="/images/board/btn_view.gif" alt="보기" onclick="Result('<%=sb.getSurveyNum() %>');" onkeypress="return true;" style="cursor:pointer" />
							<%  } %>
							<% } %>
                            </td>
						</tr>
<%
			seq--;
		}
	}
%>
					</table>
</form>
			  <div class="boardbtm">
						<div class="leftdv">
							<!--// paging: start //-->
<stl:pager pageName="pp" prevPage="prevPage" nextPage="nextPage" prevBlock="prevBlock" nextBlock="nextBlock" pages="pages" firstPage="firstPage" lastPage="lastPage" blockSize="10" totalCount="<%=SurveyMa.getNeoSurveyListCount(schType,schText)%>" />
							<div class="paging">
								<a href="<%=prevBlock.getAnchor("&schType="+schType+"&schText="+schText)%>" title="처음 페이지로 이동"><img src="/images/board/preview.gif" alt="처음 페이지로 이동" /></a>
								<a href="<%=prevPage.getAnchor("&schType="+schType+"&schText="+schText)%>" title="이전 페이지로 이동"><img src="/images/board/ppreview.gif" alt="이전 페이지로 이동" /></a>
								<% int ll = 1; %>
								<stl:loop name="pages" loopId="p" className="kr.co.knoc.tags.pager.PageAnchor">
								<% if ( p.getPage() == pp.getNPage()) { %>
								<span class="pagenow"><%=p.getPage()%></span> <% if (ll != pages.size()) {%> <% } %>
								<% } else { %>
								<a href="<%=p.getAnchor("&schType="+schType+"&schText="+schText)%>" title="<%=p.getPage()%>페이지로 이동"><%=p.getPage()%></a> <% if (ll != pages.size()) {%> <% } %>
								<% } %>
								<% ll++; %>
								</stl:loop>
								<a href="<%=nextPage.getAnchor("&schType="+schType+"&schText="+schText)%>" title="다음 페이지로 이동"><img src="/images/board/nnext.gif" alt="다음 페이지로 이동" /></a>
								<a href="<%=nextBlock.getAnchor("&schType="+schType+"&schText="+schText)%>" title="끝 페이지로 이동"><img src="/images/board/next.gif" alt="끝 페이지로 이동" /></a>
							</div>
							<!--// paging: end //-->
						</div>
						<!--<div class="rightdv">
							<a href="#"><img src="/images/board/btn_write4.gif" alt="설문등록" /></a>
						</div>-->
					</div>
					<!--// searchbox: end //-->
					<div id="schsec">
<form name="searchform" method="get" action="sub04_7.jsp">
						<fieldset class="schset">
							<legend>Search Box</legend>

							<label for="schType" class="nlabel">목록검색선택</label>
							<select id="schType" name="schType" style="width:80px;">
								<option value="title" <% if (schType != null && !schType.equals("") && schType.equals("title")) { %>selected="selected"<% } %>>설문제목</option>
								<option value="purpose" <% if (schType != null && !schType.equals("") && schType.equals("purpose")) { %>selected="selected"<% } %>>설문목적</option>
							</select>

							<label for="schText" class="nlabel">목록검색</label>
							<input type="text" value="<%=schText %>" id="schText" name="schText" class="input" />

							<div class="btndv"><img src="/images/board/btn_search.gif" alt="검색" onclick="document.searchform.submit()" onkeypress="return true;" style="cursor:pointer" /></div>
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