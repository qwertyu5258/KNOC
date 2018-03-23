<%@ page language="java" contentType="text/html; charset=EUC-KR"

    pageEncoding="EUC-KR"%>

<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    

<% 

    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

	' Page Navigator section

	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/

	application.setAttribute("gNavMenuDepth1","02");

	application.setAttribute("gNavMenuDepth2","02");

	application.setAttribute("gNavMenuDepth3","08");

	application.setAttribute("gNavMenuDepth4","07");	
	
//	application.setAttribute("gNavMenuDepth3","06");

//	application.setAttribute("gNavMenuDepth4","12");

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
					&gt; <span>기관정보</span>
                    &gt; <span class="locanow">임원업무추진비</span>

				</div>

				<!--// location: end //-->

				<!--[2009-09-21 수정] :: 작성자: 장정인 -->
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_6.gif" alt="기타정보" /></h3>
				</div>

				<!--시작-->
				<jsp:include page="/sub02/sub02_2_6_12_3_contents.jsp" flush="true"/>
			  	<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="IMW" adminURL="" sessionName="USERSESSION"/>
				<div style="height:20px;"></div>
				<!--div class="infoCheck" style="margin-left:20px ;"><%@include file="/include/satisfy_link.jsp"%></div-->

		</div>
	</div>
	
	</div>
	
	<!--// footer: start //-->
	<%@include file="/include/comfooter.jsp"%>	
	<!--// footer: end //-->
	
	</div>

</body>
</html>