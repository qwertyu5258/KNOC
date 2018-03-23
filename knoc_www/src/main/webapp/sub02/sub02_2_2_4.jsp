<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","07");
	application.setAttribute("gNavMenuDepth4","06");
//	application.setAttribute("gNavMenuDepth3","02"); 경영공시 메뉴개편
//	application.setAttribute("gNavMenuDepth4","04");
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
					&gt; <span>일반현황</span>
                    &gt; <span class="locanow">성장전망</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-10-23 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_1.gif" alt="일반현황" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
                	<h4><img src="/images/management/sub02_2_1_11_ta1.gif" alt="성장전망"/></h4>   
					<p class="officer1">향후 5개년 성장전망(2016~2020)</p>
					<!--표-->  
					<table class="chart2" summary="주요전략지표의 향후 5개년 성장전망을 년별로로 보여줍니다.">
						<caption>향후 5개년 성장전망(2016~2020) 년별 표</caption>
						<colgroup>
							<col width="250px" />
							<col width="70px" />
							<col width="70px" />
							<col width="70px" />
							<col width="70px" /> 
							<col width="70px" />
						</colgroup>   
						<thead> 
							<tr>   
								<th scope="col" class="first">구분</th>
								<th scope="col">2016년</th>
								<th scope="col">2017년</th>
								<th scope="col">2018년</th>
								<th scope="col">2019년</th>
								<th scope="col">2020년</th>
							</tr>
						</thead>  
						<tbody>

							<tr>
								<td class="first">일생산량(만b/d)</td>
								<td>20.9</td>
								<td>18.8</td>
								<td>19.2</td>
								<td>20.8</td>
								<td>20.4</td>
							</tr>
							
							<tr>
								<td class="first">비축물량(백만배럴)</td>
								<td>93.7</td>
								<td>95.7</td>
								<td>96.4</td>
								<td>97.4</td>
								<td>99.5</td>
							</tr>
							<tr>
								<td class="first">트레이딩물량<sup style="font-size:14px;">*</sup>(백만배럴)</td>
								<td>15.1</td>
								<td>15.5</td>
								<td>16.0</td>
								<td>16.8</td>
								<td>17.3</td>
							</tr>

						</tbody>
					</table>
					<!--//표-->
					<p> * 자회사 직접마케팅 추진에 따라 해외 생산원유마케팅 물량 제외</p>
				</div>

				<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-10-12</td>
							<td class="contact_team"><strong>담당부서 : </strong>기획조정처 전략경영팀</td>
							<td class="contact_user"><strong>담당자 : </strong>노진평</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2247</td>
						</tr>
					</tbody>
				</table>
				</div>			
				
				<!-- div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div-->
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>
