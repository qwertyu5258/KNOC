<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","08");
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
				<%@include file="/include/subtop_03.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>사업소개</span>
                    &gt; <span>기술개발</span>
                    &gt; <span class="locanow">이산화탄소 지중저장</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_9_5.gif" alt="이산화탄소 지중저장" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
                   		CCS (Carbon Capture and Storage)는 발전소, 제철소 및 대규모 사업장 등에서 화석 연료의 연소를 통해 발생하는 이산화탄소를 포집, 수송 및 저장하는 기술로서, 이산화탄소의 대기 중 농도를 저감함으로써 기후변화에 적극적으로 대처할 수 있는 방법입니다. 공사는 정부의 적극적인 추진의지와 미래 사업으로서의 가능성을 바탕으로 2010년부터 CCS 분야의 국책 연구과제를 수행중에 있습니다.
						<br /><br />
						공사는 그 동안 석유자원 탐사 및 개발 분야에서 쌓아온 기술력을 바탕으로 이산화탄소 지중저장의 G&G분야, 석유공학 및 플랫폼 탑사이드 설계 분야 기술개발에 주도적인 역할을 담당하고 있습니다. 현재 주요 연구과제로 국내 해양분지를 대상으로 한 지중저장소 탐사 및 저장용량 평가 연구와 국내 육상 유력 저장소에 대한 이산화탄소 거동 예측을 수행하였으며, 캐나다 CCS 통합실증 프로젝트에 참여를 통하여 CCS 실증을 위한 기술 및 경험에 대한 벤치마킹을 수행하였고, 2013년부터 포항분지 소규모 실증 국책 연구 과제를 수행하고 있습니다.이로부터, 향후 2020년부터 지중저장 상용화 수행을 계획 중에 있습니다.
						<br /><br />
						공사는 이산화탄소 저장기술을 통하여 온실가스를 감축할 수 있는 “차세대 성장 동력”을 확보하고자 기술개발에 매진하고 있으며, 더불어 이산화탄소의 주요 발생원 중 하나인 탄화수소 연료의 개발을 목적으로 하고 있는 국영기업으로서 이산화탄소의 저감에 이바지하는 것은 기업의 책임과 사회공헌의 측면에서 큰 의미가 있습니다.
				<div style="height: 30px;"></div>
				</div>
				<!--//끝-->

				<!-- new_officer -->
				<div class="new_officer" style="left:2%">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-08-20</td>
						<td class="contact_team"><strong>담당부서 : </strong>기술개발처 기술총괄팀</td>
						<td class="contact_user"><strong>담당자 : </strong>김용헌</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-3504</td>
					</tr>
					</tbody>
					</table>
				</div>
				<!-- new_officer -->
			</div>
		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>