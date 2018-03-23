<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","12");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","01");
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
				<%@include file="/include/subtop_12.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>인재개발센터</span>
                    &gt; <span>센터소개</span>
                    &gt; <span class="locanow">센터장 인사말씀</span>
				</div>
				<!--// location: end //-->


				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_1_5.gif" alt="센터장 인사말씀" /></h3>
				</div>
				<!--시작-->
				<div class="center_greetings">
					<div class="area">
						<div class="bline">
							<h4>국가 석유개발과 비축의 미래, 석유가스 인재개발센터가 책임지겠습니다.</h4>
							<p>안녕하십니까! 21세기에도 석유가스자원이 세계 산업발전의 핵심역할을 하고 있는 가운데, 자원 확보를 위한 경쟁은 심화되고 유가는 급변하고 있습니다. 대한민국 산업이 보다 멀리 도약하기 위해 석유가스자원을 안정적으로 공급할 수 있는 기업의 역할이 절실한 때입니다.</p>
							<p>한국석유공사는 국가의 안정적인 석유 수급 및 국민경제 발전을 위해 1979년 설립되어 국내외 석유개발사업 및 석유비축사업을 이끌어 온 국민기업입니다.</p>
							<p>해외 메이저 석유회사와의 치열한 경쟁 속에서 석유가스 자원의 탐사, 개발, 생산에 이르기까지 수년 간 경험을 통해 쌓아 올린 공사만의 값진 기술력 및 노하우는 끊임없이 도전하는 공사인의 끈기와 함께 우리 공사가 글로벌 석유기업으로 성장할 수 있었던 원동력이 되었습니다.</p>
							<p>이제 우리 공사는 석유가스 인재개발센터를 설립함으로써, 에너지 산업분야 전문인력을 체계적으로 육성하고 인적 경쟁력을 강화하여 지속 가능한 국가 성장 동력을 확보하고자 합니다.</p>
							<p>석유가스 인재개발센터에는 Global KNOC의 석유개발 및 비축 분야 전문가들이 직접 겪은 생생한 현장 경험과 지식이 축적되어 있습니다. 우리 센터는 이러한 경험과 지식을 바탕으로 실무중심의 교육을 제공함으로써 석유가스 분야의 인적 역량 강화를 돕고 나아가 국내 석유산업을 이끌어 갈 인재의 품격을 제고할 것입니다.</p>
							<p>석유가스 인재개발센터가  “글로벌 석유산업을 선도하는 세계 최고의 전문 인재” 를 육성하는 국내 유일의 석유개발, 비축 분야 교육기관으로 자리매김할 수 있도록 최선을 다하겠습니다. 감사합니다.</p>
							<p>한국석유공사 석유가스 인재개발센터장</p>
						</div>
					</div>
				</div>
				<!--//끝-->
			</div>

			<!-- new_officer -->
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
					<td class="contact_team"><strong>담당부서 : </strong>인재경영처 인재육성팀</td>
					<td class="contact_user"><strong>담당자 : </strong>백승목</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-2742</td>
				</tr>
				</tbody>
				</table>
			</div>
			<!-- new_officer -->

		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>