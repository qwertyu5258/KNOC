<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","03");
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
				<%@include file="/include/subtop_03.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>사업소개
</span>
                    &gt; <span>건설사업</span>
                    &gt; <span class="locanow">건설사업개요</span>
				</div>
				<!--// location: end //-->

				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_3_1.gif" alt="건설사업개요" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
					<p class="contTop"><strong>한국석유공사는 그동안 축적된 비축기지건설사업 노하우를 바탕으로 안전하고 친환경적인 석유저장시설을 건설하고 있습니다.</strong></p>
					<div><img src="../images/business/img_sub03_3_1_13.gif" alt="지상탱크비축기지 전경, 지하저장동굴, 입출하부두 장면" /></div>
					<h5>사업 목적</h5>
					<ul>
					<li>국내 석유류 수급안정을 위한 <span class="cDD0902">정부 비축목표 달성</span></li>
					<li>고품질의 설계와 시공으로 <span class="cDD0902">안전하고 환경친화적 비축기지 건설</span></li>
					<li>건설민원 해소로 <span class="cDD0902">주민과 함께하는 기지건설</span></li>
					<li>석유 공급물량 확보를 위한 <span class="cDD0902">석유·천연가스 생산시설 건설</span></li>
					</ul>

					<h5>비축기지현황</h5>
						<p class="rtxt">(단위 : 백만배럴)</p>

						<table class="chart2"  summary="비축기지현황을 확인할 수 있습니다.">
						<caption>비축기지현황</caption>
						<col width="120px" />

						<col width="110px" />
						<col width="110px" />
						<col width="110px" />
						<col width="120px" />
						<thead>
						<tr>
						<th scope="col" class="first">보유기지</th>
						<th scope="col">원유</th>
						<th scope="col">제품</th>
						<th scope="col">LPG</th>
						<th scope="col">계</th>
						</tr>
						</thead>
						<tbody>
						<tr>
						<td class="first">9개소</td>
						<td>127.5</td>
						<td>14.1</td>
						<td>4.4</td>
						<td>146.0</td>
						</tr>

						</tbody>
						</table>

					<h5>사업수행절차</h5>
					<p>건설사업추진계획 수립에서부터 조사설계, 시공 및 시운전에 이르기까지 ISO9001/14001인증을 기반으로 철저한 품질 및 안전관리 제고를 통하여 비축기지를 적기에 준공함으로써 정부비축목표를 달성하였으며, 환경친화적인 기지건설, 공법개선 등을 통한 원가절감으로 국민부담차 최소화하는 등 경제적인 기지건설에도 지속적인 노력을 기울이고 있습니다.</p>
					<div><img src="../images/business/imgin1_sub03_3_1.gif" align="top" class="pt03" alt="사업수행절차" />
						<dl class="blindtext">
							<dt>대관인허가, 환경영향평가</dt>
							<dd>석유비축 기본계획 수립 및 입지 타당성 조사</dd>
							<dd>사업추진 세부계획 수립</dd>
							<dd>조사설계</dd>
							<dd>설계심의</dd>
							<dd>공사시공 및 감리</dd>
							<dd>비축기지 운영</dd>
						</dl>
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

		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>