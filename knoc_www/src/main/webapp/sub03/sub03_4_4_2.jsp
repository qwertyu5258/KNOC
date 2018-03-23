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
                    &gt; <span class="locanow">국제공동비축사업</span>
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
							<li><a href="/sub03/sub03_4_4_1.jsp"><img src="/images/new_sub/oil_tab03.gif" alt="동적비축" /></a></li>
							<li><a href="/sub03/sub03_4_4_2.jsp"><img src="/images/new_sub/oil_tab04_on.gif" alt="국제공동비축사업" /></a></li>
							<li><a href="/sub03/sub03_4_4_3.jsp"><img src="/images/new_sub/oil_tab05.gif" alt="석유트레이딩" /></a></li>
						</ul>
					</div>
					<div style="clear:both ; height:20px ;"></div>

					<h5 class="mT0">국제공동비축사업</h5>
                    <p>한정된 예산 하에서 재정부담 없이 비축수준을 제고하기 위하여 1999년부터 공사의 비축시설에 산유국 등의 석유를 유치, 저장하는 국제 공동비축사업을 하고 있습니다.</p>
                    <div class="mT20"><img src="/images/business/imgin1_sub03_4_4_2.gif" alt="국제공동비축사업" />
						<ul class="blindtext">
						<li><em>공사 </em>
							<dl>
							<dt>비축시설 제공</dt>
							<dd>석유비축수준 제고로 위기 대응 능력제고</dd>
							<dd>비축유확보비용 절감 및 시설사용료 수입으로 비축의 경제성 제고</dd>
							<dd>국내정유사의 원유 도입비용 등 절감지원</dd>
							</dl>
						</li>
						<li>
							<em>산유국 </em>
							<dl>
							<dt>비축시설 제공</dt>
							<dd>동북아의 전략적 요충지인 공사 원유저장시설을 물류거점으로 활용-동북아 판매물량 증대</dd>
							<dd>잉여불량 해소를 위해 신규 시장 개혁</dd>
							</dl>
						</li>
						</ul>
					</div>
                    <p>현재 노르웨이 국영석유사인 Statoil 및 석유메이저 등과 전략적 파트너십을 통해 안정적으로 사업을 추진하고 있습니다.</p>
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
					<td class="contact_team"><strong>담당부서 : </strong>석유사업처 제품시설트레이딩팀</td>
					<td class="contact_user"><strong>담당자 : </strong>임정인</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-5128</td>
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