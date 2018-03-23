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
					<ul class="tab" style="margin:20px 0;">
                    <li><a href="sub02_2_3_22.jsp"><img src="/images/business/ab_sub02_2_6_21.gif" alt="2013년"></a></li>
					<li><a href="sub02_2_3_11.jsp"><img src="/images/business/ab_sub02_2_6_12.gif" alt="2012년"></a></li>
					<li><a href="sub02_2_3_16.jsp"><img src="/images/business/ab_sub02_2_3_16r.gif" alt="2011년"></a></li>
					<li><a href="sub02_2_3_17.jsp"><img src="/images/business/ab_sub02_2_3_17.gif" alt="2010년"></a></li>
					<li><a href="sub02_2_3_18.jsp"><img src="/images/business/ab_sub02_2_3_18.gif" alt="2009년"></a></li>
					<li><a href="sub02_2_3_19.jsp"><img src="/images/business/ab_sub02_2_3_19.gif" alt="2008년"></a></li>
					<li><a href="sub02_2_3_20.jsp"><img src="/images/business/ab_sub02_2_3_20.gif" alt="2007년"></a></li>
					</ul>
					<p class="rtxt">(단위 : 백만원)</p>
					<!--표-->
					<table class="chart3" summary="2011년한국석유공사 주요사업별 수익을 확인할 수 있습니다.">
					<caption>한국석유공사 주요사업별 수익</caption>
					<col width="90px" />
					<col width="90px" />
					<thead>
					<tr>
					<th scope="col" class="first">구분</th>
					<th scope="col">2011년 결산</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<th scope="row" class="first">석유개발 사업수익</th>
						<td>789,562</td>
					</tr>
					<tr>
						<th scope="row" class="first">석유비축 사업수익</th>
						<td>408,340</td>
					</tr>
					<tr>
						<th scope="row" class="first">금융 사업수익</th>
						<td>4,059</td>
					</tr>
					<tr>
						<th scope="row" class="first">기타 사업수익</th>
						<td>74,906</td>
					</tr>
					<tr>
						<th scope="row" class="first">영업외수익</th>
						<td>626,984</td>
					</tr>
					</tbody>
					</table>
					<!--//표-->
					<p style="text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">
					- 2011년은 K-IFRS 별도재무제표 기준
					</p>
					
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
							<td><strong>담당부서 : </strong>재무처 회계팀</td>
							<td><strong>연락처 : </strong>052-216-2448</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
					</table>
				</div><!-- new_officer end -->						
				<div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div>					
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>