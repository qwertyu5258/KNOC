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
							<li ><a href="sub02_4_2.jsp" title="원료사용 및 에너지" ><img src="/images/management/tab_sub02_4_2_1.gif" alt="원료사용 및 에너지" border="0"  /></a></li>
							<li><a href="sub02_4_2_1.jsp" title="환경관리 및 성과" ><img src="/images/management/tab_sub02_4_2_2r.gif" alt="환경관리 및 성과" border="0"  /></a></li>
						</ul>
						<h4><img src="/images/management/sub02_4_2_ta1_2.gif" alt="환경 관리" /></h4>
						<h5> 환경목표 관리</h5>
						<p>최고경영자의 환경 방침과 각 현장의 환경측면을 파악하고 환경에 심각한 영향을 미치는 요소에 대하여 환경목표와 세부 목표를 설정하여 이에 대한 개선계획으로 환경관리계획을 수립하여 이행하고 있습니다. 특히 석유개발 부문은 전년도 HSE 운영 문제점 및 성과를 반영한 「연간 보건,안전,환경 추진계획(Yearly HSE Plan」을 수립하여 단계별로 이행하고 있으며, 현재까지 국내외 석유 탐사,생산 현장에서 누유사고 등 환경사고의 발생사례는 없었습니다. 석유비축 부문은 수질, 대기, 토양, 폐기물 등에 대한 법적 규제치보다 현저히 낮은 수준의 자체 목표치를 적용하여 관리하고 있습니다.</p>
						<h5>환경영향 평가</h5>
						<p>최국내외 석유자원 개발, 생산 및 석유비축 건설공사 시 사업 시행으로 인한 자연환경, 생활 및 사회 경제적 환경에 미치는 해로운 영향을 예측, 분석하여 환경영향을 줄일 수 있는 방안을 지속적으로 강구해 오고 있습니다. 또한 당초의 환경영향 평가가 적정하게 실시되었는지를 파악하기 위하여 사후 환경 영향조사를 주기적으로 실시하고 있습니다. 환경영향 평가는 환경측면의 파악 범위를 과거, 현재, 미래의 잠재적인 환경영향요소(긍정적, 부정적인 요소), 직/간접적인 환경영향 요소, 사건/사고/비상 시 환경영향 요소를 파악하게 됩니다. 대기, 물로 배출되는 물질, 고형물 및 폐기물, 토양오염 물질, 천연자원의 사용, 시각장애 요인, 지원업무로부터 발생되는 환경적인 요인 들이 파악 대상이며 세부적으로는 수질 오염물질, 대기오염물질, 폐기물, 소음 및 진동, 토양 오염물질을 대상으로 오염 정도를 측정하게 됩니다.</p>
						<h4><img src="/images/management/sub02_4_2_ta1_3.gif" alt="환경 성과" /></h4>
						<h5>수질 및 해양관리</h5>
						<p>전국적으로 분포되어 있는 비축지사 및 건설사무소는 위치한 지역 실정에 맞게 자체적인 수질관리 목표치를 법적 규제치보다 낮게 설정하여 수질오염예방에 최선을 다하고 있습니다. 현장 별로 환경관리 책임자를 임명하여 환경관리 조직을 운영하고 있으며, 배출수 수질분석을 전문기관에 위탁하여 측정결과의 신뢰성을 확보하고 있습니다. 설비 운영중 발생할 수 있는 자체 목표치 초과를 예방하기 위해 균등부하 조정, 감시시스템 강화 등을 통해 깨끗한 수질을 유지하고 있으나 더 향상된 수질확보를 위해 폐수처리시설을 지속적으로 개선하고 있습니다. </p>
						<h5>대기관리</h5>
						<p>대기오염물질 배출규제가 강화됨에 따라 비축지사에서는 대기오염 물질 배출량을 줄이고자 다각적인 노력이 계속되고 있습니다. 휘발유 탱크는 유증기가 배출될 수 있는 틈새(Roof Seal, Column Well)를 보강하는 등 일부설비를 개선하였으며 원유 저장시설에서는 유증기 소각설비 처리효율 향상, 유증기 회수설비(VRU), 폐수처리설비 악취방지시설 설치 등을 통해 대기오염물질 배출을 최소화 시키고 있습니다. 또한 원유 출하작업시 선박에서 배출해오던 대기오염물질도 비축지사에서 처리토록 관련설비를 보완하여 악취로 인한 민원을 최소화하였습니다</p>
						<h5>토양관리</h5>
						<p>유류 시설물에 의한 토양오염이 최소화할 수 있도록 현장 시설물 점검을 업무지침으로 표준화하여 일상점검을 실시하고 있으며, 현장부서에 대한 환경 교육을 지속적으로 실시하여 토양오염 방지를 위한 사전 예방활동에 주력하고 있습니다. 토양환경 보전법에 의한 검사시기 이전에 자발적으로 토양검사를 실시하도록 유도하여 검사시기를 탄력적으로 운용하고 있습니다. 최근 비축지사 및 동해-1가스전 대상 지상탱크 및 주변지역에 대한 검사 결과, 토양 검사 전문기관으로부터 모두’적합’판정을 받았습니다.</p>
						<h5>폐기물관리</h5>
						<p>울산지사는 탱크개방으로 인한 지정폐기물, 가스전은 해상 플랫폼의 생산시설 운영으로 인한 폐유가 주로 발생하였습니다.  발생 폐기물은 전량 전문 처리업체에 의해 반출, 처리 또는 재활용되었으며, 바젤협약에서 규정하고 있는 유해폐기물에 대한 통제대상 폐기물을 점검하여 국제협약 기준에 따라 관리하고 있습니다. 현재 폐기물 배출의 최소화를 위하여 폐기물발생 저감방안에 대한 연구 및 교육이 지속적으로 이루어지고 있습니다. </p>
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