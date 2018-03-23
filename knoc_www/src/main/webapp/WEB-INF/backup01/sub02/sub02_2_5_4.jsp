<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","05");
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
				<%@include file="/include/subtop_02.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>열린경영</span>
                    
					&gt; <span>경영공시</span>
					
					&gt; <span>내·외부평가</span>
                    
					&gt; <span class="locanow">경영실적 평가결과</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_5_1.gif" alt="내·외부평가" /></h3>
				</div>

				<div class="officer">
					<h4><img src="/images/management/sub02_2_5_5_ta01.gif" alt="정부(기관,기관장) 경영평가결과 "/></h4>
				</div>
				<iframe src="sub02_2_5_4_1.jsp" width="100%" height="320" frameborder="0" scrolling="no"></iframe>

				<div class="officer">
					<h4><img src="/images/management/sub02_2_5_5_ta02.gif" alt="정부경영평가지적사항 "/></h4>
					
				</div>				
				<iframe src="sub02_2_5_4_2.jsp" width="100%" height="320" frameborder="0" scrolling="no"></iframe>
				
				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
						<tbody>
							<tr>
								<td class="write_day"></td>
								<td class="contact_team"><strong>담당부서 : </strong>기획조정처 경영평가팀</td>
								<td class="contact_user"><strong>담당자 : </strong>김연정</td>
								<td class="contact_tel"><strong>연락처 : </strong>052-216-2256</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="infoCheck"><div style="clear:both ; height:20px ;"></div><%@include file="/include/satisfy_link.jsp"%></div>				
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>