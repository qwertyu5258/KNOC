<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","10");
	application.setAttribute("gNavMenuDepth3","05");
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
				<%@include file="/include/subtop_01.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>공사소개</span>
					&gt; <span>기업문화</span>
                    &gt; <span class="locanow">경영방침</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-10-25 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub11_02.gif" alt="경영밤침" /></h3>
				</div>
				<!--시작-->				
				<div class="business2">
					
					<h4><img src="/images/info/sub01_11_2.gif" alt="경영방침" /></h4>
					<p><img src="/images/info/sub01_11_img02.png" 
					alt="책임경영[취지]:주인의식을 가지고 소명을 완수함으로써 구성원 개인뿐만 아니라 공기업으로서 사회적 책임과 역할을 다하는 것
					[주요내용]
					▶ 주인의식을 가지고 개인의 성장과 회사의 발전을 함께 함 
					▶ 국가 에너지안보 담당 중추 공기업으로서의 임무 완수 
					▶ 회적 책임을 다함으로써 국민에게 신뢰받는 기업으로 성장 
					
					내실경영 [취 지]:기술, 관리 분야의 질적 발전을 도모하고 기업가치 향상에 주력하여 외형과 내실의 균형된 성장을 도모하는 것
					[주요내용]
					▶ 탐사성공을 통한 성장추진으로 석유기업 본연의 임무에 충실 
					▶ 핵심기술력과 경영관리역량 확보를 통한 글로벌 경쟁력 강화 
					▶ 역량 고도화를 통해 내실 있는 가치창출 기업으로 성장 
					
					미래경영 [취지]외부 환경 변화에 선제적으로 대응하고 공사 역량을 극대화함으로써 지속가능한 성장을 확보하는 것 
					[주요내용]
					▶ 경쟁력 확보와 역량 결집을 통해 경영환경 변화에 적극 대응
					▶ 비전통 석유·가스 개발 등 미래 석유시대를 능동적으로 대비 
					▶ 국민행복을 도모하며 글로벌 무대에서 지속성장하는 기업으로 도약 
					" />
					</p>	
						
				</div>	 
				<!--//끝-->
			
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"></td>
						<td class="contact_team"><strong>담당부서 : </strong>기획조정처 홍보팀</td>
						<td class="contact_user"><strong>담당자 : </strong>고유나</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2228</td>
					</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer end -->
			
		</div>
	</div>
	
	</div>
	
	<!--// footer: start //-->
	<%@include file="/include/comfooter.jsp"%>	
	<!--// footer: end //-->
	
	</div>
	
</body>
</html>