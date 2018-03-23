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
						<li><a href="sub03_7_5_1.jsp"><img src="/images/business/ab_sub03_7_5_2r.gif" alt="석유개발 사업자금대출" /></a></li>
						<!-- <li><a href="sub03_7_5_2.jsp"><img src="/images/business/ab_sub03_7_5_3.gif" alt="해외석유 개발조사보조" /></a></li>-->
						<!-- <li><a href="sub03_7_5_3.jsp"><img src="/images/business/ab_sub03_7_5_4.gif" alt="원유도입선다변화 지원" /></a></li>-->
						</ul>

						<h5>사업개요</h5>
						<p>국내외 석유개발을 위하여 산업통상자원부장관에 신고를 한 사업자를 대상으로 탐사, 개발 및 생산사업 등에 자금을 지원</p>
						<h5>지원사업</h5>
						<ul>
							<li><strong>탐사사업 :</strong> 석유광구에서 석유자원의 부존을 확인하기 위하여 행하는 지질조사, 물리탐사, 탐사시추, 평가시추 등의 사업(상업적 생산에 도달하지 못한 경우에 동일 광구 내에서 매장량 확보를 위한 탐사작업을 포함한다)</li>
							<li><strong>개발사업 :</strong> 석유의 부존이 확인된 광구 또는 개발단계에 있는 유전의 광권취득 및 지분을 매입하거나, 상업적 생산을 위한 생산시설과 부대시설 건설 등의 모든 사업</li>
							<li><strong>생산사업 :</strong> 운영권자 또는 비운영권자로서 상업적 생산단계에 있는 광구의 권리취득 및 지분매입, 생산설비 건설, 추가매장량 확보를 위한 시추 등의 사업</li>
							<li><strong>투자위험보증사업 :</strong> 해외자원개발투자회사등에게 해외자원개발사업의 투자로 인하여 발생하는 일정한 손실의 보상을 약속하고 금전을 수수하는 사업</li>
						</ul>
						<table class="chart1" summary="투자위험보증사업 현황을 확인할 수 있습니다.">

						<caption>투자위험보증사업 현황</caption>
						<col width="80px" />
						<col width="180px" />
						<col width="180px" />
						<col width="180px" />
						<thead>
						<tr>
						<th scope="col" class="first">융자 대상사업</th>
						<th scope="col">최대 융자 비율</th>
						<th scope="col">융자기간</th>
						<th scope="col">이자율</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="first">조사(탐사)사업</td>
							<td rowspan="3">해당 사업비의 50% 이내로 한다. 다만, 추가지원 적용항목  증빙자료 제출시 최대 30%이내까지 추가지원 가능 <br />

                                        ※단, 국내대륙붕 사업에 대한 융자는 추가지원 적용항목 해당유무와 관계없이 최대 80%이내(공사는 100%이내)<br />
                                        
                                        &lt;추가지원 적용항목&gt;<br /><br />
                                        
                                        가. 10%p 범위 이내<br />
                                        ①사업운영권 확보 사업<br />
                                        ②기초탐사 및 지분인수 타당성 조사에 대하여 국내 자원개발 관련 서비스 기업을 활용하는 경우<br />
                                        ③ 해당 사업의 광구 현장을 국내 기술개발 사업에 제공하는 경우<br />
                                        ④국내 도입이 가능한 사업<br /><br />
                                        
                                        나. 5%p 범위 이내<br />
                                        ①자원보유국과의 자원협력사업(정상외교, 자원협력위 등을 통한 발굴 과제,사후관리 과제) 또는 에너지인프라·산업인프라 등과 동반진출 사업<br /> 
                                        ②중소기업기본법 제2조의 중소기업인 경우 <br />
                                        ③기술성 및 사업성평가가 우수한 것으로 융자심의회에서 인정하는 사업<br />
                                        ④인력양성·기술력향상 우수프로그램운영<br />
						    </td>
							<td>①15년 이내(거치기간 포함)로 하되 융자원리금을 상환받기 위하여 필요한 경우 산업통상자원부장관의 승인을 받아 융자기간(거치기간 포함)을 연장할 수 있다.<br>
						    ②거치기간은 상업적 생산이 개시되어 사업수익금을 최초로 받는 날의 직전일 까지로 한다.<br></td>
							<td>①융자 및 대출이자율은 에너지및자원사업특별회계운용요령에 정한 이자율에 의함<br>
						    ②거치기간중의 이자는 거치기간 만료시 발생하는 것으로 하며 6월 단위로 복리로 계산하여 원금에 가산한다.</td>
						</tr>
						<tr>
							<td class="first">개발사업</td>
							<td>10년 이내 
						    (거치기간 5년 이내)<br></td>
							<td>융자 및 대출이자율은 에너지및자원사업특별회계운용요령에 정한 이자율에 의함. 다만, 공사직접사용분의 융자이자율은 대출금리와 동일하게 적용한다.</td>
						</tr>
						<tr>
							<td class="first">생산사업</td>
							<td>10년 이내(거치기간 5년 이내)</td>
							<td>융자 및 대출이자율은 에너지및자원사업특별회계운용요령에 정한 이자율에 의함. 다만, 공사직접사용분의 융자이자율은 대출금리와 동일하게 적용한다.<br></td>
						</tr>
						<tr>
							<td class="first">투자위험<br/>보증사업</td>
							<td>투자위험보증사업비의 100%이내</td>
							<td>①5년 이내(거치기간 5년이내)<br>
						    ②사업의 연장을 위하여 필요한 경우 산업통상자원부 장관의 승인을 얻어 융자기간(거치기간 포함)을 5년 단위로 연장할 수 있다.<br></td>
							<td>①융자 및 대출이자율은 에너지및자원사업특별회계운용요령에 정한 이자율에 의함<br>
						    ②거치기간중의 이자는 거치기간 만료시 발생하는 것으로 하며 6월 단위로 복리로 계산하여 원금에 가산한다</td>
						</tr>
						</tbody>
						</table>
						<p>※ 생산사업은 광구 권리취득, 지분참여에 소요되는 비용만 가능</p>
						<p class="pl20">매 분기별 변동금리 ……… <a href="/filedown.jsp?fileno=32&filepath=/upload/data/sub03/" target="_blank" title="새창"><img src="../images/information/btn_download.gif" style="vertical-align:middle" alt="매 분기별 변동금리 다운로드" /></a></p>
						<h5>상환방법</h5>
						<ul>
							<li>탐사사업
								<p>- 상환일자 : 연 2회(상 · 하반기별) 3월 15일, 9월 15일<br />- 상환방법 : 분기별 사업수익금에서 당해기간의 운영비 및 개발비를 차감한 잔액(운영잔액)에 대해 대출기여율을 적용하여 대출원리금 상환</p>
								<p>※ 탐사사업은 사업성공시 대출원리금 상환 외에 별도로 특별부담금을 징수하며, 사업실패시 대출원리금을 감면(성공불융자)</p></li>
							<li>개발 및 생산사업
								<p>- 상환일자 : 연 2회(상 · 하반기별) 6월 15일, 12월 15일<br />
								- 상환방법 : 연 2회 균등분할 상환</p></li>
							<li>투자위험보증사업
								<p>- 상환일자 : 3월 15일, 9월 15일<br />
								- 상환방법 : 거치기간 만료일까지의 투자위험보증사업수익금에서 투자위험보증사업자출금을 차감한 잔액이내에서 융자원리금 상환</p></li>
						</ul>
						<h5>관련규정</h5>
						<ul>
							<li>산업통상자원부
								<p>「해외자원개발사업자금 융자기준」……… <a href="/filedown.jsp?fileno=28&filepath=/upload/data/sub03/" target="_blank" title="새창"><img src="../images/information/btn_download.gif" style="vertical-align:middle" alt="해외자원개발사업자금 융자기준 다운로드" /></a></p>
								<p><!--……… <a href="/upload/data/sub03/financing_2009.hwp"><img src="../images/information/btn_download.gif" style="vertical-align:middle" alt=" 2010년도 해외석유개발사업자금의 융자집행계획 및 융자기준다운로드" /></a> --></p></li>
							<li>한국석유공사
								<p>「석유개발사업자금 대출 및 관리규정」………
								<a href="/filedown.jsp?fileno=31&filepath=/upload/data/sub03/" target="_blank" title="새창"><img src="../images/information/btn_download.gif" class="vMid" alt="석유개발사업자금대출및관리규정(2011-10-31)" /></a></p>
								<p><!--……… <a href="/upload/data/sub03/5.hwp"><img src="../images/information/btn_download.gif" style="vertical-align:middle" alt="2010년도 석유개발사업자금 대출지원계획 다운로드" /></a> --></p>
								<p class="pt10 pl15">※ 세부사항은 한국석유공사 총무관리처 융자팀(전화 : 052-216-2665)으로 문의하시기 바랍니다.</p></li>
						</ul>
						<h5>석유개발사업자금 융자절차도</h5>
						<div><img src="/images/business/n_img_procedures.gif" alt="석유개발사업자금 융자절차도" />
							<div class="blindtext">
								<ol>
									<li>1. 사업신고(사업자 → 산업통상자원부)</li>
									<li>2. 신고수리(산업통상자원부 → 사업자)</li>
									<li>3. 융자신청(사업자 → 산업통상자원부)</li>
									<li>4. 융자심의의뢰(산업통상자원부 → 해외자원개발협회)</li>
									<li>5. 융자심사 의뢰(해외자원개발협회 → 자원개발 전문기관(지자연·석유공사))</li>
									<li>6. 심사결과 통보(자원개발 전문기관(지자연·석유공사) → 해외자원개발협회)</li>
									<li>7. 심의회 상정(해외자원개발협회 → 감면심의회)</li>
									<li>8. 심의 의결(감면심의회 → 해외자원개발협회)</li>
									<li>9. 융자승인 요청(해외자원개발협회 → 산업통상자원부)</li>
									<li>10. 융자승인 통보(산업통상자원부 → 융자업무대행기관(석유공사))</li>
									<li>11.약정체결 및 대출서류 제출(사업자 ↔ 융자업무대행기관(석유공사))</li>
									<li>12. 융자금 차입(융자업무대행기관(석유공사) → 산업통상자원부)</li>
									<li>13. 대출실행(사업자 ↔ 융자업무대행기관(석유공사))</li>
								</ol>
							</div>
						</div>
						<p>* 해외자원개발협회는 융자심사의 행정적인 절차에 관한 사항을 융자고시에 의거 산업통상자원부로부터<br />위탁받아 수행. 자원개발 전문기관은 지질자원연구원과 석유공사 기술실임</p>
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
					<td class="write_day"><strong>작성기준일 : </strong>2016-10-19</td>
					<td class="contact_team"><strong>담당부서 : </strong>총무관리처 에특/융자팀</td>
					<td class="contact_user"><strong>담당자 : </strong>김경만</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-2665</td>
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