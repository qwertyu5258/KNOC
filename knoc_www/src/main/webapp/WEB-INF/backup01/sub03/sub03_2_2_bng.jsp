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
                    
                   <h4><img src="../images/business/img_ttl_sub03_2_2_bng.gif" alt="카자흐스탄 - bng" /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_bng.gif" alt="카자흐스탄 - bng 광구도" width="600px" /></div>
                    
                    <p class="rtxt">[2012년 6월 기준]</p>
					<table class="chart2" summary="카자흐스탄 - bng 광구 정보를 확인할 수 있습니다.">
					<caption>카자흐스탄 - bng 광구 정보</caption>
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
					<th scope="col">한국측지분<br />공사<br />(%(퍼센트))</th>					
					<th scope="col">국내참여기업</th>
					</tr>
					</thead>
					<tbody>
					<tr>
					<td class="first">탐사사업</td>
					<td>카자흐스탄<br />BNG</td>
					<td>Bakmura LLP</td>
					<td>2012년 3월 20일</td>
					<td>35</td>
					<td>100</td>
					<td>-</td>
					</tr>
					</tbody>
					</table>
                        
                    <p class="mT20">
                    	카자흐스탄 BNG광구는 카자흐스탄 카스피해 북동부에 위치한 육상광구로서 면적은 1,561㎢(평방킬로미터)이다. 
                    	2012년 3월 체결된 BNG Ltd. LLP와의 지분인수계약 및 공동운영계약에 의거하여 한국측(Bakmura LLP)은 35%(퍼센트)의 참여지분을 보유하고 있고, 
                    	그 중 석유공사는 100%(퍼센트)의 지분을 보유하고 있다. 탐사기간은 2013년 6월까지이며, 2012년  탐사시추 3공을 실시 계획 중에 있다
                    </p>
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
						<td><strong>연락처 : </strong>031-380-2779</td>
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