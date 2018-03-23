<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","08");
	application.setAttribute("gNavMenuDepth3","04");
	application.setAttribute("gNavMenuDepth4","02");
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
				<%@include file="/include/subtop_07.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>어린이</span>
                    &gt; <span>석유놀이터</span>
                    &gt; <span class="locanow">석유놀이방</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/child/ttl_sub07_4_2.gif" alt="석유놀이방" /></h3>
				</div>
				<!--시작-->
				<div id="substar">
                	<ul class="tab">
                    <li><a href="sub05_8_4_2_1.jsp"><img src="/images/child/tab_sub07_4_2_1.gif" alt="색칠하기"/></a></li>
					<li><a href="sub05_8_4_2.jsp"><img src="/images/child/tab_sub07_4_2_2r.gif" alt="석유퍼즐"/></a></li>
					<li><a href="sub05_8_4_2_2.jsp"><img src="/images/child/tab_sub07_4_2_3.gif" alt="석유영상실"/></a></li>
					</ul>
					<!-- <dl>
						<dt class="text"><img src="/images/child/tab_sub07_4_3_1.gif" alt="석유퀴즈에 도전해보세요" /></dt>
						<dd>퀴즈는 회원가입 후 응모하실 수 있습니다. 
지금 바로 석유어린이단 친구가 되어주세요.<img src="/images/child/btn_join_b.gif" alt="회원가입" align="top"/> </dd>
					</dl>-->					
                </div>
                <neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="PERSLE" adminURL="" sessionName="USERSESSION"/>
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>