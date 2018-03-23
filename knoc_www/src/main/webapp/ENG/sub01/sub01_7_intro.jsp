<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
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
	        <td class="lnb_area">
			<!-- leftmenu -->
			<%@ include file="../include/leftmenu.jsp" %>
			<!-- //leftmenu -->
			</td>
	        <td width="30">&nbsp;</td>
	        <td valign="top">
	        <table border="0" cellspacing="0" cellpadding="0" class="con_wrap">	
	          <tr>
	            <td><!-- contimg --><%@ include file="../include/contimg01.jsp" %></td>
	          </tr>
	          <tr>
	            <td height="34" align="right"><p><img src="../images/ico_home.gif" alt="home" /> 
	            &gt; About Us <span class="loca_text"> &gt; Company Culture </span></td>
	          </tr>
	           <tr>
	            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub01/ttl_sub07_00.gif" alt="Company Culture" width="111" height="23" /></td>
	          </tr>
	           <tr>
	            <td height="40" align="center">&nbsp;</td>
	          </tr>
	          <tr>
	            <td align="center" valign="top">
	                <table class="contents" border="0" cellspacing="0" cellpadding="0">
	                    <tr>
	                    <td style="padding:10px 0 0 10px;">
	                    	<div class="cul_intro">
	                            <p class="blindtext">Click the icon to see a detail content</p>
	                            <ul>
	                            <li class="cul_link01"><a href="sub01_9_2.jsp"><span class="blindtext">KNOC WAY - WORK</span></a></li>
	                            <li class="cul_link02"><a href="sub01_7_1.jsp"><span class="blindtext">MISSION - Our Mission is to provide hope and comfort for the people through stable oil supply</span></a></li>
	                            <li class="cul_link03"><a href="sub01_8_1.jsp"><span class="blindtext">The Seven Managerial Principles - BUSINESS</span></a></li>
	                            <li class="cul_link04"><a href="sub01_7_2.jsp"><span class="blindtext">VISION - Creating Value Beyond Energy</span></a></li>
	                            <li class="cul_link05"><a href="sub01_9_1.jsp"><span class="blindtext">Core values</span></a></li>
	                            </ul>
	                        </div>
	                    </td>
	                  </tr>                
	               
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