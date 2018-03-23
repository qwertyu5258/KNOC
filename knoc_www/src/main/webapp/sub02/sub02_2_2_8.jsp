<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","09");
	application.setAttribute("gNavMenuDepth4","20");
//	application.setAttribute("gNavMenuDepth3","02");
//	application.setAttribute("gNavMenuDepth4","09");	
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
                    &gt; <span>경영공시</span>
					&gt; <span>주요사업 및 경영성과</span>
                    &gt; <span class="locanow">시추선 조업일수 및 가동률</span>
				</div>
				<!--// location: end //-->

				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_3_new.gif" alt="주요사업 및 경영성과" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<h4><img src="/images/management/sub02_2_3_5_ta1.gif" alt="시추선 조업일수 및 가동률"/></h4>
					<div><img src="/images/management/img_sub02_2_3_5_20150501.gif" alt="시추선 조업일수 및 가동률 그래프" />
						<ul class="blindtext">
							<li>
								<dl>
									<dt>2004년</dt>
									<dd>조업일수 : 293일 </dd>
									<dd>가동률 : 80%</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>2005년</dt>
									<dd>조업일수 : 358일 </dd>
									<dd>가동률 : 98%</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>2006년</dt>
									<dd>조업일수 : 297일 </dd>
									<dd>가동률 : 81%</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>2007년</dt>
									<dd>조업일수 : 365일 </dd>
									<dd>가동률 : 100%</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>2008년</dt>
									<dd>조업일수 : 294일 </dd>
									<dd>가동률 : 81%</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>2009년</dt>
									<dd>조업일수 : 330일 </dd>
									<dd>가동률 : 90%</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>2010년</dt>
									<dd>조업일수 : 337일 </dd>
									<dd>가동률 : 93%</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>2011년</dt>
									<dd>조업일수 : 281일 </dd>
									<dd>가동률 : 77%</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>2012년</dt>
									<dd>조업일수 : 45일 </dd>
									<dd>가동률 : 12%</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>2013년</dt>
									<dd>조업일수 : 317일 </dd>
									<dd>가동률 : 87%</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>2014년</dt>
									<dd>조업일수 : 330일 </dd>
									<dd>가동률 : 90%</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>2015년</dt>
									<dd>조업일수 : 244일 </dd>
									<dd>가동률 : 67%</dd>
								</dl>
							</li>
						</ul>
					</div>
			  </div>
			<br />
			<div style="margin:0 ; padding:0 ; padding-left:20px ; text-align:left ; font-size:12px ;  color:#606060 ; clear:both ;">
							※ 조업일수 : 조업계약을 통해 용선수익이 발생하는 기간을 의미<br />
							※ 가동률 : 조업일수/365일<br />
							※  2012년 무조업 기간 중 두성호 조선소 입거 및 성능개선 공사 수행
			</div>


			<div class="new_officer">
			<table summary="담당부서 및 연락처 관리일">
			<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2016-11-23</td>
						<td class="contact_team"><strong>담당부서 : </strong>탐사사업처 리그사업팀</td>
						<td class="contact_user"><strong>담당자 : </strong>이성무</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-3108</td>
					</tr>
				</tbody>
			</table>
			</div>

			  <!--div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div-->
				<!--//끝-->
			</div>
		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>