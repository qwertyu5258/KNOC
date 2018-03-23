<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","06");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","02");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>     
<%@include file="/include/comheader.jsp"%>


<!--// subtopNavi: start //-->
<%@include file="/include/subtopnavi_new.jsp"%>
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
                    &gt; <span>석유정보</span>
                    &gt; <span>석유이야기</span>
                    &gt; <span class="locanow">석유개발과정</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_6_3_2.gif" alt="석유개발과정" /></h3>
				</div>
				<!--시작-->
               <div class="business2">
					<div>
						<ul class="tab">
						<li><a href="sub03_6_3_2.jsp" title="개발순서" ><img src="/images/business/img_tab01.gif" alt="개발순서" /></a></li>
						<li><a href="sub03_6_3_2_1.jsp" title="탐사단계" ><img src="/images/business/img_tab02.gif" alt="탐사단계"/></a></li>
						<li><a href="sub03_6_3_2_2.jsp" title="개발단계" ><img src="/images/business/img_tab03_on.gif" alt="개발단계"/></a></li>
						<li><a href="sub03_6_3_2_3.jsp" title="생산단계" ><img src="/images/business/img_tab04.gif" alt="생산단계"/></a></li>
						</ul>
						<div class="mT20"><img src="../images/business/img_sub06_3_2_tab03_01.gif" alt="석유개발작업은 탐사단계에서 취득한 정보를 종합 분석하여 유전평가, 개발계획 수립, 생산시설 건설, 생산정 시추 등을 수행하는 과정" /></div>
						<h5>유전평가</h5>
						<p>탐사단계에서 취득한 지질, 지구물리 및 시추 결과 등에 대한 종합분석을 통하여 저류층의 특성을 파악하고 다양한 개발 시나리오에 따른 매장량 및 생산량을 예측하는 작업</p>
						<h5>개발계획 수립</h5>
						<p>유전평가 결과를 토대로 다양한 개발 시나리오와 생산 예측 등 유전 개발 계획 수립<br />
						- 개념설계 : 기술 및 경제적 타당성을 비교하여 최적의 개발 구도를 선정<br />
						- 기본설계 : 전체적인 타당성을 점검하고 보다 구체적인 계획 수립<br />
						- 세부설계 : 기본설계를 토대로 세부설계 실시 및 계획 수립</p>
						<h5>생산시설 건설 및 설치</h5>
						<p>생산시설을 제작하고 제작된 생산설비를 현장에서 조립ㆍ설치</p>
						<h5>생산정 시추</h5>
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
						<td><strong>담당부서 : </strong>석유정보센터 정보기획팀</td>
						<td><strong>연락처 : </strong>052-216-2508</td>
						<td>&nbsp;</td>
					</tr>
				</tbody>
				</table>
			</div> <!--  new_officer end -->
		  
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>