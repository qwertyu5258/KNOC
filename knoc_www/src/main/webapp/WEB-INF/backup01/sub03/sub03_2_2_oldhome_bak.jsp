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
                    
                   <h4><img src="../images/business/img_ttl_sub03_2_2_oldhome.gif" alt="미국 Old Home " /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_oldhome.gif" alt="Old Home 해상 광구도" /></div>
                	
					  <p class="rtxt">[2015년 6월말 기준]</p>
					<table class="chart2" summary="Old Home 광구 정보를 확인할 수 있습니다.">
					<caption>Old Home 광구 정보</caption>
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
					<td class="first">개발생산</td>
					<td>Old Home<br /> 육상광구</td>
					<td>석유공사</td>
					<td>46.75</td>
					<td>23.375</td>
					<td>GS E&R</td>
					</tr>
					</tbody>
					</table>
                        
                    <p class="mT20">미국 알라바마주 Escambia County에 위치한 육상 광구로, 공사는 ’10년 12월 매매계약을 체결하였다 현재 일일 0.1천배럴(‘15년 6월 공사몫기준)을 생산하고 있으며, 석유가스 자주개발률 제고는 물론 현재 운영 중인 미국 Ankor 사업과 연계 운영하여 시너지 효과를 창출할 것으로 기대됨.</p>

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