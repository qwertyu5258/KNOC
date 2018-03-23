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
                    
					<h4><img src="../images/business/img_ttl_sub03_2_2_Parallel.gif" alt="미국 Parallel " /></h4>
                	<div class="mT10"><img src="../images/business/parallel.jpg" alt="Parallel 해상 광구도" /></div>
                	
					<p class="rtxt">[2015년 6월말 기준]</p>
					<table class="chart2" summary="미국 ANKOR 해상 광구 정보를 확인할 수 있습니다.">
					<caption>미국 ANKOR 해상 광구 정보</caption>
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
					<td>Parallel</td>
					<td>삼성물산</td>
					<td>100</td>
					<td>10</td>
					<td>삼성물산</td>
					</tr>
					</tbody>
					</table>
					 <p class="mT20">‘11년 12월 석유공사와 삼성물산는 각각 90%, 10% 지분으로 미국 석유가스 전문기업인 패러랠사 인수 계약을 체결했다.<br />
					 패러랠사는 텍사스 및 뉴멕시코주 등에 8개 생산유전과 2개 가스전을 운영하고 있으며, 3개의 탐사광구도 보유하고 있다.<br />
					현재 일일 0.7천배럴(‘15년 6월 공사몫기준)을 생산하고 있으며, 선진 시장인 미국에서 자원 비즈니스 영역을 확대할 수 있는 경쟁력을 한층 더 제고할 수 있게 되었다.</p>
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