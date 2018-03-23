<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>    
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","02");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>       
<% request.setCharacterEncoding("euc-kr"); %>
<%   	
	String grp = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("grp")));
	if (grp == null || grp.equals("")) {
		grp = "QNA1";
	}
%>
<%@include file="/include/comheader.jsp"%>


	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_02.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>열린경영</span>
                    &gt; <span>윤리경영</span>
					&gt; <span>윤리경영제도</span>
                    &gt; <span class="locanow">윤리경영 Q&amp;A</span>
				</div>
				<!--// location: end //-->
				<!-- [2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_1_3_2.gif" alt="윤리경영 Q&amp;A" /></h3>
				</div>
				<!--시작-->
				<div class="manageQna">
					<form name="grpForm" method="post" action="sub02_1_3_2.jsp">
					<fieldset>
						<legend>항목선택 검색</legend>
						<label for="grp" class="blindtext">Q&amp;A 항목 선택</label>
							<select id="grp" name="grp" class="qna_select">
							<option value="QNA1" <% if (grp != null && grp.equals("QNA1")) { %>selected="selected"<% } %>>일반사항 및 근무윤리 </option>
							<option value="QNA2" <% if (grp != null && grp.equals("QNA2")) { %>selected="selected"<% } %>>이해충돌회피</option>
							<option value="QNA3" <% if (grp != null && grp.equals("QNA3")) { %>selected="selected"<% } %>>재산 및 정보보호</option>
							<option value="QNA4" <% if (grp != null && grp.equals("QNA4")) { %>selected="selected"<% } %>>금품, 선물, 접대, 경조금 등</option>
							<option value="QNA5" <% if (grp != null && grp.equals("QNA5")) { %>selected="selected"<% } %>>거래업체</option>
							<option value="QNA6" <% if (grp != null && grp.equals("QNA6")) { %>selected="selected"<% } %>>신고와 처리</option>
							<option value="QNA7" <% if (grp != null && grp.equals("QNA17")) { %>selected="selected"<% } %>>건전한 풍토조성</option>
							</select>						
							<input type="image" src="/images/management/btn_sele.gif" title="선택한 Q&amp;A 내용을 조회합니다." alt="선택한 Q&amp;A 내용을 조회합니다."/>
							
						</fieldset>
					</form>               
					<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="BUSIQNA" adminURL="" sessionName="USERSESSION"/>
				</div>
				<!--//끝-->				 
			</div>
			
			<div class="new_officer">
			<table summary="담당부서 및 연락처 관리일">
			<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"></td>
						<td class="contact_team"><strong>담당부서 : </strong>감사실 청렴경영감사팀</td>
						<td class="contact_user"><strong>담당자 : </strong>이유경</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2126</td>
					</tr>
				</tbody>
			</table>
			</div>
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>