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
							<li><a href="sub02_4_5.jsp" title="환경관리 및 성과" ><img src="/images/management/tab_sub02_4_2_5.gif" alt="환경관리 및 성과" border="0"  /></a></li>
							<li ><a href="sub02_4_6.jsp" title="기후변화대응" ><img src="/images/management/tab_sub02_4_2_6on.gif" alt="환경관리 및 성과" border="0"  /></a></li>
						</ul>
						<h4><img src="/images/management/sub02_4_2_ta4_5.gif" alt="온실가스 저감" /></h4>
						<p style="padding-top:8px;padding-bottom:8px; padding-right:2px;">공사는 공공부문 온실가스 에너지 목표관리제 추진전략과 신재생에너지 발전계획 수립을 통해 정부의 저탄소 녹색성장에 적극적으로
						 동참하고 기후변화 대응에도 앞장서고 있습니다.</p>
						
						<h5>공공부문 온실가스·에너지 목표관리제 실시</h5>
						<p>공사는 2011년 「저탄소 녹색성장 기본법」, 「공공부문 온실가스·에너지 목표관리 운영 등에 관한 지침」에 의해
						 공공부문 목표관리제 대상기관으로 2015년까지 연평균 온실가스 배출량(’07~’09 평균) 대비 20% 이상을 감축하기 위해
						 온실가스 감축 및 에너지 절약 활동을 적극적으로 실천하고 있습니다. 또한 기후변화 대응협의체를 구성하여 매년 온실가스 저감에 대한 교육,
						 워크숍등을 통해 온실가스 감축을 위한 지속적인 개선 활동을 하고 있습니다.</p>
						
						
						<h5>신재생에너지 발전계획 수립 및 시행</h5>
						<p>공사는 2015년까지 에너지 소비량의 20%를 절감하는 정부정책에 적극 부응하고, 친환경 비축기지를 운영하기 위하여 신재생에너지 발전계획을 수립하였습니다.
						 2012년에는 전력시설 고효율 개선을 위한 수전 변압기 운영방법을 개선하였고,
						 2013년 7월 곡성지사에서 태양광 발전설비(40kW)를 설치하여 온실가스 감축 및 에너지 효율 향상을 추진하였습니다.</p>
						 
						<h5>화상회의 확대</h5>
						<p>공사는 글로벌 경영환경에 부합하는 전사 화상회의 시스템을 확대·적용하기 위하여 국내 사무소 및 비축기지에 회의장비를 보강하고,
						 해외 사무소 화상장비 등의 인프라 구축을 확대하고 있습니다. 이를 통하여 온실가스 배출 저감을 적극적으로 실시하고 있습니다.</p> 
						  
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