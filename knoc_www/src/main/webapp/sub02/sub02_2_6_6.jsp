<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","13");
	application.setAttribute("gNavMenuDepth4","03");
//	application.setAttribute("gNavMenuDepth3","06");
//	application.setAttribute("gNavMenuDepth4","06");	
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
					&gt; <span>기타정보</span>
                    &gt; <span class="locanow">전자조달규모</span>
				</div>
				<!--// location: end //-->

				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_6.gif" alt="기타정보" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<h4><img src="/images/management/sub02_2_6_6_ta.gif" alt="전자조달규모" /></h4>
					<p class="offtxt2">2015년 전자조달 규모(계약체결 완료 기준)</p>
					<p style="text-align: right;">(단위 : 건, 백만원)</p>
					<!--표-->
					<table class="chart3" summary="한국석유공사 전자조달규모를 확인할 수 있습니다.">
					<caption>한국석유공사 연도별 전자조달규모</caption>
					<colgroup>
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
						<col width="" />
					</colgroup>
					<thead>
					<tr>
						<th scope="col" class="first">구분</th>
						<th scope="col">1분기</th>
						<th scope="col">2분기</th>
						<th scope="col">3분기</th>
						<th scope="col">4분기</th>
						<th scope="col">연간</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<th scope="row" class="first">건수</th>
						<td>72</td>
						<td>100</td>
						<td>79</td>
						<td>128</td>
						<td>379</td>
					</tr>
					<tr>
						<th scope="row" class="first">금액</th>
						<td>19,599</td>
						<td>7,123</td>
						<td>47,867</td>
						<td>227,015</td>
						<td>301,605</td>
					</tr>
					</tbody>
					</table>

					<div class="" style="text-align:left ; padding-left:40px ; text-indent:-15px ;">
						* 2014년 말 신사옥 건립공사가 준공됨에 따라 지급자재에 대한 계약 건이 크게 감소하여
						<br />
						2015년의 전자조달 건수는 2014년 대비 감소하였으나('14년 497건 → '15년 379건),
						<br />
						울산 Buoy 이설공사, 여수 추가 지상탱크 건설공사 등 대형 공사계약 건의 영향으로 전년도에 비하여 금액 측면에서 큰 증가세를 보임 ('14년 1,556억원 → '15년 3,016억원)
					</div>

					<!--//표-->
					<div class="ctxt"><img src="/images/management/sub02_2_6_6_img1.gif" width="90%" alt="연도별 조달건수(건) 현황 그래프"/>
						<ul class="blindtext">
						<li>2002년 :14건</li>
						<li>2003년 :48건</li>
						<li>2004년 :49건</li>
						<li>2005년 :61건</li>
						<li>2006년 :87건</li>
						<li>2007년 :127건</li>
						<li>2008년 :269건</li>
						<li>2009년 :284건</li>
						<li>2010년 :396건</li>
						<li>2011년 :532건</li>
						<li>2012년 :502건</li>
						<li>2013년 :501건</li>
						<li>2014년 :497건</li>
						<li>2015년 :379건</li>
						</ul>
					</div>
					<div class="ctxt"><img src="/images/management/sub02_2_6_6_img2.gif" width="90%" alt="연도별 조달금액(백만원) 현황 그래프"/>
						<ul class="blindtext">
						<li>2002년 :7,372백만원</li>
						<li>2003년 :10,401백만원</li>
						<li>2004년 :6,658백만원</li>
						<li>2005년 :7,971백만원</li>
						<li>2006년 :24,581백만원</li>
						<li>2007년 :31,619백만원</li>
						<li>2008년 :118.588백만원</li>
						<li>2009년 :177,490백만원</li>
						<li>2010년 :104,531백만원</li>
						<li>2011년 :94,282백만원</li>
						<li>2012년 :115,421백만원</li>
						<li>2013년 :162,789백만원</li>
						<li>2014년 :155,653백만원</li>
						<li>2015년 :301,605백만원</li>
						</ul>
					</div>

				</div>
				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
						<tbody>
							<tr>
								<td class="write_day"><strong>작성기준일 : </strong>2016-01-01</td>
								<td class="contact_team"><strong>담당부서 : </strong>총무관리처 국내조달팀</td>
								<td class="contact_user"><strong>담당자 : </strong>정봉준</td>
								<td class="contact_tel"><strong>연락처 : </strong>052-216-2648</td>
							</tr>
						</tbody>
					</table>
				</div>
				<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="ELECTJO" adminURL="" sessionName="USERSESSION"/>


				<!--div class="infoCheck"><div style="clear:both ; height:20px ;"></div><%@include file="/include/satisfy_link.jsp"%></div-->
				<!--//끝-->
			</div>
		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>