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
	application.setAttribute("gNavMenuDepth4","02");
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
	        <td class="lnb_area">
			<!-- leftmenu -->
			<%@ include file="../include/leftmenu.jsp" %>
			<!-- //leftmenu -->
			</td>
			<td width="30">&nbsp;</td>
			<td valign="top">
			<table class="con_wrap" border="0" cellspacing="0" cellpadding="0">								
			  <tr>
				<td><!-- contimg --><%@ include file="../include/contimg02.jsp" %></td>
			  </tr>
	          <tr>
	            <td height="34" align="right"><img src="../images/ico_home.gif" alt="home" /> &gt; Corporate Responsibility  &gt; Sustainable Management &gt; Sustainable Report &gt; <span class="loca_text"> report</span></td>
	          </tr>
	           <tr>
	            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub02/ttl_sub02_1_6_2.gif" alt="report" /></td>
	          </tr>
	           <tr>
	            <td height="30"></td>
	          </tr>
	           <tr>
	            <td height="30" align="center">
	            <neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="EREPORT" adminURL="" sessionName="USERSESSION"/>
	            </td>
	          </tr>     
	          <tr>
	                  	<td>
	<div style="height:20px ;"></div>
	<div class="new_officer">
		<table summary="Department Contacts Updated">
		<caption>Department Contacts Updated</caption>  
		<tbody>
		    <tr>
		    	<td class="write_day"><!-- strong>Updated : </strong>2016-04-05--></td>
		        <td class="contact_team"><strong>Department : </strong>Planning &amp; Coordination Dept.</td>
		        <td class="contact_tel"><strong>Contacts : </strong>+82)52-216-2208</td>																        
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