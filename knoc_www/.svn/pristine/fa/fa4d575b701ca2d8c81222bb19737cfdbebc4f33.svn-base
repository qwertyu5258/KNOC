<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","06");
	application.setAttribute("gNavMenuDepth4","01");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>   

<%@ include file="../include/topmenu.jsp" %>
<!-- topmenu end -->

<!-- contents -->
<div id="container">
	<table width="100%" height="290" border="0" cellpadding="1" cellspacing="0">
	
	  <tr>
	    <td align="center" valign="top"><table width="1000" height="124" border="0" cellpadding="0" cellspacing="0">
	      <tr>
	        <td width="180" align="right" valign="top"><!-- leftmenu --><%@ include file="../include/leftmenu.jsp" %></td>
	        <td width="40">&nbsp;</td>
	        <td valign="top">
	        <table width="760" border="0" cellspacing="0" cellpadding="0">
	         <tr>
	            <td height="30">&nbsp;</td>
	          </tr>
	          <tr>
	            <td><!-- contimg --><%@ include file="../include/contimg02.jsp" %></td>
	          </tr>
	          <tr>
	            <td height="34" align="right"><img src="../images/ico_home.gif" alt="home" /> &gt; Corporate Responsibility  &gt; Sustainable Management &gt; Sustainable Report &gt; <span class="loca_text"> e-book</span></td>
	          </tr>
	           <tr>
	            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub02/ttl_sub02_1_6_1.gif" alt="e-book" /></td>
	          </tr>
	           <tr>
	           <tr>
	            <td height="30"></td>
	          </tr>
	           <tr>
	            <td height="30" align="center">
	            <neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="ENGEBOOK" adminURL="" sessionName="USERSESSION"/>
	            </td>
	          </tr>          
	        </table></td>
	      </tr>
	    </table></td>
	  </tr>
	</table>
</div>
<!-- contents end-->

<!-- footer -->
<%@ include file="../include/copyright.jsp" %>
<!-- footer end-->

</body>
</html>
