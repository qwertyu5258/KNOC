<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>

<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 ' Page Navigator section
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
 application.setAttribute("gNavMenuDepth1","05");
 application.setAttribute("gNavMenuDepth2","03");
 application.setAttribute("gNavMenuDepth3","07");
 application.setAttribute("gNavMenuDepth4","00");
 /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>

<%@include file="/include/comheader.jsp"%>
<script type="text/javascript">
function winopen(){ 
	window.open('http://www.knoc.co.kr/upload/EBOOK/sabo/vol1/contents/intro.html', 'NewWindow1', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,width=1024,height=980')  
	} 
</script>
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
     <a href="/"><img src="/images/common/loca_home.gif" alt="홈" /></a> 
     &gt; <span>정보마당</span> &gt; <span>사이버홍보실</span> &gt; <span class="locanow">뉴스레터 </span>
    </div>
    <!--// location: end //-->
    
    <div class="pagetle">
     <h3 class="tleimg"><img src="/images/information/ttl_sub05_2_7.gif" alt="News Letter" /></h3> 
    </div>
    <neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="newslett" adminURL="" sessionName="USERSESSION"/>

   </div>
  </div>
 </div>
 
  <%@include file="/include/comfooter.jsp"%><!--// footer: start //--> <!--// footer: end //-->
</div>
</body>
</html>