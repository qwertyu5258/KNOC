<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","08");
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
				<%@include file="/include/subtop_03.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>사업소개</span>
                    &gt; <span>기술개발</span>
                    &gt; <span class="locanow">기술개발 개요</span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_9_1.gif" alt="기술개발 개요" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
                    <p class="mT0">한국석유공사는 기술개발과 기술자립을 위한 중장기 기술계획을 수립하여 추진하고 있으며, 이를 바탕으로 국내외 석유개발 기술동향 조사, R&D 수요조사를 통한 R&D 로드맵 구축과 전략적인 핵심기술을 선점하기 위한 중장기 정부과제 등을 수행하고 있습니다. 또한, 국내 이산화탄소 저장소 탐사 및 자료해석, 국내 이산화탄소 저장용량 평가 연구와 이산화탄소 저장을 위한 시추/주입/사후관리 시스템 구축을 위해 E&P 자료 통합 관리, KOTIS 시스템을 운영하고 있습니다.</p>
                    <div class="mT20"><img src="../images/business/img_sub03_9_1.gif" alt="기술개발 개요" /></div>
					
					<h4><img src="../images/business/img_ttl_sub03_9_1_01.gif" alt="해외자원개발사업계획신고 심사" /></h4>
                    <p>해외자원개발사업계획신고 시 신청사의 참여 사업에 대한  기술적 타당성 검토를 수행하고 있습니다.</p>
                    
                    <h4><img src="../images/business/img_ttl_sub03_9_1_02.gif" alt="해외자원개발사업융자 심사" /></h4>
                    <p>에너지 및 자원 관련 사업을 효과적으로 추진하기 위해 정부가 설치한 에너지 및 자원사업 특별회계 예산의 융자 심의 시, 신청사의 참여 사업에 대한 기술적 타당성 검토를 수행하고 있습니다.</p>

                    
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
						<td class="contact_user"><strong>담당자 : </strong>김경복</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-3501</td>
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