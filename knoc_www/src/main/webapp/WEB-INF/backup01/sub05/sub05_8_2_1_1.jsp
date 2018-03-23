<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");

	application.setAttribute("gNavMenuDepth2","08");

	application.setAttribute("gNavMenuDepth3","02");

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
                    &gt; <span>석유바로알기</span>
                    &gt; <span class="locanow">석유와생활</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/child/ttl_sub07_2_2.gif" alt="석유와생활" /></h3>
				</div>
				<!--시작-->
				<div class="child">
					<div>
						<ul class="tab">
                    	<li><a href="sub05_8_2_1_1.jsp"><img src="/images/child/tab_sub07_2_2_1r.gif" alt="생활속의석유"/></a></li>
						
						<!--<li><a href="sub07_2_2.jsp" onclick='premier(2);' ><img src="/images/child/tab_sub07_2_2_2.gif" alt="우리나라 에너지 사용현실" /></a></li>-->	
						<li><a href="sub05_8_2_1.jsp"><img src="/images/child/tab_sub07_2_2_3.gif" alt="할수 있어요"/></a></li>
						</ul>
						<div class="tabCon2">
							<h4><img src="/images/child/tab_sub07_2_2_1_1.gif" alt="석유의용도" /></h4>
							<p class="mT10">석유라고 하면 대개가 자동차의 동력이나 가정용난방 정도로 알고 있지만 이외에도 석유의 쓰임새는 다양합니다.<br />

								1. 동력 : 자동차(휘발유,경유), 배(중유,경유), 비행기(항공유)<br />
								2. 열 : 화력발전소(중유), 제철소(중유, 등유, LPG)<br />
								3. 원료 : 합성섬유, 옷감, 페인트, 텐트, 의약품, 합성수지 등<br />

								이밖에도 우리의 일상생활에 석유성분이 전혀 들어가지 않은 물건은 찾아보기 어려울 정도로 석유는 
								우리생활 깊숙이 자리 잡고 있습니다</p>
							<h4><img src="/images/child/tab_sub07_2_2_1_2.gif" alt="석유 제품의 종류" /></h4>
							<ul>
								<li> LPG :프로판 (취사용, 난방용), 부탄 (수송용)</li>
								<li> 휘발유, 나프타 : 자동차용, 항공용, 공업용(드라이크리닝용, 도로용, 세척용)으로 사용</li>
								<li>등유 제연료유 : 휘발유에 이어 유출되는 유분이며 석유제품 중 가장 오래전부터 사용</li>
								<li>경유 : 고속디젤엔진의 연료로 사용 </li>
								<li>아스팔트 중유, 잔사유 : 선박내연기관, 보일러 등의 연료로 사용</li>
							</ul>
							<h4><img src="/images/child/tab_sub07_2_2_1_3.gif" alt="석유 화학 산업" /></h4>
							<div>
								<p><img src="/images/child/sub07_2_2_1_1_img1.gif" alt="석유화학산업단지 장면" /></p>
								<p>석유화학산업이란 석유제품 또는 천연가스를 원료로 에틸렌, 프로필렌 등 기초유분을 생산하고 이 기초유분을 원료로 합성수지, 합성섬유원료, 합성고무 및 각종 기초 화학제품을 생산하는 산업을 말합니다.<br/>
								석유화학산업이 중요한 이유는 이를 통해 자동차, 건설, 전자, 섬유, 생활용품을 비롯해서 비료, 농약, 페인트, 화장품, 세제 등 우리 일상생활에 필수적인 제품이 생산되기 때문입니다.</p>
							</div>
						</div>
					</div>
					<!--
					<div id='premier2' style="display:none;">
                		<ul class="tab">
                    	<li><a href="sub07_2_2.jsp" ><img src="/images/child/tab_sub07_2_2_1.gif" alt="생활속의석유"/></a></li>
						<li><a href="sub07_2_2.jsp" onclick='premier(2);' ><img src="/images/child/tab_sub07_2_2_2r.gif" alt="우리나라 에너지 사용현실" /></a></li>
						<li><a href="sub07_2_2.jsp" ><img src="/images/child/tab_sub07_2_2_3.gif" alt="할 수 있어요"/></a></li>
						</ul>
						<div class="tabCon2">
							<h4 class="mT0"><img src="/images/child/tab_sub07_2_2_2_1.gif" alt="우리나라는 에너지 해외의존도가 매우 높습니다." /></h4>
							<p class="mT10">우리나라는 에너지의 약 97%를 해외에서 수입하고 있습니다. 석탄이나 수력과 같은 에너지가 국내에서 
							생산되고 있고, 동해-1가스전에서도 천연가스와 초경질원유가 생산되고 있지만, 이는 전체 에너지공급량의
							3%에 지나지 않을 정도로 적은 양입니다.
							전체 에너지 수입량 중에서 석유의 비중이 절반에 가까운 47.3%, 석탄은 24.1%, 원자력이 15.3%, 천연가스가
							13.3%를 차지합니다.</p>
							<div class="ctxt mT20"><img src="/images/child/imgin1_sub07_2_2.gif" alt="전체 에너지 수입량 그래프" /></div>
							<h4><img src="/images/child/tab_sub07_2_2_2_2.gif" alt="우리나라 하루 석유소비량 세계 7위" /></h4>
							<p>우리나라가 하루에 소비하는 석유는 장충체육관 부피의 5배가 넘는 약 230만 배럴로 소비량 세계 7위, 수입량은 세계 4위를 기록하고 있습니다. </p>
							<div class="ctxt mT20"><img src="/images/child/imgin2_sub07_2_2.gif" alt="국가별 석유수입량 비교 그래프" /></div>
						</div>
					</div>
					-->
				</div>
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>