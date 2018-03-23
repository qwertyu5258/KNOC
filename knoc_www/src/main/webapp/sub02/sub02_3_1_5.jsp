<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","03");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","05");
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
					&gt; <span>사회공헌</span>
					&gt; <span>사회공헌</span>
                    &gt; <span class="locanow">슬로건/심벌</span>
				</div>
				<!--// location: end //-->
				
				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_3_1_5.gif" alt="슬로건/심벌" /></h3>
				</div>
				<!--시작-->
				<div class="simbol">
					<div>
						<div>
							<h4><img src="/images/management/h4_simbol.gif" alt="심볼마크" /></h4>
							<p><img src="/images/management/img_simbol.gif" alt="KNOC 한국석유공사 봉사단 심볼마크" /></p>
						</div>
						<div class="mL10">
							<h4><img src="/images/management/h4_slogan.gif" alt="슬로건" /></h4>
							<p><img src="/images/management/img_slogan.gif" alt="석유는 우리가 봉사도 우리가! 석유의 꿈과 희망을 이웃과 함께!" /></p>
						</div>
					</div>
				</div>
				<!--//끝-->
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"><strong>작성기준일 : </strong>2016-11-25</td>
							<td class="contact_team"><strong>담당부서 : </strong>총무관리처 상생지원팀</td>
							<td class="contact_user"><strong>담당자 : </strong>이종찬</td>
							<td class="contact_tel"><strong>연락처 : </strong>052-216-2626</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>