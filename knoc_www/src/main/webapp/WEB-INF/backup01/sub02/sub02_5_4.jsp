<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","08");
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
					&gt; <span>Annual Report</span>
					&gt; <span class="locanow">Our Vision</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_5_4.gif" alt="Reaching out with passion" /></h3>
				</div>				
				
				<!--시작-->				
				<div class="annual2">
					<img src="/images/management/sub02_5_1_img05.gif" alt="빛나는 도전정신이 만들어낸 성공신화. 그 신화는 계속 이어집니다.
GREAT KNOC 3020"/>
					
<p style="margin-left:-15px;"><h4></h4>
					한국석유공사는 ‘국민에게 사랑받는 세계적 국영 석유회사’의 비전을 달성하기 위해
					‘GREAT KNOC 3020’이라는 전략목표를 수립하여 추진하고 있습니다. ‘GREAT KNOC 3020’은 Globalization, Respect, Ethics, Action, Trust의 5가지 가치 아래 2012년까지 일일 생산량 30만 배럴, 매장량 20억 배럴을 확보해 세계 60위권 글로벌 석유회사로 성장하겠다는 한국석유공사의 의지를 나타낸 것입니다<p></p>
					이를 위해 석유개발사업 부문에서는 매장량과 기술력을 증대하기 위해 해외 석유기업을 대상으로 전략적 인수?합병 및 자산매입을 실행하는 데 주력하고 있습니다. 또한 광구를 효율적으로 운영하고 탐사 성공률을 높이기 위한 경영시스템 선진화에도 많은 노력을 기울이고 있습니다.<p></p>
					석유비축사업 부문에서는 2010년 4월 정부 석유비축기지를 성공적으로 완공해 세계 최고 수준의 석유위기 대응능력을 갖추게 되었으며, 비축수준 증대와 경제성 제고를 위한 국제공동비축사업 활성화를 추진하고 있습니다. 또한 Oiltanking-KNOC를 설립해 동북아 오일허브를 구축하고자 노력하고 있습니다.
					이 외에도 새로운 성장동력인 저탄소 녹색성장 사업추진을 위해 화석연료 청정화
					분야인 GTL 기술개발사업 등의 연구개발을 진행하고 있으며, 여수와 서산 등
					비축기지에 태양광과 풍력 발전소 건설도 추진하고 있습니다.
					</p>					

					
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