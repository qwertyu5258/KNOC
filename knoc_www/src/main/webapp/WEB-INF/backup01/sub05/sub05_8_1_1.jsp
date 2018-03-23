<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");

	application.setAttribute("gNavMenuDepth2","08");

	application.setAttribute("gNavMenuDepth3","01");

	application.setAttribute("gNavMenuDepth4","01");
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
				<%@include file="/include/subtop_07.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>어린이</span>
                    &gt; <span>석유이야기</span>
                    &gt; <span class="locanow">한국석유공사</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/child/ttl_sub07_1_1_1.gif" alt="한국석유공사" /></h3>
				</div>
				<!--시작-->
				<div class="child">
					<div>
						<ul class="tab">
                    	<li><a href="sub05_8_1_1_1.jsp"><img src="/images/child/tab_sub07_1_1_1_1.gif" alt="인사말"/></a></li>
						<li><a href="sub05_8_1_1.jsp"><img src="/images/child/tab_sub07_1_1_1_2r.gif" alt="석유공사는"/></a></li>
						<li><a href="sub05_8_1_1_2.jsp"><img src="/images/child/tab_sub07_1_1_1_3.gif" alt="페트로핀"/></a></li>
						</ul>
						<div class="tabCon2">
							<div class="topBox">
								<p class="mT0"><img src="/images/child/sub07_1_1_1_te22.gif" alt="한국석유공사는" /></p>
								<p>우리 생활에 없어서는 안될 중요한 에너지원인 석유를 안정적으로 공급하여 국민들에게<br />
								희망과 편안한 제공해 드리기 위해 1979년도에 만들어진 공기업입니다." </p>
		
							</div>
							<h4><img src="/images/child/sub07_1_1_1_te2-2.gif" alt="석유개발사업" /></h4>
							<p>우리나라 동해나 해외의 베트남, 리비아, 인도네시아 등지에서 석유 또는 가스가 묻혀있는 곳을 찾아내어(탐사), 석유나 가스를 뽑아낼 수 있는 생산시설을 설치한 후(개발), 뽑아낸 석유와 가스를(생산) 필요한 곳에 판매하거나 공급하는 일을 하고 있답니다.</p>
							<h4><img src="/images/child/sub07_1_1_1_te2-3.gif" alt="석유비축사업" /></h4>
							<p>전쟁 등 위험한 상황이 닥치거나 석유 가격이 지나치게 비싸졌을 때를 대비하여 지하 동굴과 지상 탱크에 원유와 석유제품(휘발유, 등유, 경유, LPG 등)을 저장하고 있습니다. 현재 거제, 여수, 울산, 구리 등 9곳의 비축기지에는 우리나라가 약 55일 동안 쓸 수 있는 양의 석유가 저장되어 있어요.</p>
							<h4><img src="/images/child/sub07_1_1_1_te2-4.gif" alt="석유정보사업" /></h4>
							<p>우리나라뿐 아니라 국제석유시장에서 사고 팔리는 석유의 가격과, 석유를 생산하고 있는 나라들의 정치ㆍ사회ㆍ경제적 움직임 등을 조사하고 분석하는 일을 하고 있습니다. 이렇게 우리나라 경제와 밀접한 관계인 석유에 대한 정보를 신속하게 제공하는 일을 통해 정부의 정책수립에 도움을 주고 있어요. 또한, 한국석유공사 홈페이지<a href="/"><span class="ce45108_b">(www.knoc.co.kr)</span></a>나 석유정보망 페트로넷<a href="http://www.petronet.co.kr/" target="_blank" title="석유정보망 홈페이지로 이동(새창)"><span class="ce45108_b">(www.petronet.co.kr)</span></a>에서도 석유에 관한 여러 가지 정보를 얻을 수 있답니다.</p>
						</div>
					</div>
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
						<td><strong>담당부서 : </strong>비서실 홍보팀</td>
						<td><strong>연락처 : </strong>031-380-2153</td>
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