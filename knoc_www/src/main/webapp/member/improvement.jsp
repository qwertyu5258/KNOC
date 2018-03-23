<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","09");
	application.setAttribute("gNavMenuDepth2","06");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>    
<%@include file="/include/comheader.jsp"%>

  <!--// subtopNavi: start //-->
  <%@include file="/include/subtopnavi_new.jsp"%>

    <div id="contents">
        <%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
        <div id="rightarea">
            <div id="subcnts">
               <%@include file="/include/subtop_member.jsp"%>
                <!--// location: start //-->
                <div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
                    &gt; <span>기타서비스</span> &gt; <span class="locanow">홈페이지개선의견</span></div>
        <!--// location: end //-->
            
                <div class="pagetle">
                    <h3><img src="/images/member/ttl_improvement.gif" alt="홈페이지개선의견" /></h3>
                </div>
                <div class="manageQna">
               	  <p><img src="../images/member/img_improvement_01.gif" alt="여러분들의 의견에 언제나 귀를 기울이는 한국 석유공사가 되겠습니다." /></p>               	  
				  <neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="HOME" adminURL="" sessionName="USERSESSION"/>
              </div>
            </div>
      </div>
    
        <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
    </div>
</div>
</body>
</html>