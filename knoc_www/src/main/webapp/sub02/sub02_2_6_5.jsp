<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","13");
	application.setAttribute("gNavMenuDepth4","02");
//	application.setAttribute("gNavMenuDepth3","06");
//	application.setAttribute("gNavMenuDepth4","05");	
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%>
<!--// subtopNavi: start //-->

<div id="contents">
	<!--// leftmenu: start //-->
	<%@include file="/include/sub_leftmenu_new.jsp"%>
	<!--// leftmenu: end //-->
	<div id="rightarea">
		<div id="subcnts">
			<%@include file="/include/subtop_02.jsp"%>
			<!--// location: start //-->
			<div class="locadv">
				<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a> &gt; 
				<span>열린경영</span> &gt; <span>경영공시</span> &gt; <span>기타정보</span> &gt; <span class="locanow">연간 중소기업제품 구매실적</span>
			</div>
			<!--// location: end //-->
			<!--[2009-09-21 수정] :: 작성자: 장정인 -->
			<div class="pagetle">
				<h3><img src="/images/management/ttl_sub02_2_6.gif" alt="기타정보" /></h3>
			</div>
			<!--시작-->
			<div class="officer">
				<h4><img src="/images/management/sub02_2_6_9_ta.gif" alt="연간 중소기업제품 구매실적" border="0"/></h4>
				<h5>연간 중소기업제품 구매실적(2015)</h5>
				<!--표-->
				<p class="rtxt">(단위 : 백만원)</p>
				<table class="chart2" summary="한국석유공사 2015년 중소기업상품 등 구매실적을 구매액, 총구매액 대비 비율로 확인할 수 있습니다.">
					<caption>
					한국석유공사 2014년 중소기업제품 등 구매실적
					</caption>
					<col width="160px" />
					<col width="270px" />
					<col width="270px" />
					<thead>
						<tr>
							<th scope="col" class="first">구분</th>
							<th scope="col">구매액</th>
							<th scope="col">총구매액 대비 비율</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="first">중소기업제품</td>
							<td>80,402</td>
							<td>54.9%</td>
						</tr>
						<tr>
							<td class="first">기술개발제품</td>
							<td>628</td>
							<td>10.0%</td>
						</tr>
						<tr>
							<td class="first">여성기업제품</td>
							<td>18,232</td>
							<td>12.4%</td>
						</tr>
					</tbody>
				</table>
				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-01-31</td>
							<td class="contact_team"><strong>담당부서 : </strong>총무관리처 상생지원팀</td>
							<td class="contact_user"><strong>담당자 : </strong>이종찬</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2626</td>
						</tr>
					</tbody>
					</table>
				</div>
				<!--//표-->
			</div>
			<!-- new_officer end -->
			<!--div class="infoCheck">
				<%@include file="/include/satisfy_link.jsp"%>
			</div-->
			<!--//끝-->
		</div>
	</div>
</div>
<%@include file="/include/comfooter.jsp"%>
<!--// footer: start //-->
<!--// footer: end //-->
</div>
</body></html>