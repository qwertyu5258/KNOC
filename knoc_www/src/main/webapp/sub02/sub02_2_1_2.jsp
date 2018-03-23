<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","07");
	application.setAttribute("gNavMenuDepth4","02");
//	application.setAttribute("gNavMenuDepth3","01"); 경영공시 메뉴 개편
//	application.setAttribute("gNavMenuDepth4","02");	
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
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a> &gt; <span>열린경영</span> &gt; <span>경영공시</span> &gt; <span>일반현황</span> &gt; <span class="locanow">정관 및 관련법령</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_1.gif" alt="일반현황" /></h3>
				</div>
				<!--시작--> <div class="status"> <h4><img src="/images/management/sub02_2_1_7_ta1.gif" alt="정관 및 관련법령"/></h4>				
				</div> <neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="RELALAW" adminURL="" sessionName="USERSESSION"/>	
				<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"></td>
							<td class="contact_team"><strong>담당부서 : </strong>경영관리본부 법무팀</td>
							<td class="contact_user"><strong>담당자 : </strong>박원</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2272</td>
						</tr>
					</tbody>
				</table>
				</div>
								<!-- div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div-->	
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>