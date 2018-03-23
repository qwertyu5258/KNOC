<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","08");
	application.setAttribute("gNavMenuDepth3","03");
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
                    &gt; <span class="locanow">원유회수증진</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_9_3.gif" alt="원유회수증진" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
                    회수증진을 위한 EOR 기법은 저류층 잔류 오일 포화도 혹은 오일 점성도를 낮추거나 오일과 물의 계면장력을 감소시키는 것과 주로 관련이 있습니다. 공사는 수년간의 연구개발을 통해 여러 EOR 기술을 확보하였으며, 특히 이산화탄소 주입법 연구를 위해 해외 유명 연구실과 협업하였습니다. 게다가, 공사는 비재래 혹은 오래된 유·가스전을 보유한 석유회사를 인수하여 회수증진법에 대한 풍부한 지식 및 경험을 공유하였습니다. 현재는 UAE 탄산염암 저류층 생산증진 기술개발 및 실증연구를 수행하고 있습니다.
						<br /><br />
						회수증진 기술 확보는 국가의 자주개발률 확보 및 에너지 강국으로 발돋움하기 위한 필수기술입니다.
						
						
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
						<td class="contact_user"><strong>담당자 : </strong>최영락</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-3506</td>
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