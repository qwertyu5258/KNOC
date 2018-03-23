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
							<li><a href="sub01_7_6_1.jsp"><img src="/images/info/sub01_7_6_2.gif" alt="현장기술직" border="0" id="his_button2"/></a></li>
							<li><a href="sub01_7_6_2.jsp"><img src="/images/info/sub01_7_6_3r.gif" alt="신입직" border="0" id="his_button3"/></a></li>
							<li><a href="sub01_7_6_3.jsp"><img src="/images/info/sub01_7_6_4.gif" alt="전문/경력직" border="0" id="his_button4"/></a></li>
							<li><a href="sub01_7_6_4.jsp"><img src="/images/info/sub01_7_6_5.gif" alt="병역특례 전문연구요원" border="0" id="his_button5"/></a></li>
						</ul>						
						<h4 class="pt20"><img src="/images/info/sub01_7_6_1ta2_1.gif" alt="신입직" /></h4>
						<div class="guide2">
							<table class="chart1" summary="신입직 채용안내 세부사항을 확인할 수 있습니다.">
								<caption>신입직 채용안내</caption>
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
										<th scope="row" class="first">1차</th>
										<td>필기고시(전공)</td>
										<td class="tdleft">어학성적(TOEIC, TOEFL, TEPS,OPIc,Toeic-speaking) <br/>기준점수 이상자 전원 필기전형 응시기회 부여
<br />	지원분야 4년제 대학졸업 수준</td>
									</tr>
									<tr>
										<th scope="row" class="first">2차</th>
										<td>프리젠테이션면접<br />
OPIc 시험<br />인.적성검사</td>
										<td class="tdleft">주제에 대한 논리전개 및 발표력<br/>
2차전형자 전원 OPIC시험</td>
									</tr>
									<tr>
										<th scope="row" class="first">3차</th>
										<td>종합면접</td>
										<td class="tdleft">지원자 자질 및 공사 핵심가치와의 <br />
											부합성 등
										</td>
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