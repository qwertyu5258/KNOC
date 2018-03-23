<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
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
	            <td><!-- contimg --><%@ include file="../include/contimg05.jsp" %></td>
	          </tr>
	          <tr>
	            <td height="34" align="right"><img src="../images/ico_home.gif" alt="home" /> &gt; Service &gt; <span class="loca_text"> Webzin</span></td>
	          </tr>
	           <tr>
	            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub05/ttl_sub05_7.gif" alt="Webzin" width="51" height="24" /></td>
	          </tr>
	           <tr>
	            <td height="40" align="center">&nbsp;</td>
	          </tr>
	          <tr>
	            <td align="center" valign="top">
					<neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="ENWZ" adminURL="" sessionName="USERSESSION"/>
				</td>
	          </tr>
	          <tr>
	                  	<td>
	<div style="height:20px ;"></div>
	
	<div class="new_officer">
		<table summary="Department Contacts Updated">
		<caption>Department Contacts Updated</caption>
		<colgroup>
			<col width="auto" />
			<col width="25%" />
			<col width="22%" />
		</colgroup>
		<tbody>
			<tr>
				<td><strong>Department : </strong>Corporate Coordination</td>
				<td><strong>Contacts : </strong>+82)52-216-2231</td>
				<td>&nbsp;</td>
			</tr>
		</tbody>
		</table>
	</div><!-- new_officer end -->                  	
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
