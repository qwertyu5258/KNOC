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
                    
                   <h4><img src="../images/business/img_ttl_sub03_2_2_inam.gif" alt="아제르바이잔 - 이남" /></h4>
                   <div class="mT10"><img src="../images/business/Azerbaijan.gif" alt="아제르바이잔 - 이남 광구도" width="600px" /></div>
                    
                    <p class="rtxt">[2012년 9월 기준]</p>
					<table class="chart2" summary="아제르바이잔 - 이남 광구 정보를 확인할 수 있습니다.">
					<caption>아제르바이잔 - 이남 광구 정보</caption>
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
					<th scope="col">한국측지분<br />(%(퍼센트))</th>
					<th scope="col">한국측지분<br />공사</th>					
					<th scope="col">국내참여기업</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">탐사사업</td>
					<td>아제르바이잔 Inam</td>
					<td>BP</td>
					<td>'07.07</td>
					<td>20</td>
					<td>8</td>
					<td>GS 칼텍스,<br />경남기업 등<br />5 개사</td>
					</tr>
					</tbody>
					</table>
                        
                    <p class="mT20">아제르바이잔 Inam광구는 카스피해 서남부 해역에 위치하는 해상광구로서 의무시추 2공을 시추하였으나 원유발견에 실패, 2008년 PSA 종료 이후 사업철수를 추진 중에 있다.</p>
                </div>
				<!--//끝-->
		  </div>
		  
		   <div class="new_officer">
				<table summary="담당부서 및 연락처 수정일">
				<caption>담당부서 및 연락처 수정일</caption>
				<colgroup>
					<col width="auto" />
					<col width="22%" />
					<col width="22%" />
				</colgroup>
				<tbody>
					<tr>
						<td><strong>담당부서 : </strong>아시아사업처 CIS사업팀</td>
						<td><strong>연락처 : </strong>031-380-2545</td>
						<td><strong>수정일 : </strong>2015-09-30</td>
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