<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","06");
	application.setAttribute("gNavMenuDepth4","08");
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
					&gt; <span>기타정보</span>
                    &gt; <span class="locanow">퇴직임원 취업현황</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_6.gif" alt="기타정보" /></h3>
				</div>
				<!--시작-->
				<div class="officer">
					<h4><img src="/images/management/sub02_2_1_5_ta1.gif" alt="퇴직임금 취업현황"/></h4>
					<p class="offtxt">* 최근 5년간 퇴직 후 자회사 또는 출자회사에 취업한 임원현황</p>
					<!--표-->
					<table width="100%" class="chart4" summary="한국석유공사 퇴직임원 취업현황을 확인할 수 있습니다.">
					<caption>한국석유공사 퇴직임원 취업현황</caption>
					<colgroup>
					<col width="250px" />
					<col width="*" />
                    </colgroup>
					<tbody>
					<tr>
					<th scope="row">모회사 (전 근무기관)</th>
					<td>한국석유공사</td>
			
					</tr>					
					<tr>
					<th scope="row">퇴직임원 (성명)</th>
					<td>박재익</td>
					
			
					</tr>
					<tr>
					<th scope="row">퇴직일</th>
					<td>2013.09.13</td>
					
											
					</tr>
					<tr>
					<th scope="row">재취업회사명</th>
					<td>OKYC</td>
					
										
					</tr>
					<tr>
					<th scope="row">재취업일</th>
					<td>2013. 10. 01</td>
					
															
					</tr>
					<tr>
					<th scope="row">관계 (자회사/출자회사)</th>
					<td>출자회사</td>
					<tr>
					<th scope="row">사유발생일</th>
					<td>2013. 10. 01</td>
					
		
					</tr>
					</tr>
                    
					</tbody>
					</table>
					<!--//표--><!--//표-->
				  </div>
				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<colgroup>
						<col width="auto" />
						<col width="22%" />
						<col width="22%" />
					</colgroup>
					<tbody>
						<tr>
							<td><strong>담당부서 : </strong>전략기획실 투자관리팀</td>
							<td><strong>연락처 : </strong>052-216-2367</td> 
							<td><strong>관리일 : </strong>2016-01-31</td>  
						</tr>
					</tbody>
					</table>
				</div><!-- new_officer end -->				
				<div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div>				  
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>