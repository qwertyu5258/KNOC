<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","08");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","01");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>       
<%@include file="/include/sub08_auth.jsp"%>
<%@include file="/include/comheader.jsp"%>


	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
		<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_08.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>이사회</span>
					&gt; <span>이사회운영</span>
                    &gt; <span>운영계획 및 연차보고서</span>
					&gt; <span class="locanow">이사회운영계획</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/directors/ttl_sub08_2_2_1.gif" alt="이사회운영계획" /></h3>
				</div>
				<!--시작-->
				<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="PLAN" adminURL="" sessionName="USERSESSION"/>
				 <!--//끝-->
			</div>
			
			<!-- new_officer -->
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"></td>
					<td class="contact_team"><strong>담당부서 : </strong>기획조정처 기획관리팀</td>
					<td class="contact_user"><strong>담당자 : </strong>이상영</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-2209</td>
				</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer -->	
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>