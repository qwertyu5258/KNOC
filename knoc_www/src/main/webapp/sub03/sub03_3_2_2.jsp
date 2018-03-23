<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","03");
	application.setAttribute("gNavMenuDepth3","02");
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
                    &gt; <span class="locanow">비축기지건설</span>
				</div>
				<!--// location: end //-->

				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_3_2.gif" alt="비축기지건설 " /></h3>
				</div>
				<!--시작-->
                <div class="business2">
					<div>
					   <ul class="tab">
                    	<li><a href="sub03_3_2.jsp" title="지상비축기지" ><img src="/images/business/img_tab_sub03_3_1_01.gif" alt="지상비축기지" /></a></li>
						<li><a href="sub03_3_2_1.jsp" title="지하비축기지" ><img src="/images/business/img_tab_sub03_3_1_02.gif" alt="지하비축기지" /></a></li>
						<li><a href="sub03_3_2_2.jsp" title="건설방식별비고" ><img src="/images/business/img_tab_sub03_3_1_03_on.gif" alt="건설방식별비고" /></a></li>
						<li><a href="sub03_3_2_3.jsp" title="품질, 안전, 환경관리" ><img src="/images/business/img_tab_sub03_3_1_04.gif" alt="품질, 안전, 환경관리" /></a></li>
						</ul>
							<h5>지상과 지하비축의 장단점</h5>
								<table class="chart1" summary="지상과 지하비축의 장단점을 확인할 수 있습니다.">
								<caption>지상과 지하비축의 장단점</caption>
								<col width="70px" />
								<col width="250px" />
								<col width="250px" />
								<thead>
								<tr>
								<th scope="col" class="first">구분</th>
								<th scope="col">지상비축방식</th>
								<th scope="col">지하비축방식</th>
								</tr>
								</thead>
								<tbody>
								<tr>
								<th scope="row" class="first">장점</th>
								<td align="left"><p>공사기간 단축(3~5년)</p>
								<p>시공용이</p></td>
								<td><p> 반영구적 사용가능</p>
								<p>건설비, 유지관리비 저렴</p>
								<p>환경친화적(자연훼손 최소화)</p></td>
								</tr>
								<tr>
								<th scope="row" class="first">단점</th>
								<td><p>외부공격, 화재 등 안전성 취약</p>
								<p>건설비, 유지관리비 고가</p>
								<p>시설내구연한단기(15년)</p></td>
								<td><p>건설공기 장기화(5~8년)</p></td>
								</tr>
								</tbody>
								</table>
							<h5>지상, 지하 비축기지의 경제성 검토</h5>
								<div class="contCon3">
									<div><img src="../images/business/img_sub03_3_2_2_01.gif" alt="제품유에 대한 지상, 지하 비축기지의 경제성 검토 그래프" /></div>
									<p>입지 및 지질여건에 따라 달라질 수 있으나, 일반적으로 <span>240만 배럴 이하에서는 지상시설</span>이 유리하며, <span >240만 배럴 이상에서는 지하시설</span>이 유리합니다.</p>
								</div>
								<div class="contCon3 mT20">
									<div><img src="../images/business/img_sub03_3_2_2_02.gif" alt="원유에 대한 지상, 지하 비축기지의 경제성 검토 그래프" /></div>
									<p>입지 및 지질여건에 따라 달라질 수 있으나, 일반적으로 <span>560만 배럴 이하에서는 지상시설</span>이 유리하며, <span>560만 배럴 이상에서는 지하시설</span>이 유리합니다.</p>
								</div>
								 <p>비축기지 건설현황 중 3차공사의 배럴당 건설사업비와 운영중의 유지관리비를 검토하여 비축기지 건설 원가를 근거로 배럴당 비용을 분석한 결과, 건설비 측면에서는 큰 차이가 없으나, 유지관리비와 시설의 내용년수(지하40년이상, 지상 약20년)를 고려할 경우 지하비축기지가 훨씬 유리합니다.(약 50% 비용절감 가능)<br />특히, 지상탱크의 경우 시간이 경과함에 따라 유지관리비가 급격히 증가하고 비축유의 자연감모율이 크고 VOC발생 등 환경적으로도 불리하므로, 대규모 원유 비축기지는 지하비축방식으로 건설하는 것이 절대적으로 유리합니다.</p>
						</div>
				<!--//끝-->
		  </div>
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

	</div>
	</div>
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>