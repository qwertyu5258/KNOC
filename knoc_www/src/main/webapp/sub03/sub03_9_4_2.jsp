<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","08");
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
				<%@include file="/include/subtop_03.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>사업소개</span>
                    &gt; <span>기술개발</span>
                    &gt; <span>비전통에너지</span>
                    &gt; <span class="locanow">치밀/셰일 오일·가스 탐사-개발-생산기술</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_9_4.gif" alt="비전통에너지" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<ul class="tab">
					<li><a href="sub03_9_4.jsp" title="오일샌드 탐사 및 생산기술" ><img src="/images/business/tab_sub03_9_4_01.gif" alt="오일샌드 탐사 및 생산기술" /></a></li>
					<li><a href="sub03_9_4_2.jsp" title="치밀/셰일 오일·가스 탐사-개발-생산기술" ><img src="/images/business/tab_sub03_9_4_02r.gif" alt="치밀/셰일 오일·가스 탐사-개발-생산기술" /></a></li>
					</ul>
				</div>

				<div class="business">
					<h4 class="mT0"><img src="../images/business/img_ttl_sub03_9_4_02.gif" alt="치밀/셰일 오일·가스 탐사-개발-생산기술" /></h4>
					<p>치밀/셰일 오일·가스는 유체투과도가 매우 낮은 사암, 탄산염암은 물론 셰일지층 내 부존되어 있는 오일 및 가스를 말합니다. 과거에는 시추기술의 부족과 낮은 생산성으로 인한 경제성 미흡으로 개발이 불가능했으나, 최근에는 수평시추기술과 수압파쇄공법으로 상업적 개발 및 생산이 가능하게 되었습니다.</p>
					<p class="mT20">공사는 2010년 이글포드 사업에 대한 아나다코사와의 합작투자를 계기로 치밀/셰일사업으로의 본격 진출 및 다양한 연구 과제를 수행하게 되었습니다. 이와 더불어 2013년부터는 셰일가스 개발기술 자립화 3단계 프로젝트를 추진함으로써 저류층 특성화, 유정완결 및 수압파쇄 그리고 생산운영 최적화 기술역량을 도모함은 물론 캐나다 Montney 자산을 대상으로 한 4개년 정부수탁과제를 수행 중에 있습니다.</p>
				</div>
				<!--//끝-->

				<!-- new_officer -->
				<div class="new_officer" style="left:2%">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-08-20</td>
						<td class="contact_team"><strong>담당부서 : </strong>기술개발처 기술개발팀</td>
						<td class="contact_user"><strong>담당자 : </strong>변지훈</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-3537</td>
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