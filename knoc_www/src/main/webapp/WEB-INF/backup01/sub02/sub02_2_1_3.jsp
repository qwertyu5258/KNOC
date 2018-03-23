<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","03");
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
					&gt; <span>일반현황</span>
					&gt; <span class="locanow">자본금 및 주주현황</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_1.gif" alt="일반현황" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<h4><img src="/images/management/sub02_2_2_3_ta1.gif" alt="자본금 및 주주현황"/></h4>
					<p class="offtxt">재산상태 (2015년 12월말) : 부채(19조 96억원) 자본(4조 1,956억원)</p>
					<div class="ctxt"><img src="/images/management/img_sub02_2_2_3_20100315.gif" alt="(자산 23조 2,052억원=자본 4조 1,956억원+부채 19조 96억원)"/>
					</div>
					<p class="offtxt">2015년 12월말  자본금 및 주주현황 (금액단위 : 백만원)</p>
					<!--표-->
					<table class="chart2" summary="자본금 및 주주현황을 법정자본금, 납입자본금, 주주별로 확인할 수 있습니다.">
					<caption>
					2015년 12월말 자본금 및 주주현황
					</caption>
					<col width="233px" />
					<col width="233px" />
					<col width="233px" />
					<thead>
					<tr>
					<th scope="col" class="first">법정자본금</th>
					<th scope="col">납입자본금</th>
					<th scope="col">지분율(퍼센트)</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first"><strong>13,000,000</strong></td>
					<td>10,207,846</td>
					<td>100.00%</td>
					</tr>
					</tbody>
					</table>
					<!--//표-->
					<p style="clear:both ;text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">
						공시기준 : ’15년 12월말 기준<br/>
						- 법정자본금 : ‘수권주식수×액면가액’에 해당하는 금액 <br/>
						- 납입자본금 : ‘발생주식수×액면가액’에 해당하는 금액 <br/>
						* 법정자본금 ≥ 납입자본금 </p>
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
				
				<div class="infoCheck"> <%@include file="/include/satisfy_link.jsp"%></div>
				
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>