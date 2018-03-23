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
                    
                   <h4><img src="../images/business/img_ttl_sub03_2_2_west_kamchatka.gif" alt="러시아 - 서캄차카" /></h4>
                   <div class="mT10"><img src="../images/business/img_sub03_2_2_russian.gif" alt="러시아 - 서캄차카 광구도" /></div>
                    
                   <p class="rtxt">[2010년 7월 현재]</p>
					<table class="chart2" summary="러시아 - 서캄차카 광구 정보를 확인할 수 있습니다.">
					<caption>러시아 - 서캄차카 광구 정보</caption>
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
					<td>러시아<br />서캄차카</td>
					<td>Kamchatneftegaz<br />(공동운영사)</td>
					<td>'05.07</td>
					<td>40</td>
					<td>20</td>
					<td>가스공사, SK, GS칼텍스, 대우인터내셔날, 현대종합상사, 금호석유화학</td>
					</tr>
					</tbody>
					</table>
                        
                    <p class="mT20">러시아 오호츠크 해상에 위치한 서캄차카 해상광구는 한국컨소시엄이 러시아 국영석유회사인 Rosneft사와 공동 운영회사(Kamchatneftegaz)를 설립하여 2005년부터 2008년까지 탐사사업을 추진하였다. </p>
					<p class="mT5">서캄차카 해상광구의 신규 라이센스가 2009년 7월 가즈프롬사로 발급됨에 따라 공사는 서캄차카 사업을 가즈프롬사와 공동으로 추진하기 위해 협상을 진행 중에 있다.</p>
                </div>
				<!--//끝-->
		  </div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>