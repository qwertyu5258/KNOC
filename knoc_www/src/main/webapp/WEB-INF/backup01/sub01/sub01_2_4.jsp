<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","04");
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
				<%@include file="/include/subtop_01.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>공사소개</span>
                    &gt; <span>기업문화</span>
                    &gt; <span class="locanow">일처리방식</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-15 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_2_4.gif" alt="일처리방식" /></h3>
				</div>
				<!--시작-->				
				<div class="culture">
					<div><img src="/images/info/imgin1_sub01_2_4.gif" alt="핵심가치별 일처리방식" />
						<ul class="blindtext">
						<li><em>도전</em>(Challenge) - 사업계획, 사업운영, 전략기획</li>
						<li><em>전문가 정신</em>(Professionalism) - 연구개발, 인재확보, 사업지원</li>
						<li><em>배려</em>(Respect) - 평가보상, 의욕소통, 복리후생</li>
						<li><em>공헌</em>(Contribution) - 회계재무, 안전환경, 사회책임</li>
						</ul>
					</div>
					<ul>
						<li><img src="/images/directors/icon01.gif" alt="" /><strong> KNOC-Way란 </strong>경영활동에 필요한 일을 수행하는 기본철학이자 방법론입니다.</li>
					</ul>
					<ul class="knocway pl15">
						<li><strong> 사업계획 </strong>- 신규사업을 발굴하여 사업타당성을 검토하고 사업운영에 필요한 준비를 하는 것입니다.</li>
						<li><strong> 사업운영 </strong>- 인적·물적자원을 투입하고 구성원의 역량을 결집하여 사업을 효율적으로 수행함으로써 사업목표를 달성하는 것입니다.</li>
						<li><strong> 사업지원 </strong>- 사업에 필요한 지원활동을 수행하고 경영위험 요인을 최소화 할수 있도록 경영환경을 안정적으로 관리하는 것입니다.</li>
						<li><strong> 연구개발 </strong>- 석유에너지관련 기술 및 정보를 연구하고 개발하여 선진기술력과 정보력을 확보하는 것입니다.</li>
						<li><strong> 전략기획 </strong>- 지속가능한 경쟁우위를 창출하도록 비젼을 제시하고 경영전략을 수립·시행하는 것입니다.</li>
						<li><strong> 인재확보 </strong>- 인적자원을 체계적으로 선발하여 능력에 맞게 적재적소에 배치히고 교육훈련을 통해 인적역량을 강화하는 것입니다.</li>
						<li><strong> 회계재무 </strong>- 재무정보를 이해관계자에게 제공하고, 자금을 적기에 조달하여 안정적이고 효율적으로 운용하는 것입니다.</li>
						<li><strong> 평가보상 </strong>- 조직 및 구성원의 성과를 공정하게 평가하고 보상하여 지속적인 성과향상을 유도하는 것입니다.</li>
						<li><strong> 의욕소통 </strong>- 구성원의 근무의욕을 고취하고 다양한 이해관계자와 원활히 소통하는 것입니다.</li>
						<li><strong> 복리후생 </strong>- 구성원에게 최적의 근무조건과 근무환경을 제공하여 구성원의 만족도를 제고하는 것입니다.</li>
						<li><strong> 안전환경 </strong>- 인명 및 시설물의 안전사고와 환경오염사고를 미연에 방지하고 사고발생 시 그 피해를 최소화하는 것입니다.</li>
						<li><strong> 사회책임 </strong>- 공사의 이해관계자와 상생관계를 구축하고 지역사회발전 및 공익에 기여함으로써 궁극적으로 인류행복을 이루는 것입니다.</li>
					</ul>
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
						<td><strong>연락처 : </strong>031-380-2157</td>
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