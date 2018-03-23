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
                    
                   <h4><img src="../images/business/img_ttl_sub03_2_2_wokam.gif" alt="인니 워캄" /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_wokam.gif" alt="인니 워캄 광구도" /></div>
                    
                   <p class="rtxt">[2010년 7월 현재]</p>
					<table class="chart2" summary="인니 워캄 광구 정보를 확인할 수 있습니다.">
					<caption>인니 워캄 광구 정보</caption>
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
					<td>인니 워캄</td>
					<td>석유공사</td>
					<td>'01.11</td>
					<td>100</td>
					<td>80</td>
					<td>GS홀딩스</td>
					</tr>
					</tbody>
					</table>
                        
<!--                    <p class="mT20">인도네시아 파푸아주 중남부 해상에 위치한 Wokam 광구는 1997년 12월 4일 생산물 분배계약(PSC) 체결을 시작으로 탐사사업이 진행되어 왔다. 현재까지 물리탐사 2D 2,514L-km(라인킬로미터), 3D 225㎢(평방킬로미터)와 탐사시추 1공(Bumerah-1x)을 완료하였으며, 가스를 발견하였으나 다량의 이산화탄소를 함유해 사업성 확인에는 실패하였다. 2008년 12월 3일 탐사기간이 만료됨에 따라 사업 종료를 추진하고 있다.</p>-->
                </div>
				<!--//끝-->
		  </div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>