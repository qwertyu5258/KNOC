<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","04");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","03");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%@include file="/include/comheader.jsp"%>


<!--// subtopNavi: start //-->
<%@include file="/include/subtopnavi_new.jsp"%>
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
                    &gt; <span>석유비축 및 유통구조개선사업</span>
                    &gt; <span>알뜰주유소</span>
                    &gt; <span class="locanow">운영현황</span>
				</div>
				<!--// location: end //-->

				<!-- [2009-09-24 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/business/ttl_sub03_8_1_3.gif" alt="운영현황" /></h3>
				</div>
				<!--시작-->
                <div class="cont_2012">
                	<ul class="egs_ea">
					<li><img src="/images/business/cs_01.png" alt="자영 443" /></li>
					<li><img src="/images/business/cs_02.png" alt="도로공사 167" /></li>
					<li><img src="/images/business/cs_03.png" alt="농협NH 558" /></li>
					</ul>
					<p class="egs_total"><img src="/images/business/cs_total.png" alt="계 1,168 (9.7%)" /></p>
					<!-- <p class="egs_txt">* ‘12.11.23일 전국 알뜰주유소 총 800개소 돌파</p>  -->
					<p class="egs_obj"><img src="/images/business/cs_obj.gif" alt="정책목표 - 전체주유소의 10%" /></p>
                </div><!-- cont_2012 end -->
				<!--//끝-->
		  </div>

		  <!-- new_officer -->
			<div class="new_officer" style="left:2%">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
				<tr>
					<td class="write_day"><strong>작성기준일 : </strong>2017-01-03</td>
					<td class="contact_team"><strong>담당부서 : </strong>유통사업처 유통사업팀</td>
					<td class="contact_user"><strong>담당자 : </strong>이승용</td>
					<td class="contact_tel"><strong>연락처 : </strong>052-216-5202</td>
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