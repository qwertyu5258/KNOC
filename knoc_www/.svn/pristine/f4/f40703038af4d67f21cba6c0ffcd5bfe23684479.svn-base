<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","06");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","04");
	application.setAttribute("gNavMenuDepth4","02");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%@ include file="../include/topmenu.jsp" %>
<!-- topmenu end -->
<!-- contents -->

<table width="100%" height="290" border="0" cellpadding="1" cellspacing="0">
	<tr>
		<td align="center" valign="top"><table width="1000" height="124" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="180" align="right" valign="top"><!-- leftmenu -->
						<%@ include file="../include/leftmenu.jsp" %></td>
					<td width="40">&nbsp;</td>
					<td valign="top"><table width="760" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="30">&nbsp;</td>
							</tr>
							<tr>
								<td><!-- contimg -->
									<%@ include file="../include/contimg06.jsp" %></td>
							</tr>
							<tr>
								<td height="34" align="right"><img src="../images/ico_home.gif" alt="home" /> &gt; E&amp; P Technology  Institute &gt; Institute Information &gt; Department &gt; <span class="loca_text">Strategic Resources Department</span></td>
							</tr>
							<tr>
								<td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub06/sub6_title04_2.gif" alt="G&amp;G Department" /></td>
							</tr>
							<tr>
								<td height="40" align="center">&nbsp;</td>
							</tr>
							<tr>
								<td align="center">
									<table width="720" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td align="left">
												<p>The Strategic Resources Department consists of the Basin Team, Shale Gas 1 and 2 Teams, and the Gas Hydrate TF Team. We aim at screening regional exploration potential and developing concepts for new exploration, especially focusing on unexplored areas such as deep sea and arctic regions and unconventional resources like shale gas and oil sands. We also carry out R&D projects to enhance technical competence and secure core technologies.</p>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<%
			String iframe_link = request.getParameter("pid");
			String url = "";
			if("a".equals(iframe_link) || "".equals(iframe_link) || iframe_link == null ){
				url = "sub06_1_4_2_1.jsp";
			}else if("b".equals(iframe_link)){
				url = "sub06_1_4_2_2.jsp";
			}else if("c".equals(iframe_link)){
				url = "sub06_1_4_2_4.jsp";
			}else if("c".equals(iframe_link)){
				url = "sub06_1_4_2_3.jsp";
			}
		  %>
								<td align="center" valign="top"><iframe src="<%=url %>" name="loadbox" width="720" height="500" 
							marginheight="0" marginwidth="0" scrolling="no"  frameborder="0" allowtransparency="true"> </iframe></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!-- contents end-->
<!-- footer -->
<%@ include file="../include/copyright.jsp" %>
<!-- footer end-->
</body></html>