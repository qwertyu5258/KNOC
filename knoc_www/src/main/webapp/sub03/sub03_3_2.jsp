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
					&gt; <span>사업소개
</span>
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
						<li><a href="sub03_3_2.jsp" title="지상비축기지"><img src="/images/business/img_tab_sub03_3_1_01_on.gif" alt="지상비축기지" /></a></li>
						<li><a href="sub03_3_2_1.jsp" title="지하비축기지" ><img src="/images/business/img_tab_sub03_3_1_02.gif" alt="지하비축기지" /></a></li>
						<li><a href="sub03_3_2_2.jsp" title="건설방식별비고" ><img src="/images/business/img_tab_sub03_3_1_03.gif" alt="건설방식별비고" /></a></li>
						<li><a href="sub03_3_2_3.jsp" title="품질, 안전, 환경관리" ><img src="/images/business/img_tab_sub03_3_1_04.gif" alt="품질, 안전, 환경관리" /></a></li>
						</ul>
						<div class="mT20"><img src="../images/business/img_sub03_3_2_01.gif" alt="비축기지 장면" /></div>
						<h5>저장유종에 따른 탱크형태</h5>
							<table class="chart2" summary="탱크형태별 저장유종 정보를 보여줍니다.">
								<caption>저장유종에 따른 탱크형태</caption>
									<col width="70px" />
									<col width="160px" />
									<col width="170px" />
									<col width="240px" />
								<thead>
								<tr>
									<th scope="col" class="first">탱크형태</th>
									<th scope="col">CRT(Cone Roof Type)</th>
									<th scope="col">FRT(Floating Roof Type)</th>
									<th scope="col">IFRT(Internal Floating Roof Type)</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td class="first">저장유종</td>
									<td>경유, 등유, 나프타</td>
									<td>원유, 경유, 등유</td>
									<td>휘발유, 나프타</td>
								</tr>
								</tbody>
							</table>
						<h5>지상탱크 건설과정</h5>
						<div><img src="../images/business/img_sub03_3_2_1.gif" alt="지상탱크 건설과정"/>
							<p class="blindtext">1.탱크기초 설치<br/>
							2.바닥판 설치<br/>
							3.측판 및 내부 Structure 설비<br/>
							4.지붕판 설치<br/>
							5.탱크 내·외부 도장<br/>
							6.완공</p>
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
	</div>
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>