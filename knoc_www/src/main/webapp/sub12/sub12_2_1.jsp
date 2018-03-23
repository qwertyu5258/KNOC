<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","12");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","01");
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
				<%@include file="/include/subtop_12.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>인재개발센터</span>
                    &gt; <span>교육과정</span>
                    &gt; <span class="locanow">교육영역</span>
				</div>
				<!--// location: end //-->

				<!-- [2009-10-25 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/info/tit_sub12_1_5.gif" alt="교육영역" /></h3>
				</div>
				<!--시작-->
				<div class="business2">

						<p style="margin-left:70px;"><img src="/images/info/sub012_01_img05.gif"
						 alt=" 석유 가스 전문 교육, Petroleum Technology-G&G, 석유공학, 시추공학, 생산시설공학 4 Tracks, Petroleum Business-석유계약, 석유회계, HSE, Trading 등  7 Tracks
						 실무 기초 이론, 실무 중급 이론, 프로젝트 Case Study, Project Based W/S, 현장교육
						" /></p>
				</div>
				<div style="height:50px; clear:both;"></div>
				<!--//끝-->


				<!-- new_officer -->
				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
						<td class="contact_team"><strong>담당부서 : </strong>인재경영처 인재육성팀</td>
						<td class="contact_user"><strong>담당자 : </strong>백승목</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2742</td>
					</tr>
					</tbody>
					</table>
				</div>
				<!-- new_officer -->

		</div>
	</div>

	</div>
    
        <!--// footer: start //-->
		<%@include file="/include/comfooter.jsp"%>
		<!--// footer: end //-->
    </div>
    
</body>
</html>