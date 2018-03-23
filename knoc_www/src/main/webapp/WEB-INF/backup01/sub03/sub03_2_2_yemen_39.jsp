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
                    
                   <h4><img src="../images/business/img_ttl_sub03_2_2_yemen_39.gif" alt="예멘 39" /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_yemen_39.gif" alt="예멘 39 광구도" /></div>
                    
                    <p class="rtxt">[2010년 7월 현재]</p>
					<table class="chart2" summary="예멘 39 광구 정보를 확인할 수 있습니다.">
					<caption>예멘 39 광구 정보</caption>
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
					<td>예멘39</td>
					<td>석유공사</td>
					<td>'07.12</td>
					<td>90.25</td>
					<td>45.125</td>
					<td>삼천리, 대성, GS홀딩스</td>
					</tr>
					</tbody>
					</table>
                        
                    <p class="mT20">예멘 39광구는 예멘 동남부의 오만과 접경하는 지역의 육상광구로 2007년 5월 국제경쟁입찰을 통해 예멘 정부와 생산물분배계약을 체결함으로서 광권을 취득하였으며 광구의 면적은 약 5,237km²(평방킬로미터) 이다. 한국석유공사가 운영권자인 예멘 16광구와 경계를 접하고 있으며 국내참여기업으로는 광구 운영권자인 한국석유공사와 삼천리, 대성산업, GS홀딩스 등이 있다.</p>
					<p class="mT10">기존 물리탐사 자료에 대한 전산재처리를 2008년에 완료 하였으며, 탐사1기의 의무탐사 실시를 위한 신규 2D 물리탐사 작업(506L-km(라인킬로미터))을 완료 하였다. 
현재 신규취득 된 물탐 자료를 이용한 유망구조 도출 및 해석/평가 작업이 진행 중이다.
</p>
                </div>
				<!--//끝-->
		  </div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>