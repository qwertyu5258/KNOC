<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","08");
	application.setAttribute("gNavMenuDepth3","06");
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
				<%@include file="/include/subtop_03.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>사업소개</span>
                    &gt; <span>기술개발</span>
                    &gt; <span class="locanow">석유개발 자료관리</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_9_6.gif" alt="석유개발 자료관리" /></h3>
				</div>
				<!--시작-->
				<div class="business5">
					<p>공사는 석유개발 기술자료를 일괄 통합관리하며, 자료관리 시스템의 지속적인 개선을 통하여 사용자의 접근성과 자료검색이 원활하도록 운영하고 있습니다.</p>
					<div>                   
						<ul>   
							<li>
								<dl>
								<dt>E&P분야 기술자료 프로젝트 결과물 관리(KOTIS, Studio 와 Prosource DB) </dt>									
							    </dl>
							 </li>		                    
							 <li>
								<dl>
								<dt>탄성파 탐사자료 변환 (SEG-Y)</dt>									
							    </dl>
							 </li>
							 <li>
								<dl>
								<dt>시추시료 관리 및 지원 </dt>
								</dl>
							 </li>
							 <li>
								<dl>
								<dt>E&P분야 컴퓨터 그래픽 자료작성 지원</dt>									
							    </dl>
							 </li>
						</ul>
					</div>
				<div style="height: 30px;"></div>
				</div>
				<!--//끝-->

				<!-- new_officer -->
				<div class="new_officer" style="left:2%">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-08-20</td>
						<td class="contact_team"><strong>담당부서 : </strong>기술개발처 기술총괄팀</td>
						<td class="contact_user"><strong>담당자 : </strong>이종은</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-3503</td>
					</tr>
					</tbody>
					</table>
				</div>
				<!-- new_officer -->
			</div>
		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>