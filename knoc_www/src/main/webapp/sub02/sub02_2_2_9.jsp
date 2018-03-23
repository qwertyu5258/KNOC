<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","09");
	application.setAttribute("gNavMenuDepth4","21");	
//	application.setAttribute("gNavMenuDepth3","02");
//	application.setAttribute("gNavMenuDepth4","10");
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
					&gt; <span>주요사업 및 경영성과</span>
                    &gt; <span class="locanow">사업별 투자계획</span>
				</div>
				<!--// location: end //-->

				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_3_new.gif" alt="주요사업 및 경영성과" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<h4><img src="/images/management/sub02_2_3_7_ta1.gif" alt="사업별 투자계획" border="0"/></h4>
					<p class="rtxt">(단위 : 백만원)</p>
					<!--표-->
					<table class="chart1" summary="사업비계획 목록입니다.">
					<caption>
					한국석유공사 사업비계획
					</caption>
					<col width="250px" />
					<col width="250px" />
					<thead>
						<tr>
							<th scope="col" class="first">구분</th>
							<th scope="col">2016년 투자비(자본예산)</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th  scope="row" class="first"><strong>합계</strong></th>
							<td class="tdcen"><strong>2,265,092</strong> </td>
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td class="first">○ 석유개발사업</td>
							<td class="tdcen">1,145,426</td>
						</tr>
						<tr>
							<td class="first tdcen">- 해외 개발/생산사업</td>
							<td class="tdcen">904,013</td>
						</tr>
						<tr>
							<td class="first">- 동해-1 가스전</td>
							<td class="tdcen">40,974</td>
						</tr>
						<tr>
							<td class="first tdcen">- 해외 탐사사업</td>
							<td class="tdcen">147,105</td>
						</tr>
						<tr>
							<td class="first tdcen">- 국내대륙붕 탐사사업</td>
							<td class="tdcen">5,818</td>
						</tr>
						<tr>
							<td class="first tdcen">- 국내개발</td>
							<td class="tdcen">47,516</td>
						</tr>
						<tr>
							<td class="first tdcen">○ 석유비축사업</td>
							<td class="tdcen">1,049,770</td>
						</tr>
						<tr>
							<td class="first tdcen">- 비축기지건설</td>
							<td class="tdcen">168,227</td>
						</tr>
						<tr>
							<td class="first tdcen">- 비축기지유지보수</td>
							<td class="tdcen">19,791</td>
						</tr>
						<tr>
							<td class="first tdcen">- 비축유구입</td>
							<td class="tdcen">90,091</td>
						</tr>
						<tr>
							<td class="first tdcen">- 상품 구입</td>
							<td class="tdcen">756,613</td>
						</tr>
						<tr>
							<td class="first tdcen">- 울산 오일허브 사업 등</td>
							<td class="tdcen">15,048</td>
						</tr>
						<tr>
							<td class="first">○ 기타사업</td>
							<td class="tdcen">69,896</td>
						</tr>
						<tr>
							<td class="first tdcen">- 시추선사업</td>
							<td class="tdcen">11,936</td>
						</tr>
						<tr>
							<td class="first tdleft">- 경영지원</td>
							<td class="tdcen">57,960</td>
						</tr>

					</tbody>
				</table>
					<!--//표-->
				</div>
				<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-03-31</td>
							<td class="contact_team"><strong>담당부서 : </strong>예산투자처 예산팀</td>
							<td class="contact_user"><strong>담당자 : </strong>문형석</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2307</td>
						</tr>
					</tbody>
				</table>
				</div>
				<!--div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div-->
				<!--//끝-->
			</div>
		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>