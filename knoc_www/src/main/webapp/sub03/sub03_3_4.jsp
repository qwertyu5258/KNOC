<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","03");
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
                    &gt; <span>건설사업</span>
                    &gt; <span class="locanow">해외사업추진</span>
				</div>
				<!--// location: end //-->

				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_3_4.gif" alt="해외사업추진" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
                    <h5 class="mT0">개요</h5>
                    <p>한국석유공사는 지난 1970년대 말 비축기지 건설이 완료된 북유럽 등과는 달리 1980년 대 초부터 지금까지 지하비축기지 건설과 운영이 동시에 이루어지고 있는 전 세계적으로 유일한 나라로 동 분야에서 세계 최고의 기술력을 보유하고 있습니다.</p>
					<p class="pt05 pl10">이러한 기술력과 경험을 바탕으로 경제 고도성장에 따른 석유수요가 급증하고 있는 중국, 인도 등을 상대로 해외 전략 석유류 비축사업에 국내 민간업체와의 공동 참여를 추진함으로써 우리공사의 기술력을 세계무대에 입증하고 국내 민간업체의 해외진출을 촉진하는 등 국가경제 발전에 기여하고 있습니다.</p>
					<h5>추진현황</h5>

						<table class="chart1" summary="해외사업 추진현황을 확인할 수 있습니다.">

						<caption>해외사업 추진현황</caption>
						<col width="150px;" />
						<col />
						<thead>
						<tr>
						<th scope="col" class="first">구분</th>
						<th scope="col">기능</th>
						</tr>
						</thead>
						<tbody>
						<tr>
						<td class="first">해외사업 기반조성 단계</td>
						<td><p>기술설명회 개최 및 국제세미나 참가</p>
						<p>발주기관 초성사업 추진</p>
						<p>중국 CPP, 인도 OIDB와 기술협약 체결</p></td>
						</tr>
						<tr>
						<td class="first">사업수행 및 활성화</td>
						<td><p>중국 진저우 지하비축기지 타당성조사 자문용역 수행</p>
						<p>인도 Mangalore 비축기지 건설공사 인력 파견(1명 예정)</p>
						<p> 베트남 에너지마스터플랜(석유비축부문) 공동연구수행</p>
						<p>이라크 광권확보를 위한 쿠르드지역의 SOC 사업 수행</p></td>
						</tr>
						</tbody>
						</table>

						<div class="Cboth pT20"><img src="../images/business/img_sub03_3_4_1.gif" alt="추진현황 장면"/>
							<ul class="blindtext">
							<li>인도 OIDB와 MOU 체결(05.11월)</li>
							<li>중국 CPP 대표단 여수지하비축기지 방문</li>
							<li>중국 진저우 지하비축기지 현장답사 (06.8월)</li>
							<li>이라크 쿠르드 석유개발</li>
							<li>SOC 연계사업 계약체결</li>
							<li>베트남 에너지마스트플랜 수립관련 회의</li>
							</ul>
						</div>
					</div>
				<!--//끝-->
			</div>

			<!-- new_officer -->
			<div class="new_officer" style="left:2%">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"></td>
					<td class="contact_team"><strong>담당부서 : </strong>비축시설처 건설사업팀</td>
					<td class="contact_user"><strong>담당자 : </strong>김동욱</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-5328</td>
				</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer -->

			<!-- new_officer -->
			<div class="new_officer mT10" style="left:2%">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"></td>
					<td class="contact_team"><strong>담당부서 : </strong>시추건설처 프로세스팀</td>
					<td class="contact_user"><strong>담당자 : </strong>김승임</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-3949</td>
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