<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","06");
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
					&gt; <span>기타정보</span>
                    &gt; <span class="locanow">소송정보</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/information/ttl_sub04_9_12.gif" alt="소송정보" /></h3>
				</div>
				 <div class="officer" style="padding-top:20px;">
					<ul class="tab">
			            <li><a href="sub02_2_6_15.jsp" ><img src="/images/business/ab_sub02_2_6_15_14.gif" alt="2014년" /></a></li>
			            <li><a href="sub02_2_6_15_1.jsp" ><img src="/images/business/ab_sub02_2_6_12_2r.gif" alt="2013년" /></a></li>
						<li><a href="sub02_2_6_15_2.jsp" ><img src="/images/business/ab_sub02_2_6_12.gif" alt="2012년" /></a></li>
					</ul>				
				<h5 style="margin-bottom:10px; margin-top:20px;">2013년 확정판결 내역 및 소송대리인</h5>
				<table  class="chart2" summary="2013년 확정판결 내역 및 소송대리인">

					<caption>2013년 확정판결 내역 및 소송대리인</caption>
					<col width="150px" />
					<col width="300px" />
					<col width="70px" />
					<thead>
						<tr>
							<th scope="col" class="first">사건명</th>
							<th scope="col">소송대리인</th>
							<th scope="col">확정일</th>
						</tr>
					</thead>
					<tbody>
					<tr>
                      <th class="first" scope="row">거제 공유수면 점용료 <br />부과 처분 취소소송</th>
					  <td style="text-align:center;">법무법인 한결</td>
					  <td>2013.08.29</td>
					</tr>
					<tr>
                      <th class="first" scope="row">울산 토지인도 청구소송</th>
					  <td style="text-align:center;">채시호 법률사무소</td>
					  <td>2013.11.14</td>
					</tr>
					</tbody>
				</table>			
				
						
				<h5 style="margin-bottom:10px; margin-top:30px;">2013년 확정판결 소송대리인별 사건수임건수</h5>
				<table  class="chart2" summary="2012년 확정판결 소송대리인별 사건수임건수">

					<caption>2013년 확정판결 소송대리인별 사건수임건수</caption>
					<col width="150px" />
					<col width="370px" />
					<thead>
						<tr>
							<th scope="col" class="first">소송대리인</th>
							<th scope="col">사건수임건수</th>
						</tr>
					</thead>
					<tbody>
					<tr>
                      <th class="first" scope="row">법무법인 하나로</th>
					  <td class="tdleft" style="text-align:center;">1</td>
					</tr>
					<tr>
                      <th class="first" scope="row">채시호 법률사무소</th>
					  <td class="tdleft" style="text-align:center;">1</td>
					</tr>
					</tbody>
				</table>	
				
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
						<td><strong>담당부서 : </strong>경영조정실 법무팀</td>
						<td><strong>연락처 : </strong>052-216-2272</td>
						<td><strong>관리일 : </strong>2015-09-30</td>
					</tr>
				</tbody>
				</table>
			</div> <!--new_officer end -->
			</div>
		</div>
	</div>
	   
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>