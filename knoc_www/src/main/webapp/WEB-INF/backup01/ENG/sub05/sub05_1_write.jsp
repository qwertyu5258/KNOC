<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","01");
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
	            <td height="34" align="right"><p><img src="../images/ico_home.gif" alt="home" /> &gt;Service &gt;<span class="loca_text"> News Room&#13;</span></td>
	          </tr>
	           <tr>
	            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub05/ttl_sub05_1_1.gif" width="82" height="24" alt="News Room" /></td>
	          </tr>
	          <tr>
	            <td height="40" align="center">&nbsp;</td>
	          </tr>
	          
	          <tr>
	            <td align="center" valign="top" background="0"><table width="720" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <td><table width="720" border="0" cellspacing="0" cellpadding="5">
	<tr>
	                      <td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop">Write</td>
	                  <td align="left" class="board_titletop2"><input name="textfield" type="text" class="textfield" id="textfield" size="20" /></td>
	                      <td width="90" align="center" bgcolor="#F1F1F1" class="board_titletop">password</td>
	                  <td width="250" align="left" class="board_titletop2"><input name="textfield2" type="text" class="textfield" id="textfield2" size="20" /></td>
	                  </tr>
	                    <tr>
	                      <td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">Tel</td>
	                      <td align="left" class="board_listbott"><input name="textfield4" type="text" class="textfield" id="textfield4" size="3" />
	                      -
	                      <input name="textfield5" type="text" class="textfield" id="textfield5" size="3" />
	                      -
	                      <input name="textfield6" type="text" class="textfield" id="textfield6" size="3" />
	                      </td>
	                      <td width="90" align="center" bgcolor="#F1F1F1" class="board_titletop3">E-Mail</td>
	                      <td width="250" align="left" class="board_listbott"><input name="textfield3" type="text" class="textfield" id="textfield3" size="20" /></td>
	                  </tr>
	                    <tr>
	                      <td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">Secret</td>
	                      <td colspan="3" align="left" class="board_listbott"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	                        <tr>
	                          <td width="35" align="left">Open</td>
	                          <td width="50" align="left"><input type="radio" name="radio" id="radio" value="radio" /></td>
	                          <td width="55" align="left">Not Open</td>
	                          <td width="50" align="left"><input type="radio" name="radio" id="radio2" value="radio" /></td>
	                          <td>&nbsp;</td>
	                        </tr>
	                      </table></td>
	                  </tr>
	                  <tr>
	                      <td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">Secret</td>
	                      <td colspan="3" align="left" class="board_listbott"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	                        <tr>
	                          <td width="52" align="left">Question</td>
	                          <td width="50" align="left"><input type="radio" name="radio" id="radio" value="radio" /></td>
	                          <td width="85" align="left">Inconvenience</td>
	                          <td width="50" align="left"><input type="radio" name="radio" id="radio2" value="radio" /></td>
	                          <td width="45" align="left">Praise</td>
	                          <td width="50" align="left"><input type="radio" name="radio" id="radio2" value="radio" /></td>
	                          <td width="65" align="left">Proposition</td>
	                          <td width="50" align="left"><input type="radio" name="radio" id="radio2" value="radio" /></td>
	                          <td width="30" align="left">And</td>
	                          <td width="50" align="left"><input type="radio" name="radio" id="radio2" value="radio" /></td>
	                          <td>&nbsp;</td>
	                        </tr>
	                      </table></td>
	                  </tr>
	                  <tr>
	                      <td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">Title</td>
	                      <td colspan="3" align="left" class="board_listbott">
	                      <input name="textfield7" type="text" class="textfield" id="textfield7" size="50" />
	                      </td>
	                  </tr>
	                  <tr>
	                      <td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">Content</td>
	                      <td colspan="3" align="left" class="board_listbott">
	                        <textarea name="textfield7" cols="70" rows="10" class="textfield2" id="textfield7"></textarea>
	                      </td>
	                  </tr>
	                  <tr>
	                      <td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">File</td>
	                      <td colspan="3" align="left" class="board_listbott">
	                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                          <tr>
	                            <td width="300">
	                              <input name="textfield8" type="text" class="textfield" id="textfield8" size="50" />
	                            </td>
	                            <td width="50" align="center"><img src="../images/btn/btn_search.gif" width="40" height="21" alt="search" /></td>
	                            <td>(file 10MB)</td>
	                          </tr>
	                        </table>
	                      </td>
	                  </tr>
	                  </table>
	                </td>
	              </tr>
	              <tr>
	                <td>&nbsp;</td>
	              </tr>
	              <tr>
	                <td height="50" align="right"><img src="../images/btn/btn_list.gif" width="40" height="21" alt="list" /></td>
	              </tr>
	            </table></td>
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
