<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String y_2016 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_12_5.jsp":"sub04_9_10_5.jsp");
	String y_2015 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_12_4.jsp":"sub04_9_10_4.jsp");
	String y_2014 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_12_2.jsp":"sub04_9_10.jsp");
	String y_2013 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_12_3.jsp":"sub04_9_10_3.jsp");
	String y_2012 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_12.jsp":"sub04_9_10_1.jsp");
	String y_2011 = (request.getServletPath().toString().indexOf("/sub02/") > -1 ?"sub02_2_6_12_1.jsp":"sub04_9_10_2.jsp");
%>

<div class="officer" style="padding-top:20px;">
	<ul class="tab">
		<li><a href="<%=y_2016 %>" ><img src="/images/business/ab_sub02_2_6_12_5r.gif" alt="2016년" /></a></li>
		<li><a href="<%=y_2015 %>" ><img src="/images/business/ab_sub02_2_6_12_4.gif" alt="2015년" /></a></li>
		<li><a href="<%=y_2014 %>" ><img src="/images/business/ab_sub02_2_6_12_3.gif" alt="2014년" /></a></li>
		<li><a href="<%=y_2013 %>" ><img src="/images/business/ab_sub02_2_6_12_2.gif" alt="2013년" /></a></li>
		<li><a href="<%=y_2012 %>" ><img src="/images/business/ab_sub02_2_6_12.gif" alt="2012년" /></a></li>		
	</ul>

	<h5>상임감사위원 업무추진비 집행 내역</h5>
	<p class="rtxt1">2016년</p>
	<p class="rtxt2">(단위 : 천원)</p>
	<table class="chart3" summary="한국석유공사 2016년 상임감사위원 업무추진비 집행 내역을 확인할 수 있습니다.">
		<caption>
		2016년 상임감사위원 업무추진비 집행 내역
		</caption>
		<col width="100px" />
		<col width="*" />
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
				<td>1,255</td>
			</tr>
			<tr>
				<td class="first">2월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>550</td>
			</tr>
			<tr>
				<td class="first">3월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>675</td>
			</tr>
			<tr>
				<td class="first">4월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>400</td>
			</tr>
			<tr>
				<td class="first">5월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>910</td>
			</tr>
			<tr>
				<td class="first">6월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>527</td>
			</tr>
			<tr>
				<td class="first">7월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>570</td>
			</tr>
			
			<tr>
				<td class="first">8월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>913</td>
			</tr>
			<tr>
				<td class="first">9월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>419</td>
			</tr>
			<tr>
				<td class="first">10월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>276</td>
			</tr>
			<tr>
				<td class="first">11월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>263</td>
			</tr>
			<tr>
				<td class="first">12월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>436</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">합계</td>
				<td>7,194</td>
			</tr>
		</tbody>
	</table>
	
	<br />
	
	<!-- h5>부사장 업무추진비 집행 내역</h5>
	<p class="rtxt1">2016년</p>
	<p class="rtxt2">(단위 : 천원)</p>
	<table class="chart3" summary="한국석유공사 2016년 부사장 업무추진비 집행 내역을 확인할 수 있습니다.">
		<caption>
		2016년 부사장 업무추진비 집행 내역
		</caption>
		<col width="100px" />
		<col width="*" />
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
				<td>646</td>
			</tr>
			<tr>
				<td class="first">2월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>460</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">합계</td>
				<td>1,106</td>
			</tr>
		</tbody>
	</table>
	
	<br /-->
	
	<!-- h5>전략기획본부장 업무추진비 집행 내역</h5>
	<p class="rtxt1">2016년</p>
	<p class="rtxt2">(단위 : 천원)</p>
	<table class="chart3" summary="한국석유공사 2016년 전략기획본부장 업무추진비 집행 내역을 확인할 수 있습니다.">
		<caption>
		2016년 전략기획본부장 업무추진비 집행 내역
		</caption>
		<col width="100px" />
		<col width="*" />
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
				<td>200</td>
			</tr>
			<tr>
				<td class="first">2월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>90</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">합계</td>
				<td>290</td>
			</tr>
		</tbody>
	</table>
	
	<br /-->

	<h5>경영관리본부장 업무추진비 집행 내역</h5>
	<p class="rtxt1">2016년</p>
	<p class="rtxt2">(단위 : 천원)</p>

	
	<table class="chart3" summary="한국석유공사 2016년 경영관리본부장 업무추진비 집행 내역을 확인할 수 있습니다.">
		<caption>
		2016년 경영관리본부장 업무추진비 집행 내역
		</caption>
		<col width="100px" />
		<col width="*" />
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
				<td>276</td>

			</tr>
			<tr>
				<td class="first">2월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>110</td>
			</tr>
			<tr>
				<td class="first">3월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>69</td>
			</tr>
			<tr>
				<td class="first">4월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="first">5월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>282</td>
			</tr>
			<tr>
				<td class="first">6월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>337</td>
			</tr>
			<tr>
				<td class="first">7월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>196</td>
			</tr>
			
			<tr>
				<td class="first">8월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>348</td>
			</tr>
			<tr>
				<td class="first">9월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>286</td>
			</tr>
			<tr>
				<td class="first">10월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="first">11월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>80</td>
			</tr>
			<tr>
				<td class="first">12월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>278</td>
			</tr>
			<tr class="tdgray">  
				<td colspan="2" class="first">합계</td>
				<td>2,262</td>    
			</tr>   
		</tbody>
	</table>   
	
	<br />    
	
	<h5>비축사업본부장 업무추진비 집행 내역</h5>
	<p class="rtxt1">2016년</p>
	<p class="rtxt2">(단위 : 천원)</p>
	
	<table class="chart3" summary="한국석유공사 2016년 비축사업본부장 업무추진비 집행 내역을 확인할 수 있습니다.">
		<caption>
		2016년 비축사업본부장 업무추진비 집행 내역
		</caption>
		<col width="100px" />
		<col width="*" />
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
				<td>80</td>
			</tr>
			<tr>
				<td class="first">2월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>215</td>
			</tr>
			<tr>
				<td class="first">3월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>187</td>
			</tr>
			<tr>
				<td class="first">4월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>469</td>
			</tr>
			<tr>
				<td class="first">5월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>658</td>
			</tr>
			<tr>
				<td class="first">6월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="first">7월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>378</td>
			</tr>
			
			<tr>
				<td class="first">8월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>236</td>
			</tr>
			<tr>
				<td class="first">9월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>494</td>
			</tr>
			<tr>
				<td class="first">10월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="first">11월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>93</td>
			</tr>
			<tr>
				<td class="first">12월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>0</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">합계</td>
				<td>2,810</td>
			</tr>
		</tbody>
	</table>
	
	<br />

	<!-- h5>생산본부장 업무추진비 집행 내역</h5>
	<p class="rtxt1">2016년</p>
	<p class="rtxt2">(단위 : 천원)</p>
	<table class="chart3" summary="한국석유공사 2016년 생산본부장 업무추진비 집행 내역을 확인할 수 있습니다.">
		<caption>
		2016년 생산본부장 업무추진비 집행 내역
		</caption>
		<col width="100px" />
		<col width="*" />
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
				<td>761</td>
			</tr>
			<tr>
				<td class="first">2월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>420</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">합계</td>
				<td>1,181</td>
			</tr>
		</tbody>
	</table>
	
	<br /-->

	<!-- h5>탐사본부장 업무추진비 집행 내역</h5>
	<p class="rtxt1">2016년</p>
	<p class="rtxt2">(단위 : 천원)</p>
	<table class="chart3" summary="한국석유공사 2016년 탐사본부장 업무추진비 집행 내역을 확인할 수 있습니다.">
		<caption>
		2016년 탐사본부장 업무추진비 집행 내역
		</caption>
		<col width="100px" />
		<col width="*" />
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
				<td>103</td>
			</tr>
			<tr>
				<td class="first">2월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>250</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">합계</td>
				<td>353</td>
			</tr>
		</tbody>
	</table-->	
	
	<h5>기획예산본부장 업무추진비 집행 내역</h5>
	<p class="rtxt1">2016년</p>
	<p class="rtxt2">(단위 : 천원)</p>
	
	<table class="chart3" summary="한국석유공사 2016년 비축사업본부장 업무추진비 집행 내역을 확인할 수 있습니다.">
		<caption>
		2016년 기획예산본부장 업무추진비 집행 내역
		</caption>
		<col width="100px" />
		<col width="*" />
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
				<td class="first">4월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>103</td>
			</tr>
			<tr>
				<td class="first">5월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>82</td>
			</tr>
			<tr>
				<td class="first">6월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>84</td>
			</tr>
			<tr>
				<td class="first">7월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>276</td>
			</tr>
			
			<tr>
				<td class="first">8월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>166</td>
			</tr>
			<tr>
				<td class="first">9월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>88</td>
			</tr>
			<tr>
				<td class="first">10월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>105</td>
			</tr>
			<tr>
				<td class="first">11월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>0</td>
			</tr>
			<tr>
				<td class="first">12월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>269</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">합계</td>
				<td>1,173</td>
			</tr>
		</tbody>
	</table>
	
	<br />
	
	<h5>E&amp;P사업본부장 업무추진비 집행 내역</h5>
	<p class="rtxt1">2016년</p>
	<p class="rtxt2">(단위 : 천원)</p>
	
	<table class="chart3" summary="한국석유공사 2016년 비축사업본부장 업무추진비 집행 내역을 확인할 수 있습니다.">
		<caption>
		2016년 비축사업본부장 업무추진비 집행 내역
		</caption>
		<col width="100px" />
		<col width="*" />
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
				<td class="first">4월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>848</td>
			</tr>
			<tr>
				<td class="first">5월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>284</td>
			</tr>
			<tr>
				<td class="first">6월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>267</td>
			</tr>
			<tr>
				<td class="first">7월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>888</td>
			</tr>
			
			<tr>
				<td class="first">8월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>256</td>
			</tr>
			<tr>
				<td class="first">9월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>175</td>
			</tr>
			<tr>
				<td class="first">10월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>183</td>
			</tr>
			<tr>
				<td class="first">11월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>306</td>
			</tr>
			<tr>
				<td class="first">12월</td>
				<td class="c3_center">업무추진관련 업무협의, 회의, 간담회, 직원격려</td>
				<td>278</td>
			</tr>
			<tr class="tdgray">
				<td colspan="2" class="first">합계</td>
				<td>3,485</td>
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
				<td class="write_day"><strong>작성기준일 : </strong>2016-12-31</td>
				<td class="contact_team"><strong>담당부서 : </strong>기획조정처 기획관리팀</td>
				<td class="contact_user"><strong>담당자 : </strong>황자영</td>
				<td class="contact_tel"><strong>연락처 : </strong>052-216-2208</td>
			</tr>
		</tbody>
	</table>
</div>
