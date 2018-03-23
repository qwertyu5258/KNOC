<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","18");
	application.setAttribute("gNavMenuDepth3","00");
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
				<%@include file="/include/subtop_05.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>정보마당</span> 
					&gt; <span>사업실명제</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3 class="tleimg" style="margin-top:-2px ;"><img src="/images/information/n_img_sub5/ttl_sub05_14.gif" alt="사업실명제" /></h3>
				</div>
				<div class="information">
					<h4 class="mT0 pb10"><img src="/images/information/n_img_sub5/ttl_sub05_14_txt1.gif" alt="사업실명제란 사업의 지속성 및 책임성 확보를 위해 사업을 공개하는 제도입니다." /></h4>
					<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="REALBUSI" adminURL="" sessionName="USERSESSION"/>
				</div>
			</div>
			
			<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"></td>
						<td class="contact_team"><strong>담당부서 : </strong>기획조정처 기획관리팀</td>
						<td class="contact_user"><strong>담당자 : </strong>황자영</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2208</td>
					</tr>
				</tbody>
				</table>
			</div><!-- new_officer end -->
			
			<div class="new_officer mT10">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"></td>
						<td class="contact_team"><strong>담당부서 : </strong>기획조정처 기획관리팀</td>
						<td class="contact_user"><strong>담당자 : </strong>박종일</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2212</td>
					</tr>
				</tbody>
				</table>
			</div><!-- new_officer end -->
			
		</div>
	</div>
	
  <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>