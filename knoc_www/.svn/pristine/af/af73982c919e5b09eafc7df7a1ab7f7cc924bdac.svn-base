<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","15");
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
                    &gt; <span class="locanow">납세정보현황</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_3.gif" alt="재무현황" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<h4><img src="/images/management/sub02_2_3_15_ta.gif" alt="납세정보현황-법인세" /></h4>
					<p class="rtxt">(단위 : 천원)</p>
				<!--표-->
					<table summary="납세정보현황을 확인할 수 있습니다." class="chart2">
					<caption>납세정보현황</caption>
					<colgroup><col width="100">
					<col width="*">
					<col width="100">
					<col width="100">
					<col width="100">
					<col width="100">
					</colgroup><thead>
					<tr>
					<th class="first" scope="col">구분</th>
					<th scope="col">과세표준</th>
					<th scope="col">법인세산출세액</th>
					<th scope="col">세액공제</th>
					<th scope="col">가산세</th>
					<th scope="col">결정세액</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td class="first">2015년</td>
						<td>171,504,719</td>
						<td>37,311,038</td>
						<td>37,311,038</td>
						<td>-</td>
						<td>-</td>
					</tr>
					<tr>
						<td class="first">2014년</td>
						<td>442,485,154</td>
						<td>96,926,734</td>
						<td>26,949,362</td>
						<td>-</td>
						<td>69,977,372</td>
					</tr>
					<tr>
						<td class="first">2013년</td>
						<td>482,542,737</td>
						<td>105,739,402</td>
						<td>92,885,477</td>
						<td>-</td>
						<td>12,853,925</td>
					</tr>
					<tr>
						<td class="first">2012년</td>
						<td>332,092,056</td>
						<td>72,640,252</td>
						<td>60,595,916</td>
						<td>-</td>
						<td>12,044,336</td>
					</tr>
					<tr>
						<td class="first">2011년</td>
						<td>538,267,844</td>
						<td>118,394,925</td>
						<td>118,101,167</td>
						<td>48,734</td>
						<td>342,492</td>
					</tr>
					<tr>
						<td class="first">2010년</td>
						<td>696,475,240</td>
						<td>153,200,552</td>
						<td>150,345,296</td>
						<td>712,671</td>
						<td>3,567,927</td>
					</tr>
					</tbody>
					</table>
					</div>
				<!-- 	<p style="clear:both ;text-align:left ; padding:10px 0 0 40px; font-size:11px ; letter-spacing:-1px ; color:#777 ;">
					 </p> -->

				
				</div>	
				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-03-31</td>
							<td class="contact_team"><strong>담당부서 : </strong>재무처 세무팀</td>
							<td class="contact_user"><strong>담당자 : </strong>권미진</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2466</td>
						</tr>
					</tbody>
					</table>
				</div><!-- new_officer end -->	
				<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="SUBMITTX" adminURL="" sessionName="USERSESSION"/>
				
				<div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div>				
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>