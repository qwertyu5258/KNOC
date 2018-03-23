<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","08");
	application.setAttribute("gNavMenuDepth2","03");
	application.setAttribute("gNavMenuDepth3","02");
	application.setAttribute("gNavMenuDepth4","02");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>       
<%@include file="/include/sub08_auth.jsp"%>   
<%@include file="/include/comheader.jsp"%>


	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
		<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_08.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>이사회</span>
					&gt; <span>경영정보</span>
                    &gt; <span>석유정보</span>
					&gt; <span class="locanow">석유</span>
				</div>
				<!--// location: end //-->
				
				<!-- <div class="pagetle">
					<h2><img src="/images/directors/ttl_sub08_3_2_2.gif" alt="석유" /></h2>
				</div>-->
				<!--시작-->
				<iframe border="0" marginwidth="0" title ="페트로넷 석유 게시판" src="http://www.petronet.co.kr/jsp/pet/cus/board_season_l.jsp" frameborder="no" width="760" height="400"></iframe>
				 <!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>