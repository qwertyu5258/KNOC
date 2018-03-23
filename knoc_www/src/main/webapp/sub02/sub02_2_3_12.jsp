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
	application.setAttribute("gNavMenuDepth4","25");
//	application.setAttribute("gNavMenuDepth3","03");
//	application.setAttribute("gNavMenuDepth4","12");	
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
				<a href="/">
					<img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" />
				</a> &gt; <span>열린경영</span> &gt; <span>경영공시</span> &gt; <span>주요사업 및 경영성과</span> &gt; 	<span class="locanow">예산</span>
			</div>
			<!--// location: end //-->
			<!--[2009-09-21 수정] :: 작성자: 장정인 -->
			<div class="pagetle">
				<h3><img src="/images/management/ttl_sub02_2_3_new.gif" alt="주요사업 및 경영성과" /></h3>
			</div>
			<!--시작-->
			<div class="officer">
				<h4><img src="/images/management/sub02_2_2_10_ta1.gif" alt="예산" /></h4>
				<h5>손익예산(2016년)</h5>
				<p class="rtxt">(단위 : 백만원)</p>
				<table class="chart2" summary="한국석유공사 손익예산을 수익, 비용별로 확인할 수 있습니다.">
					<caption>
					한국석유공사 손익예산
					</caption>
					<thead>
						<tr>
							<th scope="col" class="first">수익 관</th>
							<th scope="col">수익 항</th>
							<th scope="col">수익 금액</th>
							<th scope="col">비용 관</th>
							<th scope="col">비용 항</th>
							<th scope="col">비용 금액</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th scope="row" colspan="2" class="first">합계</th>
							<th>3,642,143</th>
							<th colspan="2">합계</th>
							<th>4,264,395</th>
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td class="first">영업수익</td>
							<td></td>
							<td></td>
							<td>영업비용</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="first"></td>
							<td>매출액</td>
							<td>3,555,667</td>
							<td></td>
							<td>매출원가</td>
							<td>3,194,985</td>
						</tr>
						<tr>
							<td class="first">영업외수익</td>
							<td></td>
							<td></td>
							<td>일반관리비</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="first"></td>
							<td>영업외수익</td>
							<td>86,476</td>
							<td></td>
							<td>일반관리비</td>
							<td>155,625</td>
						</tr>
						<tr>
							<td class="first"></td>
							<td></td>
							<td></td>
							<td>해외광구비용</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="first"></td>
							<td></td>
							<td></td>
							<td></td>
							<td>해외광구비용</td>
							<td>183,976</td>
						</tr>
						<tr>
							<td class="first"></td>
							<td></td>
							<td></td>
							<td>영업외비용</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="first"></td>
							<td></td>
							<td></td>
							<td></td>
							<td>영업외비용</td>
							<td>837,048</td>
						</tr>
						<tr>
							<td class="first"></td>
							<td></td>
							<td></td>
							<td>법인세</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="first"></td>
							<td></td>
							<td></td>
							<td></td>
							<td>법인세</td>
							<td>107,239</td>
						</tr>
					</tbody>
				</table>
				<br />
				<h5>자본예산(2016년)</h5>
				<p class="rtxt">(단위 : 백만원)</p>
				<table class="chart2" summary="한국석유공사 자본예산을 확인할 수 있습니다.">
					<caption>
					한국석유공사 자본예산
					</caption>
					<thead>
						<tr>
							<th scope="col" class="first">관</th>
							<th scope="col">항</th>
							<th scope="col">금액</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th scope="row" colspan="2" class="first">합계</th>
							<th>2,265,092</th>
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td class="first">유동자산</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="first"></td>
							<td>재고자산</td>
							<td>764,804</td>
						</tr>
						<tr>
							<td class="first">비유동자산</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="first"></td>
							<td>유형자산</td>
							<td>233,116</td>
						</tr>
						<tr>
							<td class="first"></td>
							<td>석유 및 가스개발자산</td>
							<td>925,562</td>
						</tr>
						<tr>
							<td class="first"></td>
							<td>무형자산</td>
							<td>4,890</td>
						</tr>
						<tr>
							<td class="first"></td>
							<td>관계기업투자 및 조인트벤처 투자지분</td>
							<td>15,048</td>
						</tr>
						<tr>
							<td class="first"></td>
							<td>장기성 매출채권 및 수취채권</td>
							<td>207,844</td>
						</tr>
						<tr>
							<td class="first"></td>
							<td>비유동성금융자산</td>
							<td>12,813</td>
						</tr>
						<tr>
							<td class="first"></td>
							<td>기타비 유동자산</td>
							<td>10,924</td>
						</tr>
						<tr>
							<td class="first"></td>
							<td>비축유</td>
							<td>90,091</td>
						</tr>
					</tbody>
				</table>
				<br />
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
			<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="ESTIMATE" adminURL="" sessionName="USERSESSION"/>
			<!--div class="infoCheck">
				<div style="clear:both ; height:20px ;">
				</div>
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
</body>
</html>