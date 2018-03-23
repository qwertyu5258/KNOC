<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String y_2016 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_10_5.jsp":"sub04_9_9_5.jsp");
	String y_2015 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_10_4.jsp":"sub04_9_9_4.jsp");
	String y_2014 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_10_2.jsp":"sub04_9_9.jsp");
	String y_2013 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_10_3.jsp":"sub04_9_9.jsp");
	String y_2012 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_10.jsp":"sub04_9_9_1.jsp");
	String y_2011 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_10_1.jsp":"sub04_9_9_2.jsp");
%>
	<div class="officer" style="padding-top:20px;">
	    <ul class="tab">
	    	<li><a href="<%=y_2016 %>" ><img src="/images/business/ab_sub02_2_6_12_5.gif" alt="2016년" /></a></li>
			<li><a href="<%=y_2015 %>" ><img src="/images/business/ab_sub02_2_6_12_4.gif" alt="2015년" /></a></li>
			<li><a href="<%=y_2014 %>" ><img src="/images/business/ab_sub02_2_6_12_3.gif" alt="2014년" /></a></li>
            <li><a href="<%=y_2013 %>" ><img src="/images/business/ab_sub02_2_6_12_2r.gif" alt="2013년" /></a></li>
			<li><a href="<%=y_2012 %>" ><img src="/images/business/ab_sub02_2_6_12.gif" alt="2012년" /></a></li>
		</ul>
	
		<h5 style="margin-top: 20px;">기관장 업무추진비 집행 내역</h5>
	
	    <p class="rtxt1">2013년</p>
		<p class="rtxt2">(단위 : 천원)</p>
	
		<!--표-->
		<table class="chart3" summary="한국석유공사 20013년기관장 업무추진비 집행 내역을 확인할 수 있습니다.">
			<caption>2013년 기관장 업무추진비 집행 내역</caption>
			<col width="100px" />
			<col />
			<col width="150px" />
			<thead>
				<tr>
				<th scope="col" class="first">집행월</th>
				<th scope="colgroup">집행 내역</th>
				<th scope="colgroup">집행 금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<td class="first">1월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>1,585</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
				<td class="first">2월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>2,473</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
				<td class="first">3월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>1,809</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
				<td class="first">4월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>2,269</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
				<td class="first">5월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>1,538</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
				<td class="first">6월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>1,116</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
				<td class="first">7월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>848</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
				<td class="first">8월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>800</td>
				</tr>
			</tbody>

			<tbody>
				<tr>
				<td class="first">9월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>835</td>
				</tr>
			</tbody>

			<tbody>
				<tr>
				<td class="first">10월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>1,964</td>
				</tr>
			</tbody>

			<tbody>
				<tr>
				<td class="first">11월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>1,150</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
				<td class="first">12월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>2,923</td>
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
					<td class="write_day"></td>
					<td class="contact_team"><strong>담당부서 : </strong>기획조정처 기획조정팀</td>
					<td class="contact_user"><strong>담당자 : </strong>황자영</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-2208</td>
				</tr>
			</tbody>
		</table>
	</div>
