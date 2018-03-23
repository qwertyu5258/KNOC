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
							<li ><a href="sub02_4_4.jsp" title="주요자원 및 에너지" ><img src="/images/management/tab_sub02_4_2_4.gif" alt="주요자원 및 에너지" border="0"  /></a></li>
							<li><a href="sub02_4_5.jsp" title="환경관리 및 성과" ><img src="/images/management/tab_sub02_4_2_5on.gif" alt="환경관리 및 성과" border="0"  /></a></li>
							<li ><a href="sub02_4_6.jsp" title="기후변화대응" ><img src="/images/management/tab_sub02_4_2_6.gif" alt="환경관리 및 성과" border="0"  /></a></li>
						</ul>
						<h4><img src="/images/management/sub02_4_2_ta4_2.gif" alt="환경관리" /></h4>
						
						
						<h5>환경목표관리</h5>
						<p>최고경영자의 환경방침과 각 사업장의 환경측면을 파악하고 환경에 심각한 영향을 미치는 요소에 대하여 환경목표와 세부목표를
						 설정하여 이에 대한 개선계획으로 환경관리계획을 수립하여 이행하고 있습니다.  </p>
						
						<h5>환경영향평가</h5>
						<p>국내외 석유개발사업 시행 및 석유비축 건설공사시  해당 사업 수행으로 인한 자연 환경, 
						생활 및 사회 경제적 환경에 미치는 부정적인 영향을 예측, 분석하여 환경영향을 최소화하는 방안을 지속적으로 강구해 오고 있습니다. </p>
						
						<h4><img src="/images/management/sub02_4_2_ta4_3.gif" alt="환경성과" /></h4>
						<p style="padding-top:8px;padding-bottom:8px; padding-right:2px;">
						공사는 모든 사업장에서 시설 및 장비를 환경친화적으로 개선하고, 
						사업장 내에서 발생하는 오염물질을 최소화하는 등 지속적으로 환경투자를 확대하여 친환경경영을 실천하고 있습니다.
						 또한, 사업부분별 환경·보건·안전에 대한 책임을 강화하여 유형별<br/> 대응전략을 마련하고 있으며, 각종 오염방지 활동, 에너지 절감, 
						 현장의 안전보건에 대한 정기적인 교육 및 훈련을 강화하고 있습니다.</p>
						 
						<h5>수질 및 해양관리</h5>
						<p>공사는 국내외 모든 사업장에서 배출되는 수질오염물질의 배출 감소를 위해 법적 규제치 또는 국제협약기준 보다 강화된<br/>
						자체기준을 설정하여 운영하고 있으며 이의 준수 여부를 모니터링하고 있습니다. 
						또한 2012년부터 해상입출하 터미널 시설을<br/> 국제기준에 따라 평가하는 「해상터미널 선진안전관리제도」를 도입,
						 운영함에 따라 위험선박을 원천 차단하여 중대 해양사고를 예방하는 등 수질오염 예방에 최선을 다하고 있습니다.</p>
						 
						<h5>대기관리</h5>
						<p>대기오염물질 배출규제가 강화됨에 따라 비축지사에서는 대기오염 물질 배출량을 줄이고자 다각적으로 노력하고 있습니다.<br/>
						 유증기가 배출될 수 있는 틈새(Roof Seal, Column Well)를 보강, 유증기 소각설비 처리효율 향상, 유증기회수설비 (VRU) 설치,
						  폐수처리설비 악취방지시설 설치 등을 통해 대기오염물질 배출을 최소화 시키고 있습니다. 
						  또한 원유 출하작업시 선박에서 <br/>배출해오던 대기오염물질도 비축지사에서 회수처리토록 관련 설비를 보완하여 악취로 인한 민원을 최소화하고 있습니다.</p> 
						  
						<h5>토양관리</h5>
						<p>공사는 간이방유제 설치와 탱크저판 및 유류배관 점검 강화를 통해 토양오염을 예방하고 있으며, 
						유류시설에 의한 토양오염이 최소화될 수 있도록 현장 시설물 점검을 업무지침으로 표준화하여 일상점검을 실시하고 있습니다.
						 또한 2013년 3월 환경부와 ‘토양오염저감을 위한 자발적 협약’을 체결하여 정부의 토양 보전 정책에 적극 참여하고 있습니다. </p>   
						  
						<h5>폐기물 관리</h5>
						<p>공사는 사업장별로 발생하는 폐기물을 종류별로 적정보관 및 처리를 통해 체계적으로 관리되고 있습니다.
						 또한, 발생되는<br/> 폐기물은 전량 전문 처리업체에 의해 반출, 처리 또는 재활용하고 있으며,
						  바젤협약에서 규정하고 있는 유해폐기물 및 통제대상 폐기물 여부에 따라 점검하고 있으며,
						  이의 결과를 토대로 폐기물 처리기준 및 관련법규에 따라 적법하게 관리하고 있습니다.</p>  
						 
						 <h4><img src="/images/management/sub02_4_2_ta4_4.gif" alt="환경교육" /></h4>
	                   
						<p style="padding-top:8px;padding-bottom:8px; padding-right:2px;">환경 및 보건안전 관리 역량을 강화하기 위하여 각종 오염방지 기법, 에너지 절감, 현장의 안전보건에 대한 교육을 주기적으로 실시하고 있습니다. 
						사업장별 환경담당자 주관으로 연간 환경 관리 및 운영계획, HSE 관심분야 등을 주제로 현장교육을 실시하고 있으며, 
						건설현장의 환경 의식 향상을 위해 협력회사의 환경경영활동을 주기적으로 모니터링하고 있습니다. 
						동해-1 가스 생산<br/> 사업장 및 시추선의 경우, 직원 직무별로 HSE 업무수행에 필요한 교육, 훈련 및 자격에 대하여 HSE 교육·훈련 매트릭스로 관리하여 사업장의 HSE 관리가 체계적으로
						 이루어지도록 하고 있습니다. 또한, 비축지사는 위험요소를 효과적으로 발굴하고 개선하기 위해 비축지사간 안전 · 환경관련 지식 및 정보를 교환하고 있습니다.</p> 					 						 
					</div>
                </div>
				<!--//끝-->
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
							<td class="contact_team"><strong>담당부서 : </strong>안전환경처 환경보건팀</td>
							<td class="contact_user"><strong>담당자 : </strong>염지연</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2942</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>