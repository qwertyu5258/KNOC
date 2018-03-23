<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","04");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","00");
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
				<%@include file="/include/subtop_02.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>열린경영</span>
					&gt; <span>환경경영</span>
					&gt; <span class="locanow">환경경영현황</span>
				</div>
				<!--// location: end //-->

				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_4_2.gif" alt="환경경영현황" /></h3>
				</div>				
				
				<!--시작-->				
				<div class="environment02">
					<div>
						<!-- [2009-09-15 수정] :: 작성자: 장정인 -->
						<ul class="tab">
							<li ><a href="sub02_4_2.jsp" title="원료사용 및 에너지" ><img src="/images/management/tab_sub02_4_2_1r.gif" alt="원료사용 및 에너지" border="0"  /></a></li>
							<li><a href="sub02_4_2_1.jsp" title="환경관리 및 성과" ><img src="/images/management/tab_sub02_4_2_2.gif" alt="환경관리 및 성과" border="0"  /></a></li>
						</ul>
						<h4><img src="/images/management/sub02_4_2_ta1_1.gif" alt="주요 에너지 사용과 배출현황" /></h4>
						<h5> 총 수자원 사용량</h5>
						<p>비축유의 지하공동 저장방식 특성상 지하공동 운영기지에서는 공동 주입수로 댐용수, 공업용수, 자연 계곡수 등의 수자원을 사용하고 있으며 비축지사 입지여건에 따라 상기 용수 외에 생활용수인 상수도 또는 지하수를 사용하기도 합니다. 연간 9개 비축기지에서 사용하는 용수량은 약 700천톤 규모로 기지운영에 사용되는 수자원의 최소화를 위해 재활용 및 재이용이 가능하도록 관련설비를 적극 개선하여 물 사용을 최소화하고 있습니다.</p>
						<h5>  에너지 절약 및 홍보</h5>
						<p>공사는 공공기관 에너지이용합리화 추진지침에 의거하여 에너지절약을 위해 직원교육과 홍보활동을 강화하고 있으며 각종 에너지설비의 효율적 운영을 도모하고 있습니다. 설비부문에서 에너지기자재의 신규 또는 교체수요 발생시「고효율 에너지기자재 보급 촉진에 관한 규정」에 따라 고효율에너지기자재 인증제품 또는「효율관리기자재 운용규정」에 따라 에너지소비효율 1등급 제품을 의무적으로 사용하고 있습니다. 또한, 조명부분에서는 기존 조명을 LED조명제품으로 지속적으로 교체하여 에너지절약을 실천하고 있습니다. </p>
						<h5> 에너지절약 목표설정</h5>
						<p>공사는 매년초 전년도 에너지 사용실적을 검토하여 당해연도 연간 에너지 절감목표를 수립하고 있으며 당해연도 에너지절약 목표달성을 위해 다양한 에너지절약 활동을 시행하고 있습니다. 전사적으로 “에너지절약추진위원회”를 분기별로 개최하고 “에너지지킴이”제도를 운영하여 우수에너지지킴이를 선정하여 포상하고 있으며, 카풀제, 선택요일제에 따른 차량운영, 적정 실내온도 준수 등 다양하고 활발한 에너지절약 활동을 추진하고 있습니다.</p>
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
						<td><strong>담당부서 : </strong>HSE실 환경팀</td>
						<td><strong>연락처 : </strong>031-380-2636</td>
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