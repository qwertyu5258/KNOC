<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","06");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","05");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>   

<%@ include file="../include/topmenu.jsp" %>
<!-- topmenu end -->


<!-- contents -->
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
            <td><!-- contimg --><%@ include file="../include/contimg06.jsp" %></td>
          </tr>
          <tr>
            <td height="34" align="right"><p><img src="../images/ico_home.gif" alt="home" /> &gt; E&amp;P Technology  Institute &gt; Institute Information &gt;<span class="loca_text"> Map&#13;</span></td>
          </tr>
           <tr>
            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub06/sub6_title06.gif" alt="Map" /></td>
          </tr>
           <tr>
            <td height="40" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" valign="top"><img src="../images/sub06/sub06_1_5_img01.gif" width="680" height="407" alt="" /></td>
          </tr>
            <tr>
            <td height="30" >&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<!-- contents end-->

<!-- footer -->
<%@ include file="../include/copyright.jsp" %>
<!-- footer end-->


</body>
</html>
