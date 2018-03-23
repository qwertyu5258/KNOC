<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
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
			  <%@include file="/include/subtop_03.jsp"%>
			  <!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>사업소개</span>
                    &gt; <span>해외사업</span>
                    &gt; <span class="locanow">석유개발현황도</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_2_2.gif" alt="석유개발현황도" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
                	<%@include file="sub03_2_2_map.jsp"%>
                    
                   <h4><img src="../images/business/img_ttl_sub03_2_2_namangan.gif" alt="우즈베키스탄 Namangan-Chust" /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_uz.gif" alt="우즈베키스탄Namangan-Chust 광구도" /></div>
                    
                    <p class="rtxt">[2015년 3월말 기준]</p>
					<table class="chart2" summary="우즈벡 나망간/추스트 광구 정보를 확인할 수 있습니다.">
					
					<caption>우즈베키스탄 나망간/추스트 광구 정보</caption>
					<col width="60px" />
					<col width="60px" />
					<col width="70px" />
					<col width="70px" />
					<col width="50px" />
					<col width="50px" />
					<col width="60px" />
					<thead>
					<tr>
					<th scope="col" class="first">구분</th>
					
					<th scope="col">광구명</th>
					
					<th scope="col">운영권자</th>
					
					<th scope="col">지경부 신고일</th>
					
					<th scope="col">한국측지분<br />(%)</th>
					
					<th scope="col">공사지분<br />(%)</th>					
					
					<th scope="col">국내참여기업</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">탐사사업</td>
					<td>우즈베키스탄 Namangan-Chust</td>
					<td>한국측</td>
					<td>2008년 12월</td>
					<td>100</td>
					<td>50</td>
					<td>SK가스,<br /> POSCO,<br />삼천리,<br />SK E&amp;S</td>
					</tr>
					</tbody>
					</table>
                        
                    <p class="mT20" style="text-align:justify;">나망간/추스트 광구는 우즈베키스탄 북동부 페르가나 분지 북부 키르기즈스탄 접경지역에 위치한 육상 광구로, 면적은 약 4,800 km²이다.<br />2008년 11월 탐사계약을 체결, 2009년 5월부터 탐사작업을 진행 중이다.</p>
                </div>
				<!--//끝-->
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
						<td><strong>담당부서 : </strong>탐사사업처 아시아탐사팀</td>
						<td><strong>연락처 : </strong>052-216-3147</td>
						<td><strong>관리일 : </strong>2015-09-30</td>
					</tr>
				</tbody>
				</table>
			</div><!-- new_officer end -->
		  
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>