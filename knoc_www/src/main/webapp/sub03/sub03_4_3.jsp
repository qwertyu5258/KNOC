<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","04");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","03");
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
                    &gt; <span>석유비축사업</span>
                    &gt; <span class="locanow">비축기지운영현황</span>
				</div>
				<!--// location: end //-->

				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_4_3.gif" alt="비축기지운영현황" /></h3>
				</div>
				<!--시작-->
				<div class="business2">
                    <p class="contTop">2016년 9월말 기준 9개 비축기지를 운영중에 있으며 총 146백만배럴의 규모의 비축시설과 94백만배럴(공동비축물량 제외)의 비축유를 확보하고 있습니다.</p>
                    <div><img src="../images/business/img_sub03_4_3.gif" alt="비축기지 운영현황도" />
						<ul class="blindtext">
						<li>
							<dl>
								<dt>구리지사[제품기지]</dt>
								<dd>- 1981년 개소 지하공동</dd>
								<dd>- 저장용량 : 3백만B</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>용인지사[제품기지]</dt>
								<dd>- 1988년 개소 지상탱크</dd>
								<dd>- 저장용량 : 2.5백만B</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>평택지사[LPG기지]</dt>
								<dd>- 1989년 개소 지하공동</dd>
								<dd>- 저장용량 : 6.2백만B</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>동해지사[제품기지]</dt>
								<dd>- 2000년 개소 지상탱크</dd>
								<dd>- 저장용량 : 1.1백만B</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>서산지사[원유]</dt>
								<dd>- 2005년 개소 지상탱크</dd>
								<dd>- 저장용량 : 11백만B(원유), 3.6백만B(제품)</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>곡성지사[제품기지]</dt>
								<dd>- 1999년 개소 지상탱크</dd>
								<dd>- 저장용량 : 2.1백만B</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>여수지사[원유]</dt>
								<dd>- 1998년 개소 지상탱크&amp;지하공동</dd>
								<dd>- 저장용량 : 49.7백만B</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>거제지사[원유]</dt>
								<dd>- 1985년 개소 지하공동</dd>
								<dd>- 저장용량 : 47.5백만B</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>울산지사[원유]</dt>
								<dd>- 1981년 개소 지상탱크</dd>
								<dd>- 저장용량 : 19.3백만B</dd>
							</dl>
						</li>
						</ul>
					</div>
                </div>
				<!--//끝-->
			</div>

			<!-- new_officer -->
			<div class="new_officer" style="left:2%">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"><strong>작성기준일 : </strong>2016-11-10</td>
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