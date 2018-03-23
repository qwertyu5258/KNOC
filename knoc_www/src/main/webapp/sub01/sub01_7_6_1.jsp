<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","06");
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
				<%@include file="/include/subtop_01.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>공사소개</span>
                    &gt; <span>채용정보</span>
                    &gt; <span class="locanow">직무소개</span>
				</div>
				<!--// location: end //-->
				
				<!-- [2009-09-15 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/info/ttl_sub01_7_6.gif" alt="채용안내" /></h3>
				</div>
				<!--시작-->
				<div class="recruit3">
					<div id="hit">
						<ul class="tab">
							<li><a href="sub01_7_6.jsp"><img src="/images/info/sub01_7_6_1.gif" alt="채용안내" border="0"  id="his_button1"/></a></li>
							<li><a href="sub01_7_6_1.jsp"><img src="/images/info/sub01_7_6_2r.gif" alt="현장기술직" border="0" id="his_button2"/></a></li>
							<li><a href="sub01_7_6_2.jsp"><img src="/images/info/sub01_7_6_3.gif" alt="신입직" border="0" id="his_button3"/></a></li>
							<li><a href="sub01_7_6_3.jsp"><img src="/images/info/sub01_7_6_4.gif" alt="전문/경력직" border="0" id="his_button4"/></a></li>
							<li><a href="sub01_7_6_4.jsp"><img src="/images/info/sub01_7_6_5.gif" alt="병역특례 전문연구요원" border="0" id="his_button5"/></a></li>
						</ul>
						<h4 class="pt20"><img src="/images/info/sub01_7_6_1ta1_1.gif" alt="현장기술직" /></h4>
						<div class="guide2">
							<table class="chart1" summary="현장기술직 채용안내 세부사항을 확인할 수 있습니다.">
								<caption>현장기술직 채용안내</caption>
								<col width="15%"/>
								<col width="25%"/>

								<thead>
									<tr>
										<th scope="col" class="first">구분</th>
										<th scope="colgroup" colspan="2">세부사항</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row" class="first">1차 서류</th>
										<td>학력 + 자격증 + 경력 등</td>
										<td></td>
									</tr>
									<tr>
										<th scope="row" class="first">2차 필기</th>
										<td>전공필기고시<br /> 적성검사<br />인성검사</td>
										<td class="tdleft">전문대학 졸업수준</td>
									</tr>
									<tr>
										<th scope="row" class="first">3차 면접</th>
										<td>PT면접<br /> 종합면접<br />OPIc test</td>
										<td class="tdleft"></td>
									</tr>
								</tbody>
							</table>
							<p class="pt10">* 2009년 채용기준(해당년도 채용지침에 따라 변경가능)</p>

						</div>
					</div>

                </div>
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>