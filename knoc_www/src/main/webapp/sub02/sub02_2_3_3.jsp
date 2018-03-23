<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","09");
	application.setAttribute("gNavMenuDepth4","22");	
//	application.setAttribute("gNavMenuDepth3","03");
//	application.setAttribute("gNavMenuDepth4","03");
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
                    &gt; <span class="locanow">신용등급 및 신뢰도</span>
				</div>
				<!--// location: end //-->

				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_3_new.gif" alt="주요사업 및 경영성과" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<h4><img src="/images/management/sub02_2_2_7_ta1.gif" alt="신용등급 및 신뢰도" border="0"/></h4>
					<!--표-->
					<table class="chart2" summary="한국석유공사 신용등급 및 신뢰도를 평가기관, 신용등급, 현등급 부여일별로 확인할 수 있습니다.">
					<caption>신용등급 및 신뢰도</caption>
					<col width="90px" />
					<col width="130px" />
					<col width="120px" />
					<col width="350px" />
					<thead>
					<tr>
					<th scope="col" class="first">평가기관</th>
					<th  scope="col">신용등급</th>
					<th  scope="col">현등급 부여일</th>
					<th scope="col" class="alice">비고</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td class="first">S&amp;P</td>
						<td>AA /Stable</td>
						<td>2016-08-08</td>
						<td rowspan="3" style="text-align:left ; padding-left:5px ;">투자적격등급<br/>- 원리금상환능력 강함</td>
					</tr>
					<tr>
						<td class="first">Moody's</td>
						<td>Aa2 / Stable</td>
						<td>2016-02-16</td>
					</tr>
    				<tr>
						<td class="first">Fitch</td>
						<td>AA-/Stable</td>
						<td>2016-03-24</td>
    				</tr>
					</tbody>
					</table>
					<!--//표-->
					<p>(참고) 각 신용평가기관별 신용등급표 및 신뢰도</p>
					<!--표-->

					<p class="ctxt" style="margin-top:30px;"><strong>국제신용평가사의 신용등급표</strong></p>
					<table class="chart2" summary="S&amp;P와 Moody's의 신용등급표를 확인할 수 있습니다.">
					<caption>S&amp;P와 Moody's의 신용등급표</caption>
					<col width="90px" />
					<col width="130px" />
					<col width="120px" />
					<col width="120px" />
					<col width="230px" />
					<thead>
					<tr>
					<th scope="col" class="first">구분</th>
					<th scope="col">S&amp;P</th>
					<th scope="col">Moody's</th>
					<th scope="col">Fitch</th>
					<th scope="col">등급수준</th>
    				</tr>
					</thead>
					<tbody>
					<tr>
					<td rowspan="4" class="first">투자적격</td>
					<td>AAA</td>
					<td>Aaa</td>
					<td>AAA</td>
					<td class="tdleft">최상위</td>
    				</tr>
					<tr>
					<td>AA+, AA, AA-</td>
					<td>Aa1, Aa2, Aa3</td>
					<td>AA+, AA, AA-</td>
					<td class="tdleft">원리금 상환능력 강함</td>
    				</tr>
					<tr>
					<td>A+, A, A-</td>
					<td>A1, A2, A3</td>
					<td>A+, A, A-</td>
					<td class="tdleft">원리금 상환능력 충분 경제적 여건변화에 영향받음</td>
    				</tr>
					<tr>
					<td>BBB+, BBB, BBB-</td>
					<td>Baa1, Baa2, Baa3</td>
					<td>BBB+, BBB, BBB-</td>
					<td class="tdleft">원리금 상환능력 적정 경제여건에의해 부적격 신용하락 가능</td>
					</tr>
					</tbody>
					</table>
					<!--//표-->
					<p class="ctxt" style="margin-top:30px;"><strong>신뢰도(은행거래상황)</strong></p>
					<!--표-->
					<table class="chart1" summary="한국석유공사 신뢰도를 은행거래상황으로 확인할 수 있습니다.">
					<caption>신뢰도(은행거래상황)</caption>
					<col width="90px" />
					<col width="600px" />
					<thead>
					<tr>
					 <th scope="col" class="first">구분</th>
					<th scope="col">내용</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">은행거래상황</td>
					<td>부도발생 여부 : 없음<br/>불량거래 규제여부 : 없음<br/>최근 1년 이내 연체 및 대지급 여부 : 없음</td>
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
							<td class="write_day"><strong>작성기준일 : </strong>2016-10-31 </td>
							<td class="contact_team"><strong>담당부서 : </strong>재무처 자금팀</td>
							<td class="contact_user"><strong>담당자 : </strong>조명지</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2426</td>
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