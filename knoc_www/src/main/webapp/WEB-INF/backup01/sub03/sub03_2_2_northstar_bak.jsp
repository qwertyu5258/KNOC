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
                    
					
				<h4><img src="../images/business/img_ttl_sub03_2_2_northstar02.gif" alt="미국 Northstar" /></h4>
   				<p class="mT10"><img src="../images/business/northstar.jpg" width="615px" height="430px" alt="미국 Northstar 해상 광구도" /></p>
                	<div class="mT10"></div>
                	
				  <p class="rtxt">[2015년 6월말 기준]</p>
				  <table class="chart2" summary="미국 ANKOR 해상 광구 정보를 확인할 수 있습니다.">
					<caption>
					미국 Northstar 해상 광구 정보
					</caption>
					<col width="60px" />
					<col width="60px" />
					<col width="70px" />
					<col width="50px" />
					<col width="50px" />
					<col width="60px" />
					<thead>
					<tr>
					<th scope="col" class="first">구분</th>
					<th scope="col">광구명</th>
					<th scope="col">운영권자</th>
					<th scope="col">한국측지분<br />(%(퍼센트))</th>
					<th scope="col">한국측지분<br />공사</th>					
					<th scope="col">국내참여기업</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">생산사업</td>
					<td>Northstar</td>
					<td>석유공사</td>
					<td>100</td>
					<td>67</td>
					<td>GS E&R, 삼천리</td>
					</tr>
					</tbody>
					</table>
					<p class="mT20">‘11년 12월 석유공사는 미국 Northstar사 멕시코만 자산(생산 6개, 탐사 8개)을 GS E&R, 삼천리와 함께 인수하였다.
				  일일 1.9천배럴(‘15년 6월 공사몫기준)을 생산하고 있으며, 북미유망 지역의 자산 인수로 북미지역에 대한 자원개발 비즈니스 영향력을 확대하였다. </p>
					
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
						<td><strong>담당부서 : </strong>생산운영처 미주생산팀</td>
						<td><strong>연락처 : </strong>052-216-3730</td>
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