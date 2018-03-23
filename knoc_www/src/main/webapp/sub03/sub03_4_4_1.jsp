<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","04");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","04");
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
                    &gt; <span>석유비축 유통구조개선</span>
                    &gt; <span>경제적 비축사업추진 노력</span>
                    &gt; <span class="locanow">동적비축</span>
				</div>
				<!--// location: end //-->

				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/new_sub/ttl_sub03_4_1_02.gif" alt="경제적 비축사업추진 노력" /></h3>
				</div>
				<!--시작-->
				<div class="business2">

					<div class="oil_tab">
						<ul>
							<li><a href="/sub03/sub03_4_4_1.jsp"><img src="/images/new_sub/oil_tab03_on.gif" alt="동적비축" /></a></li>
							<li><a href="/sub03/sub03_4_4_2.jsp"><img src="/images/new_sub/oil_tab04.gif" alt="국제공동비축사업" /></a></li>
							<li><a href="/sub03/sub03_4_4_3.jsp"><img src="/images/new_sub/oil_tab05.gif" alt="석유트레이딩" /></a></li>
						</ul>
					</div>
					<div style="clear:both ; height:20px ;"></div>

					<h5 class="mT0">동적비축</h5>
                    <p class="mT5"><img src="../images/business/img_sub03_4_1_2_02.gif" alt="비축자산의 효율적 활용! 비축수준의 향상으로 가는 길입니다." /></p>
                    <p class="mT5">한국석유공사는 보다 경제적으로 비축수준을 늘리기 위해 과거 석유 안보 위주의 정적개념에서 탈피하여 전략비축 고유목적을 벗어나지 않는 범위내에서 비축자산을 운용함으로써 석유안보와 경제성을 동시에 고려하는 동적비축 개념으로 전환, 석유비축사업의 경쟁력을 제고시키고 있습니다. 향후에도 국제공동비축사업 및 비축유 트레이딩 등 비축자산의 효율적인 운용을 통하여 정부비축목표를 적기에, 보다 효율적으로 달성하기 위해 노력할 것입니다.</p>
                    <div class="mT20"><img src="/images/business/imgin1_sub03_4_4_1.gif" alt="동적 비축자산 운용" />
						<ul class="blindtext">
						<li>
							<dl>
							<dt>정적비축</dt>
							<dd>석유 안보 위주(전략비축)</dd>
							<dd>비축유:소유개념</dd>
							<dd>관리운영:정부의존</dd>
							</dl>
						</li>
						<li>
							<dl>
							<dt>동적비축</dt>
							<dd>석유안보+경제성(비축자산활용)</dd>
							<dd>비축유:보유개념 자체구입+국제공동비축</dd>
							<dd>관리운영비:자체층당</dd>
							</dl>
						</li>
						</ul>
					</div>
                    <p>동적비축 사업의 일환으로 1999년부터 산유국과의 국제공동비축 사업 및 비축유 트레이딩을 실시하고 있습니다. 이렇게 비축자산을 활용하여 발생한 수익은 비축유 증량 등에 사용함으로써 경제적이고 효율적인 비축 목표 달성에 기여하고 있습니다.</p>
                </div>
				<!--//끝-->
			</div>

			<!-- new_officer -->
			<div class="new_officer" style="left:2%">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"><strong>작성기준일 : </strong>2016-04-05</td>
					<td class="contact_team"><strong>담당부서 : </strong>석유비축처 비축관리팀</td>
					<td class="contact_user"><strong>담당자 : </strong>김현정</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-5005</td>
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