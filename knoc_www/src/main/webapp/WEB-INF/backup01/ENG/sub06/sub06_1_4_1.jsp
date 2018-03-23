<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","06");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","04");
	application.setAttribute("gNavMenuDepth4","01");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%@ include file="../include/topmenu.jsp" %>
<!-- topmenu end -->
<!-- contents -->

<table width="100%" height="290" border="0" cellpadding="1" cellspacing="0">
	<tr>
		<td align="center" valign="top">
			<table width="1000" height="124" border="0" cellpadding="0" cellspacing="0">
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
								<td height="34" align="right"><img src="../images/ico_home.gif" alt="home" /> &gt; E&amp; P Technology  Institute &gt; Institute Information &gt; Department &gt; <span class="loca_text">Technology Development</span></td>
							</tr>
							<tr>
								<td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub06/sub6_title04_1.gif" alt="Technology Planning Department" /></td>
							</tr>
							<tr>
								<td height="40" align="center">&nbsp;</td>
							</tr>
							<tr>
								<td align="center">
									<table width="720" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td align="left" style="text-align:justify;"><p>The Technology Development Department consists of the Technology Planning Team, the Technology Development Team, the Carbon Capture and Storage (CCS) Task Force Team, and the Exploration and Production (E&P) ICT Team.</p><br />

											<p>The department establishes mid- to long-term technology plans with the goal of technology independence. Under the plan, it keeps track of technology trends at home and abroad; builds R&D roadmaps based on the results of demand surveys; and performs government tasks aimed at developing key technologies earlier than rivals.</p><br />

											To develop technologies that will lead the low carbon, green growth industry of the future, the department conducts exploration of domestic CO2 storage sites and data interpretation; evaluation of domestic CO2 storage capacity; and research into drilling, injection, and post management systems.</p><br />

											<p>In addition, efforts are underway to ensure comprehensive management of E&P data, improve the Korea Oil Technology Information System (KOTIS), and establish an effective IT resources management system.</p>
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
				url = "sub06_1_4_1_1.jsp";
			}else if("b".equals(iframe_link)){
				url = "sub06_1_4_1_2.jsp";
			}else if("c".equals(iframe_link)){
				url = "sub06_1_4_1_3.jsp";
			}else if("d".equals(iframe_link)){
				url = "sub06_1_4_1_4.jsp";
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