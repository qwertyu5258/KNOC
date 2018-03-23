<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","11");
	application.setAttribute("gNavMenuDepth2","02");
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
				<%@include file="/include/subtop_11.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>사이버홍보실</span>
                    &gt; <span class="locanow">포토뉴스</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2010-01-07 수정] :: 작성자: 서봉선 -->
				<div class="pagetle">
					<h3><img src="/images/information/ttl_sub05_3_5.gif" alt="포토뉴스" /></h3>
				</div>
				<!--시작-->				
				<div class="photonews">

<%
	try{
%>
<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="PHOTONEW" adminURL="" sessionName="USERSESSION"/>
<%
					}catch(Exception e){out.println(e);}	
%>
					
				</div>				
				<!--//끝-->
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"></td>
							<td class="contact_team"><strong>담당부서 : </strong>기획조정처 홍보팀</td>
							<td class="contact_user"><strong>담당자 : </strong>박호광</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2227</td>
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