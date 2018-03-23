<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","02");
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
				<%@include file="/include/subtop_02.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>열린경영</span>
                    &gt; <span>경영공시</span>
					&gt; <span>경영현황</span>
                    &gt; <span class="locanow">경영목표</span>
				</div>
				<!--// location: end //-->

				<!--[2009-10-23 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_2_1.gif" alt="경영현황" /></h3>
				</div>
				<!--시작-->
				<div class="officer3">
					<h4><img src="/images/management/sub02_2_1_9_ta1.gif" alt="경영목표" border="0"/></h4>
					<!--h5>근거 : 공공기관의 운영에 관한 법률 제46조</h5-->
					<ul>
						<li><strong>전략목표 : 내실화를 통한 질적 성장</strong></li>
						<li><strong>전략방향</strong>
							<dl>
								<dt>기술기반 성장 추구</dt>
							</dl>
							<dl>
								<dt>자산의 효율적 운영</dt>
							</dl>
							<dl>
								<dt>글로벌 통합 경영</dt>
							</dl>
						</li>
						<li><strong>전략과제</strong>
							<dl>
								<dt>E&amp;P사업 지속성장 기반마련<br />
								· 기술 기반 탐사 추진<br />
								· 개발생산자산의 효율적 운영<br />
								· 신성장사업 역량 강화
								</dt>
							</dl>
							<dl>
								<dt>비축 자산 및 역량 확용 확대<br />
								· 석유비축계획 적기 추진<br />
								· 동북아 오일허브 및 유통사업 추진<br />
								· 석유자산 활용 다각화
								</dt>
							</dl>
							<dl>
								<dt>경영 효율성 제고<br />
								· 통합경영체계 구축<br />
								· 재무관리 강화<br />
								· KNOC 3.0 추진(사회공헌, 동반성장 및 윤리경영)
								</dt>
							</dl>
						</li>
					</ul>

					<div>
						<br />
						<h5>저유가 위기극복 비상경영 추진</h5>
						<ul>
   						<li>사업비 조정, 운영원가 절감을 통한 비용 감축(Cost Reduction)</li>
   						<li>자본투자 통제 및 리스크 모니터링 강화(Cash Guarantee)</li>
   						<li>사업 및 인력 구조조정 실행(Creative Restructuring)</li>
   						</ul>
					</div>
					<!--표-->
					<!--
					<table class="chart1" summary="한국석유공사 전략목표를 확인할 수 있습니다.">
						<caption>한국석유공사 전략목표</caption>
						<colgroup>
						<col width="150px" />
						<col width="250px" />
						<col width="180px" />
						<col width="90px" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="first2">전략목표</th>
								<th scope="col">전략과제</th>
								<th scope="col">성과지표</th>
								<th scope="col">2009년 목표</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="first" rowspan="5">공급물량 확대를 위한 석유개발사업의 활성화</td>
								<td>생산량 증대를 위한 생산광구 운영의 효율화</td>
								<td>국내외 석유개발 생산량</td>
								<td class="tdcen">23,686천배럴</td>
							</tr>
							<tr>
								<td rowspan="2">해외유망광구 확보를 위한 노력</td>
								<td>망광구 신규참여</td>
								<td class="tdcen">7개</td>
							</tr>
							<tr>
								<td>해외개발사업 효율성</td>
								<td class="tdcen">720백만배럴</td>
							</tr>
							<tr>
								<td>효율적 탐사시추를 통한 신규매장량 확보</td>
								<td>탐사시추공수</td>
								<td class="tdcen">6개</td>
							</tr>
							<tr>
								<td>시추선 운영의 효율화</td>
								<td>시추선 조업일수</td>
								<td class="tdcen">270일</td>
							</tr>
							<tr>
								<td class="first" rowspan="3">지원 서비스를 통한 미래 성장동력 확보</td>
								<td>비축목표 달성을 위한 비축기지 건설</td>
								<td>비축기지 공정률(누계)</td>
								<td class="tdcen">96.3%<br/>(퍼센트)</td>
							</tr>
							<tr>
								<td rowspan="2">비축물량 확대를 통한 위기시 대응능력 제고</td>
								<td>비축유 구입</td>
								<td class="tdcen">1,000천배럴</td>
							</tr>
							<tr>
								<td>국제공동비축물량</td>
								<td class="tdcen">36,300천배럴</td>
							</tr>
							<tr>
								<td class="first" rowspan="3">비축수준제고를 위한 비축관련사업 추진역량강화</td>
								<td>비축목표 달성을 위한 비축기지 건설</td>
								<td>비축기지 공정률(누계)</td>
								<td class="tdcen">96.3%<br/>(퍼센트)</td>
							</tr>
							<tr>
								<td>R&amp;D 역량 강화</td>
								<td>석유개발 핵심기술 확보를 위한 R&amp;D 추진</td>
								<td class="tdcen">20개 과제</td>
							</tr>
							<tr>
								<td>석유정보 조사분석 및 서비스 강화</td>
								<td>조사분석정보 제공</td>
								<td class="tdcen">88건</td>
							</tr>
							<tr>
								<td class="first" rowspan="3">경영 체계 재정립을 통한 사업역량 강화</td>
								<td rowspan="3">경영효율화 추진</td>
								<td>비핵심사업 인력 감축, 재배치</td>
								<td class="tdcen">18명</td>
							</tr>
							<tr>
								<td>통합인사/평가시스템 구축·운영</td>
								<td class="tdcen">인사평가<br/>시스템 구축</td>
							</tr>
							<tr>
								<td>예산 절감률</td>
								<td class="tdcen">10%(퍼센트)<br/>절감</td>
							</tr>
						</tbody>
					</table>
					-->
					<!--//표-->
				</div>
				<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-04-21</td>
							<td class="contact_team"><strong>담당부서 : </strong>기획조정처 전략경영팀</td>
							<td class="contact_user"><strong>담당자 : </strong>노진평</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2247</td>
						</tr>
					</tbody>
				</table>
				</div>
				<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="BUSIPLAN" adminURL="" sessionName="USERSESSION"/>

				<div class="infoCheck"><div style="clear:both ; height:20px ;"></div><%@include file="/include/satisfy_link.jsp"%></div>
				<!--//끝-->
			</div>
		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>