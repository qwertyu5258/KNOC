<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","05");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>     
<%@include file="/include/comheader.jsp"%>


<!--// subtopNavi: start //-->
<%@include file="/include/subtopnavi_new.jsp"%>
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
                   	&gt; <span>에특회계</span>
                  	&gt; <span class="locanow">사업융자, 보조지원안내</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
				<h3><img src="/images/business/ttl_sub03_7_5.gif" alt="사업융자, 보조지원안내" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
					<div>
						<ul class="tab">
						<li><a href="sub03_7_5.jsp"><img src="/images/business/ab_sub03_7_5_1.gif" alt="석유일반 사업자금대출" /></a></li>
						<li><a href="sub03_7_5_1.jsp"><img src="/images/business/ab_sub03_7_5_2.gif" alt="석유개발 사업자금대출" /></a></li>
<!--
						<li><a href="sub03_7_5_2.jsp"><img src="/images/business/ab_sub03_7_5_3r.gif" alt="해외석유 개발조사보조" /></a></li>
-->	
						<li><a href="sub03_7_5_3.jsp"><img src="/images/business/ab_sub03_7_5_4.gif" alt="원유도입선다변화 지원" /></a></li>
						</ul>
						<h5>사업개요</h5>
							<p>석유개발사업 참여시 유망광구를 확보하기 위해 정부는 대상광구의 기술적 · 경제적 타당성에 대한 사전조사 및 분석에 소요되는 비용 중 일부를 지원하여 석유개발사업 참여를 유도</p>
							<p><strong>※ 09년 이후 사업종료</strong></p>
						<h5>보조대상자</h5>
							<p>석유개발사업자 또는 지식경제부 장관이 지정한 사업자중에서 조사사업참여계획서를 제출하여 승인을 받은자</p>
						<h5>보조대상자사업비</h5>
							<p>석유개발사업 참여계약체결 직전까지 사업선정 및 타당성 조사를 위한 기술자료의 열람 · 구입 · 처리 · 해설 등에 소요되는 직접비용</p>
						<h5>지원절차</h5>
							<div><img src="../images/business/imgin1_sub03_7_5_3.gif" alt="해외석유 개발조사보조 사업비 지원절차"/>
								<ol class="blindtext">
								<li>01. 보조금 교부기준 공고 (지경부) 1월</li>
								<li>02. 세부보조기준 및 절차 수립 2월</li>
								<li>03. 조사사업 참여계획서 제출 2월</li>
								<li>04. 조사사업 참여계획서 승인 통보 3월</li>
								<li>05. 보조금 교부신청(보조대상자) 5월, 8월, 10월, 12월</li>
								<li>06. 기술적 타당성 심사(석유공사)  5월, 8월, 10월, 12월</li>
								<li>07. 보조금 심사 및 교부결정(안) 보고 (공고) 6, 9, 11, 12월 </li>
								<li>08. 교부결정액 확정/통보(지경부) 6월, 9월, 11월, 12월</li>
								<li>09. 보조금 지급(지경부) 6월, 9월, 11월, 12월</li>
								</ol>
							</div>
						<h5>2008 지원계획</h5>
                          <!--테이블-->
							<table class="chart1" summary="해외석유 개발조사보조 사업비 2008 지원계획을 확인할 수 있습니다.">
							
							<caption>해외석유 개발조사보조 사업비 2008 지원계획</caption>
							<col width="200px" />
							<col width="100px" />
							<col width="330px" />
							<thead>
							<tr>
							<th scope="col" class="first">구분</th>
							<th scope="col">2008년 예산</th>
							<th scope="col">비고</th>
							</tr>
							</thead>
							<tbody>
							<tr>
							<th scope="row" class="first">이라크광구 조사사업</th>
							<td class="tdcen">200</td>
							<td>※년 4회 지급</td>
							</tr>
							<tr>
							<th scope="row" class="first">에너지산업 해외진출 조사사업</th>
							<td class="tdcen">100</td>
							<td>1회~3회 : 각각 년간예산 25% 이내<br />보조대상금액의 50%이내에서 선지급</td>
							</tr>
							<tr>
							<th scope="row" class="first">전략경제국가 조사사업</th>
							<td class="tdcen">500</td>
							<td>4회 : 년간 보조대상금액 통합 정산후, 보조비율 조정</td>
							</tr>
							<tr>
							<th scope="row" class="first">계</th>
							<td class="tdcen">800</td>
							<td>&nbsp;</td>
							</tr>
							</tbody>
							</table>
	            			<!--테이블-->
						<h5>관련규정</h5>
							<p>산업자원부공고 제 2008-25 "해외석유개발조사 국고보조금 집행계획 및 보조기준" (2008.02.12)……… <a href="/upload/data/sub03/sanja2008_25.hwp" title="해외석유개발조사 국고보조금 집행계획 및 보조기준 다운로드"><img src="../images/information/btn_download.gif" style="vertical-align:middle" alt="해외석유개발조사 국고보조금 집행계획 및 보조기준 다운로드" /></a></p>
							<p>한국석유공사 "2008년도 해외석유개발조사사업 세부보조기준 및 절차" (2008.02.25)……… <a href="/upload/data/sub03/knoc2008_2_25.hwp" title="2008년도 해외석유개발조사사업 세부보조기준 및 절차 다운로드"><img src="../images/information/btn_download.gif" style="vertical-align:middle" alt="2008년도 해외석유개발조사사업 세부보조기준 및 절차 다운로드" /></a></p>
							<p>※ 자세한 사항은 한국석유공사 경영지원처 에특회계팀(전화 : 031-380-2392)으로 문의하시기 바랍니다.</p>
                	</div>

				</div>
				<!--//끝-->
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<colgroup>
					<col width="auto" />
					<col width="22%" />
					<col width="22%" />
				</colgroup>
				<tbody>
					<tr>
						<td><strong>담당부서 : </strong>총무관리처 에특회계팀</td>
						<td><strong>연락처 : </strong>031-380-2402</td>
						<td><strong>관리일 : </strong>2015-09-30</td>
					</tr>
				</tbody>
				</table>
			</div><!-- new_officer end -->
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>