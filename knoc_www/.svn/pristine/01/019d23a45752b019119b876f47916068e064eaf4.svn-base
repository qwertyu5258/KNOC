<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","07");
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
					&gt; <span>재무현황</span>
                    &gt; <span class="locanow">채무보증</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_3.gif" alt="재무현황" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<h4><img src="/images/management/sub02_2_3_3_ta1.gif" alt="채무보증" border="0"/></h4>
					<p class="ctxt"><strong>타법인에 대한 채무보증 현황</strong></p>
					<!--표-->
					<table class="chart2" summary="타법인에 대한 채무보증 현황을 확인할 수 있습니다.">
					<caption>타법인에 대한 채무보증 현황</caption>
					<col width="150px" />
					<col width="450px" />
					<thead>
					<tr>
					<th scope="col" class="first">채무자</th>
					<th scope="col">Harvest Operations Corp.</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td class="first">관계</td>
						<td>종속기업</td>
					  </tr>
					<tr>
						<td class="first">채권자</td>
						<td>-</td>
					  </tr>
					<tr>
						<td class="first">채무보증잔액(단위:백만원)</td>
						<td>738,360</td>
					  </tr>
					<tr>
						<td class="first">채무보증기간</td>
						<td>2013-05-14~2018-05-14</td>
					  </tr>
					<tr>
						<td class="first">비고</td>
						<td>채권발행지급보증(12.6%)</td>
					  </tr>
					</tbody>
					</table>
                    
                    <table class="chart2" summary="타법인에 대한 채무보증 현황을 확인할 수 있습니다.">
					<caption>타법인에 대한 채무보증 현황</caption>
					<col width="150px" />
					<col width="450px" />
					<thead>
					<tr>
					<th scope="col" class="first">채무자</th>
					<th scope="col">Harvest Operations Corp.</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td class="first">관계</td>
						<td>종속기업</td>
					  </tr>
					<tr>
						<td class="first">채권자</td>
						<td>Canadian Imperial Bank of Commerce 등</td>
					  </tr>
					<tr>
						<td class="first">채무보증잔액(단위:백만원)</td>
						<td>844,543</td>
					  </tr>
					<tr>
						<td class="first">채무보증기간</td>
						<td>2015-04-22~2017-04-30</td>
					  </tr>
					<tr>
						<td class="first">비고</td>
						<td>은행여신지급보증</td>
					  </tr>
					</tbody>
					</table>
					<div style="text-align:left ; padding-left:20px ; font-size:11px ; letter-spacing:-1px ; color:#777 ;">
					* 공시기준 : ‘15년 12월말 기준 <BR />
					</div>
					<!--//표-->

				</div>
				<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2015-12-31</td>
							<td class="contact_team"><strong>담당부서 : </strong>재무처 회계팀</td>
							<td class="contact_user"><strong>담당자 : </strong>이가희</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2459</td>
						</tr>
					</tbody>
				</table>
				</div>
				<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="DEBT" adminURL="" sessionName="USERSESSION"/>
										
				<div class="infoCheck"><div style="clear:both ; height:20px ;"></div><%@include file="/include/satisfy_link.jsp"%></div>					
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>