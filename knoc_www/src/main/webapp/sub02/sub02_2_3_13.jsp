<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","09");
	application.setAttribute("gNavMenuDepth4","26");
//	application.setAttribute("gNavMenuDepth3","03");
//	application.setAttribute("gNavMenuDepth4","13");	
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
				</a> &gt; <span>열린경영</span> &gt; <span>경영공시</span> &gt; <span>주요사업 및 경영성과</span> &gt; <span class="locanow">손익전망</span>
			</div>
			<!--// location: end //-->
			<!--[2009-09-21 수정] :: 작성자: 장정인 -->
			<div class="pagetle">
				<h3><img src="/images/management/ttl_sub02_2_3_new.gif" alt="주요사업 및 경영성과" /></h3>
			</div>
			<!--시작-->
			<div class="officer">
				<h4><img src="/images/management/sub02_2_2_11_ta1.gif" alt="손익전망"/></h4>
				<p class="rtxt">(단위 : 백만원)</p>
				<!--표-->
				<table class="chart3" summary="한국석유공사 손익전망을 2015년 실적과 2016년 계획별로 확인할 수 있습니다.">
					<caption>
					한국석유공사 손익전망
					</caption>
					<col width="154px" />
					<col width="110px" />
					<col width="110px" />
					<col width="110px" />
					<col width="136px" />
					<thead>
						<tr>
							<th scope="col" class="first">구분</th>
							<th scope="col">2015년 실적</th>
							<th scope="col">2016년 계획</th>
							<th scope="col">증감액</th>
							<th scope="col">증감률(%(퍼센트))</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" class="first">매출액</th>
							<td align="right">3,433,170</td>
							<td align="right">3,555,667</td>
							<td align="right">122,497</td>
							<td align="right">3.6</td>
						</tr>
						<tr>
							<th scope="row" class="first">매출원가</th>
							<td align="right">3,523,506</td>
							<td align="right">3,194,985</td>
							<td align="right">△328,521</td>
							<td align="right">△9.3</td>
						</tr>
						<tr>
							<th scope="row" class="first">판매비와관리비</th>
							<td align="right">354,777</td>
							<td align="right">339,601</td>
							<td align="right">△15,176</td>
							<td align="right">△4.3</td>
						</tr>
						<tr>
							<th scope="row" class="first">영업이익</th>
							<td align="right">△445,113</td>
							<td align="right">21,081</td>
							<td align="right">466,194</td>
							<td align="right">△104.7</td>
						</tr>
						<tr>
							<th scope="row" class="first">영업외수익</th>
							<td align="right">501,231</td>
							<td align="right">86,476</td>
							<td align="right">△414,755</td>
							<td align="right">△82.7</td>
						</tr>
						<tr>
							<th scope="row" class="first">영업외비용</th>
							<td align="right">5,528,061</td>
							<td align="right">837,048</td>
							<td align="right">△4,691,013</td>
							<td align="right">△84.9</td>
						</tr>
						<tr>
							<th scope="row" class="first">법인세비용 등</th>
							<td align="right">△971,677</td>
							<td align="right">107,239</td>
							<td align="right">864,438</td>
							<td align="right">△89.0</td>
						</tr>
						<tr>
							<th scope="row" class="first">당기순이익</th>
							<td align="right">△4,500,266</td>
							<td align="right">△622,252</td>
							<td align="right">3,878,014</td>
							<td align="right">△86.2</td>
						</tr>
					</tbody>
				</table>
				<!--//표-->
				<p style="text-align:right ; color:#777 ; font-size:11px ; letter-spacing:-1px ;"></p>
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
			<!--div class="infoCheck">
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
</body></html>