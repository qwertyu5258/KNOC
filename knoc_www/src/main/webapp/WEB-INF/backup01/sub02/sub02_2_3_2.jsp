<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","02");
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
				<%@include file="/include/subtop_02.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>열린경영</span>
                    &gt; <span>경영공시</span>
					&gt; <span>재무현황</span>
                    &gt; <span class="locanow">외부회계감사보고서</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_3.gif" alt="재무현황" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<h4><img src="/images/management/sub02_2_2_9ta1.gif" alt="외부회계감사보고서" /></h4>
				
				</div>	
				<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="ACCOUNT" adminURL="" sessionName="USERSESSION"/>
				<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"></td>
							<td class="contact_team"><strong>담당부서 : </strong>재무처 회계팀</td>
							<td class="contact_user"><strong>담당자 : </strong>이가희</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2459</td>
						</tr>
					</tbody>
				</table>
				</div>						
				<div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div>				
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>