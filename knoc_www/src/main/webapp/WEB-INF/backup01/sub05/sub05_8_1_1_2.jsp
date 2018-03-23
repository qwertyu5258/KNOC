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
						<li><a href="sub05_8_1_1.jsp"><img src="/images/child/tab_sub07_1_1_1_2.gif" alt="석유공사는"/></a></li>
						<li><a href="sub05_8_1_1_2.jsp"><img src="/images/child/tab_sub07_1_1_1_3r.gif" alt="누비"/></a></li>
						</ul>
						<div class="tabCon2">
							<div class="topBox2">
									<dl>
										<dt>character meaning</dt>
										<dd>
											한국석유공사의 새로운 캐릭터는 드넓은 대양을 누비는 돌고래로 표현되었다.
											전 세계를 누비는 돌고래의 강인한 역동성은 한국석유공사의 끊임없는 도전정신과 글로벌 메이저 플레이어로서의 위상을 대변한다.
											돌고래의 영민한 특성은 21세기 신 에너지를 탐사하는 한국석유공사의 혁신성을 나타낸다.
											또한, 인류에게 친근한 동물인 돌고래를 통해 국민에게 보다 가까이 다가가고 국민에게 사랑 받는 한국석유공사의 새로운 모습을 기대할 수 있다.
										</dd>
										<dt style="padding-top:10px ;">visual comment</dt>
										<dd>
											한국석유공사의 가치를 담은 돌고래로 표현하기 위하여 돌고래의 역동적인 제스처를 강조하였다.
											긍정을 상징하는 손동작으로 어떠한 상황에서도 의지를 굽히지 않는 한국석유공사의 불굴의 의지를 나타내었으며, 밝게 웃고 있는 표정에서
											힘찬 에너지를 느낄 수 있다. 또한, 머리에 하트모양을 결합하여 국민에게 사랑 받는 상징물로서 이미지를 강조하였다.
											한국석유공사의 캐릭터로서 이미지를 강조하기 위하여 CI 그래픽 모티프를 다리에 적용하였으며, 이를 통해 차별화된 이미지로 완성되었다.
										</dd>
									</dl>
								</div>
							</div>
							<h4 class="mT30"><img src="/images/child/tit_child03.gif" alt="누비의 다양한 응용사례" /></h4>						
							<div class="mascot">
								<img src="/images/child/mascot_03.gif" alt="환영합니다 페트로핀" />
								<img src="/images/child/mascot_04.gif" alt="넘버원 페트로핀" />
								<img src="/images/child/mascot_05.gif" alt="교육 페트로핀" />
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