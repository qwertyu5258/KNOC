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
</script>

		<%@include file="/include/subtopnavi_new.jsp"%>
		<!--// subtopNavi: start //-->
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
				<!--// prev/next list: start //-->
				<table cellspacing="0" cellpadding="0" class="viewtype2">
				<colgroup><col width="95px" /><col width="605px" /></colgroup>
					<tr>
						<th style="border-top:#dddddd 1px solid;">설문</th>
						<td style="border-top:#dddddd 1px solid;">test</td>
					</tr>
					<tr>
						<th>질문 #2</th>
						<td>test</td>
					</tr>
				</table>
				<!--// prev/next list: end //-->

					<p class="pt30"></p>
					<table cellspacing="0" cellpadding="0" class="listtype" summary="설문조사 주관식 답변을 확인할 수 있습니다.">
					<caption>설문조사 주관식 답변</caption>
					<colgroup><col width="95px" /><col width="605px" /></colgroup>
						<tr>
							<th>번호</th>
							<th>주관식 답변</th>
						</tr>
						<tr>
							<td>1</td>
							<td align="left" class="pl10">주관식답변111</td>
						</tr>
						<tr>
							<td>2</td>
							<td align="left" class="pl10">주관식답변111</td>
						</tr>
						<tr>
							<td>3</td>
							<td align="left" class="pl10">주관식답변111</td>
						</tr>
						<tr>
							<td>4</td>
							<td align="left" class="pl10">주관식답변111</td>
						</tr>
						<tr>
							<td>5</td>
							<td align="left" class="pl10">주관식답변111</td>
						</tr>
						<tr>
							<td>6</td>
							<td align="left" class="pl10">주관식답변111</td>
						</tr>
					</table>

					<div class="boardbtm">
						<div class="leftdv">
							<!--// paging: start //-->
							<div class="paging">
								<a href="#" title="처음 페이지로 이동"><img src="/images/board/preview.gif" alt="처음 페이지로 이동" /></a>
								<a href="#" title="이전 페이지로 이동"><img src="/images/board/ppreview.gif" alt="이전 페이지로 이동" /></a>
								<span class="pagenow">1</span>
								<a href="#" title="2페이지로 이동">2</a>
								<a href="#" title="3페이지로 이동">3</a>
								<a href="#" title="4페이지로 이동">4</a>
								<a href="#" title="5페이지로 이동">5</a>
								<a href="#" title="6페이지로 이동">6</a>
								<a href="#" title="7페이지로 이동">7</a>
								<a href="#" title="8페이지로 이동">8</a>
								<a href="#" title="9페이지로 이동">9</a>
								<a href="#" title="10페이지로 이동">10</a>
								<a href="#" title="다음 페이지로 이동"><img src="/images/board/nnext.gif" alt="다음" /></a>
								<a href="#" title="끝 페이지로 이동"><img src="/images/board/next.gif" alt="끝" /></a>
							</div>
							<!--// paging: end //-->
						</div>
						<div class="rightdv"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>