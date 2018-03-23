<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>    
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","08");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>        
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String grp = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("grp")));
	if (grp == null || grp.equals("")) {
		grp = "REC5";
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
				<%@include file="/include/subtop_01.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>공사소개</span>
                    &gt; <span>채용정보</span>
                    &gt; <span class="locanow">채용FAQ</span>
				</div>
				<!--// location: end //-->
				<!-- [2009-09-15 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_7_8.gif" alt="채용FAQ" /></h3>
				</div>
				<!--시작-->
				<div class="recruit3">
					<div id='four1'>
						<ul class="tab">
							<li><a href="/sub01/sub01_7_8.jsp?grp=REC5"><img src="/images/faq/sub01_7_8_1<% if (grp.equals("REC5")) { %>r<% } %>.gif" alt="채용전반" border="0"  id="four_button5"/></a></li>
							<li><a href="/sub01/sub01_7_8.jsp?grp=REC6"><img src="/images/faq/sub01_7_8_2<% if (grp.equals("REC6")) { %>r<% } %>.gif" alt="신입직(6급)채용관련" border="0" id="four_button6"/></a></li>
							<li><a href="/sub01/sub01_7_8.jsp?grp=REC7"><img src="/images/faq/sub01_7_8_3<% if (grp.equals("REC7")) { %>r<% } %>.gif" alt="전문직/경력직/병역특례 채용관련" border="0" id="four_button7"/></a></li>
							<li><a href="/sub01/sub01_7_8.jsp?grp=REC8"><img src="/images/faq/sub01_7_8_4<% if (grp.equals("REC8")) { %>r<% } %>.gif" alt="청년인턴채용관련" border="0" id="four_button8"/></a></li>
							<li><a href="/sub01/sub01_7_8.jsp?grp=REC11"><img src="/images/faq/sub01_7_8_5<% if (grp.equals("REC11")) { %>r<% } %>.gif" alt="인사전반" border="0" id="four_button11"/></a></li>
							<li><a href="/sub01/sub01_7_8.jsp?grp=REC9"><img src="/images/faq/sub01_7_8_6<% if (grp.equals("REC9")) { %>r<% } %>.gif" alt="인재양성교육" border="0" id="four_button9"/></a></li>
							<li><a href="/sub01/sub01_7_8.jsp?grp=REC10"><img src="/images/faq/sub01_7_8_7<% if (grp.equals("REC10")) { %>r<% } %>.gif" alt="복리후생" border="0" id="four_button10"/></a></li>
						</ul>
						<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="RECFAQ" adminURL="" sessionName="USERSESSION"/>
					</div>
				</div>
				<!--//끝-->
			</div>
		<%
			String phone = "";
			String nic_name = "";
			if("REC9".equals(request.getParameter("grp"))){
				phone = "052-216-2742"; //인재양성 교육
				nic_name = "백승목";
			}else if("REC10".equals(request.getParameter("grp"))){
				phone = "052-216-2762"; //복지후생
				nic_name = "김종학";
			}else{
				phone = "052-216-2706"; //나머지..
				nic_name = "박영환";
			}
		%>
		
		<%
			String team = "";
			if("REC9".equals(request.getParameter("grp"))){
				team = "인재육성팀"; //인재양성 교육
			}else if("REC10".equals(request.getParameter("grp"))){
				team = "복지후생팀"; //복지후생
			}else{
				team = "인사팀"; //나머지..
			}
		%>
		
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"></td>
						<td class="contact_team"><strong>담당부서 : </strong>인재경영처 <%=team %></td>
						<td class="contact_user"><strong>담당자 : </strong><%=nic_name %></td>
						<td class="contact_tel"><strong>연락처 : </strong><%=phone %></td>
					</tr>
				</tbody>
				</table>
			</div>						
			<!-- new_officer end -->
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>