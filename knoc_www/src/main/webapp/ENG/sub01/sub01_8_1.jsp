<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","04");
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
	        <td class="lnb_area">
			<!-- leftmenu -->
			<%@ include file="../include/leftmenu.jsp" %>
			<!-- //leftmenu -->
			</td>
	        <td width="30">&nbsp;</td>
	        <td valign="top">
	        <table class="con_wrap" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><!-- contimg --><%@ include file="../include/contimg01.jsp" %></td>
	          </tr>
	          <tr>
	            <td height="34" align="right"><p><img src="../images/ico_home.gif" alt="home" /> &gt; About Us &gt;Company Culture &gt;<span class="loca_text">  The Seven Managerial Principles  </span> </td>
	          </tr>
	           <tr>
	            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub01/ttl_sub08_01.gif" alt="The Seven Managerial Principles" width="206" height="25" /></td>
	          </tr>
	           <tr>
	            <td height="40" align="center">&nbsp;</td>
	          </tr>
	          <tr>
	            <td align="center" valign="top">
	                <table class="contents" width="720" border="0" cellspacing="0" cellpadding="0">
	                  <tr>
	                    <td><h3><img src="../images/sub01/sub01_08_1.gif" alt="The Seven Managerial Principles" /></h3>
	                    <p style="padding:10px 0 0 10px;" >Our Business Principles are the governing principles Which KNOC always lives by in conducting every business</p> </td>
	                  </tr>
	                    <tr>
	                    <td style="padding:20px 0 0 10px;"><img src="../images/sub01/sub01_08_img01.gif" 
	                    alt="Accomplish sustainable growth through change and innovation.
	                    Place a high value on sincere performance and create new values.
	                   Encourage creativity and provide various opportunities for developing human resources. 
	 				   Strengthen R&D capabilities and acquire leading-edge technologies.
	 				   Provide an inclusive, respectful, work-frendly environment.
	 				   Comply with the law and observe ethical standards.
	                    " /></td>
	                  </tr>  
	                  <tr>
	                    <td height="30">&nbsp;</td>
	                  </tr>
	                  <tr>
	                  	<td>
	<div style="height:20px ;"></div>
	<div class="new_officer">
		<table summary="Department Contacts Updated">
		<caption>Department Contacts Updated</caption>  
		<tbody>
		    <tr>
		    	<td class="write_day">&nbsp;</td>
		        <td class="contact_team"><strong>Department : </strong>Planning &amp; Coordination Dept.</td>
		        <td class="contact_tel"><strong>Contacts : </strong>+82)52-216-2228</td>	        
		    </tr>
		</tbody>
		</table>
	</div><!-- new_officer end -->                  	
	                  	</td>
	                  </tr>
	                </table>
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
