<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","01");
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
	            <td><!-- contimg --><%@ include file="../include/contimg01.jsp" %></td>
	          </tr>
	          <tr>
	            <td height="34" align="right"><p><img src="../images/ico_home.gif" alt="home" /> &gt; About Us &gt; &gt;Corporate  Culture &gt;<span class="loca_text"> Corporate Culture </span></td>
	          </tr>
	           <tr>
	            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub01/ttl_sub01_2_1.gif" alt="" width="116" height="24" /></td>
	          </tr>
	           <tr>
	            <td height="40" align="center">&nbsp;</td>
	          </tr>
	          <tr>
	            <td align="center" valign="top">
	                <table class="contents" width="720" border="0" cellspacing="0" cellpadding="0">
	                  <tr>
	                    <td align="center"><img src="../images/sub01/2_1_culture01.gif" alt="corporate culture" width="628" height="466" /></td>
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
		<colgroup>
			<col width="auto" />
			<col width="25%" />
			<col width="22%" />
		</colgroup>
		<tbody>
			<tr>
				<td><strong>Department : </strong>Office of the President</td>
				<td><strong>Contacts : </strong>+82)31-380-2157</td>
				<td><strong>Updated : </strong>2015-09-30</td>
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
	<!-- contents end-->
</div>
<!-- footer -->
<%@ include file="../include/copyright.jsp" %>
<!-- footer end-->

</body>
</html>
