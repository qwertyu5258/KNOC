<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","12");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","04");
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
                    &gt; <span>센터소개</span>
                    &gt; <span class="locanow">교수진</span>
				</div>
				<!--// location: end //-->


				<div class="pagetle">
					<h3><img src="/images/info/tit_sub12_1_4.gif" alt="교수진 " /></h3>
				</div>
				<!--시작-->
				<div class="business2">
						<h5 style="font-weight: normal;margin:5px 0 0 10px; ">
						석유가스인재개발센터는 박사급 또는 전문자격증을 보유하고,
						글로벌 사업경험을 보유하고 있는 사내 교수를 비롯하여,<br/> 자회사,
						국제석유전문기관, 대학 등과 협력하여 최고의 교수진으로 운영합니다.
						</h5>
						<p style="margin:50px 0 0 45px;"><img src="/images/info/sub012_01_img04.gif" alt="
						석유가스 인재개발센터 교수 KOGS Faculty, Dana, HOC, GTRC, 사내 박사 및 현장 전문 교수인력, 국제석유 전문교육 협력기관(Nautilus, Petroskills),대학
						"  style="width:580px; height:469px;  "/></p>

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