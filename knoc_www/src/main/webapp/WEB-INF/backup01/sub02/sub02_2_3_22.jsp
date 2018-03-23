<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","11");
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
					&gt; <span>재무현황</span>
                    &gt; <span class="locanow">주요사업별 수익</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_3.gif" alt="재무현황" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<h4><img src="/images/management/sub02_2_3_1_ta1.gif" alt="주요사업 수익" border="0"/></h4>
					<!-- ul class="tab" style="margin:20px 0;">
						<li><a href="sub02_2_3_21.jsp"><img src="/images/business/ab_sub02_2_6_21r.gif" alt="2013년"></a></li>
                        <li><a href="sub02_2_3_11.jsp"><img src="/images/business/ab_sub02_2_6_12.gif" alt="2012년"></a></li>
						<li><a href="sub02_2_3_16.jsp"><img src="/images/business/ab_sub02_2_3_16.gif" alt="2011년"></a></li>
						<li><a href="sub02_2_3_17.jsp"><img src="/images/business/ab_sub02_2_3_17.gif" alt="2010년"></a></li>
						<li><a href="sub02_2_3_18.jsp"><img src="/images/business/ab_sub02_2_3_18.gif" alt="2009년"></a></li>
						<li><a href="sub02_2_3_19.jsp"><img src="/images/business/ab_sub02_2_3_19.gif" alt="2008년"></a></li>
						<li><a href="sub02_2_3_20.jsp"><img src="/images/business/ab_sub02_2_3_20.gif" alt="2007년"></a></li>
					</ul -->
					<p class="rtxt">(단위 : 백만원)</p>
					<!--표-->
					<table class="chart3" summary="2010년부터 2015년도까지 한국석유공사 주요사업별 수익을 확인할 수 있습니다.">
					<caption>한국석유공사 주요사업별 수익</caption>
					<colgroup>
					<col width="16%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					<col width="14%" />
					</colgroup>
					<thead>
					<tr>
						<th rowspan="2" class="first" scope="col">구분</th>
						<th scope="col">K-GAAP 기준</th>
						<th colspan="3" scope="col">IFRS 별도 재무제표 기준</th>
						<th colspan="2" scope="col">IFRS연결 재무제표 기준</th>
					  </tr>
					<tr>
					  <th scope="col">2010</th>
					  <th scope="col">2011</th>
					  <th scope="col">2012</th>
					  <th scope="col">2013</th>
					  <th scope="col">2014</th>
					  <th scope="col">2015</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<th scope="row" class="first">유전개발사업</th>
						<td>1,404,623</td>
						<td>806,207</td>
						<td>745,602</td>
						<td>657,384</td>
						<td>3,826,970</td>
						<td>2,519,713</td>
					</tr>
					<tr>
						<th scope="row" class="first">석유비축사업</th>
						<td>815,923</td>
						<td>408,340</td>
						<td>192,503</td>
						<td>372,810</td>
						<td>370,227</td>
						<td><p>785,538</p>
					    </td>
					</tr>
					<tr>
						<th scope="row" class="first">기타사업</th>
						<td>311,495</td>
						<td>60,358</td>
						<td>24,460</td>
						<td>96,476</td>
						<td>156,156</td>
						<td>122,221</td>
					</tr>
					<tr>
						<th scope="row" class="first">정부보조 및<br />위탁사업</th>
						<td>1,623</td>
						<td>1,962</td>
						<td>2,142</td>
						<td>7,467</td>
						<td>4,764</td>
						<td>5,699</td>
					</tr>
					<tr>
						<th scope="row" class="first">총계</th>
						<td>2,533,664</td>
						<td>1,276,867</td>
						<td>964,707</td>
						<td>1,134,137</td>
						<td>4,358,117</td>
						<td>3,433,171</td>
					</tr>
                    <tr>
						<th scope="row" class="first">영업외수익부분</th>
						<td>681,257</td>
					  <td>95,858</td>
					  <td>631,574</td>
					  <td>383,593</td>
					  <td>721,846</td>
					  <td>499,043</td>
					</tr>
					</tbody>
					</table>

					<!--//표-->
					<p style="text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">* 연도말 결산기준<br  />* '10년은 K-GAAP기준, '11~'13년은 IFRS 별도재무제표 기준, '14~'15년은 IFRS 연결 재무제표 기준</p>
				</div>
				<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2015-12-31</td>
							<td class="contact_team"><strong>담당부서 : </strong>재무처 회계팀</td>
							<td class="contact_user"><strong>담당자 : </strong>이가희</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2459</td>
						</tr>
					</tbody>
				</table>
				</div>					
				<div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div>					
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>