<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","05");
	application.setAttribute("gNavMenuDepth4","01");
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
					<h3><img src="/images/info/ttl_sub01_7_5.gif" alt="직무소개" /></h3>
				</div>
				<!--시작-->				
				<div class="recruit3">					
					<ul class="tab">
					<li><a href="sub01_7_5.jsp"><img src="/images/info/sub01_7_5_1_1.gif" alt="전체직무소개"/></a></li>
					<li><a href="sub01_7_5_1.jsp"><img src="/images/info/sub01_7_5_1_2r.gif" alt="선배사원 인터뷰"/></a></li>
					</ul>
						<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="INTERVIE" adminURL="" sessionName="USERSESSION"/>

                </div>
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>