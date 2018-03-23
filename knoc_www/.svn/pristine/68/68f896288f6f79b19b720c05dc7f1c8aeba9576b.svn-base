<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","12");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>        
<%@include file="/include/comheader.jsp"%>

	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
		<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_05.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>정보마당</span> 
					&gt; <span class="locanow">정보공개청구</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3 class="tleimg"><img src="/images/information/ttl_sub05_4_3.gif" alt="정보공개청구" /></h3>
				</div>
				<div class="officer" >
					<ul class="tab">
						<li><a href="/sub04/sub04_9_3.jsp" ><img src="/images/business/tab_sub04_9_3_1on.gif" alt="온라인청구"/></a></li>
						<li><a href="/sub04/sub04_9_3_1.jsp" ><img src="/images/business/tab_sub04_9_3_2.gif" alt="오프라인청구" /></a></li>
						<li><a href="http://www.open.go.kr" target="_blank"><img src="/images/business/tab_sub04_9_3_3.gif" alt="정보정보공개시스템" /></a></li>
					</ul>
			   </div> <!-- officer end  -->
			</div> <!-- subcnts end -->
			
			<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="INFOOPEN" adminURL="" sessionName="USERSESSION" />
			 
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<colgroup>
					<col width="auto" />
					<col width="22%" />
					<col width="22%" />
				</colgroup>
				<tbody>
					<tr>
						<td><strong>담당부서 : </strong>총무관리처 총무팀</td>
						<td><strong>연락처 : </strong>031-380-2308</td>
						<td>&nbsp;</td>
					</tr>
				</tbody>
				</table>
			</div> <!--new_officer end -->
			
		</div>
	</div>
	
  <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>