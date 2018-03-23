<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","07");
	application.setAttribute("gNavMenuDepth3","06");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%@ include file="../include/topmenu.jsp" %>
<!-- topmenu end -->
<!-- contents -->
<div id="container">
	<table width="100%" height="290" border="0" cellpadding="1" cellspacing="0">
		<tr>
			<td align="center" valign="top">
				<table width="1000" height="124" border="0" cellpadding="0" cellspacing="0">
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
					              <td><!-- contimg --><%@ include file="../include/contimg03.jsp" %></td>
					            </tr>
								<tr>
									<td height="34" align="right"><img src="../images/ico_home.gif" alt="home" /> &gt; Operations &gt; Technology Development &gt; <span class="loca_text"> Petroleum Data Management</span></td>
								</tr>
								<tr>
									<td height="24" width="306" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub03/sub3_title08_06.gif" alt="Petroleum Data Management" border="0" /></td>
								</tr>
								<tr>
									<td height="40" align="center">&nbsp;</td>
								</tr>
								<tr>
									<td align="center" valign="top">
										<table class="contents" border="0" cellspacing="0" cellpadding="0">			
	
											<tr>
												<td align="left">
													<p>The petroleum technical data management facilitating users' access to & search of the database by upgrading to data management system.</p>
													<br />
													
													<table width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td width="3%" align="center"><img src="../images/sub03/bullet_red_02.gif" width="8" height="9" alt="" /></td>
															<td width="97%" height="25" align="left">Manage output data of E&P Technical projects (KOTIS, Studio and Prosource DB)</td>
														</tr>
														<tr>
															<td align="center"><img src="../images/sub03/bullet_red_02.gif" width="8" height="9" alt="" /></td>
															<td height="25" align="left">Convert E&P exploration data (SEG-Y)</td>
														</tr>
														<tr>
															<td align="center"><img src="../images/sub03/bullet_red_02.gif" width="8" height="9" alt="" /></td>
															<td height="25" align="left">Support and manage drilling samples</td>
														</tr>
														<tr>
															<td align="center"><img src="../images/sub03/bullet_red_02.gif" width="8" height="9" alt="" /></td>
															<td height="25" align="left">Support E&P computer graphic report</td>
														</tr>
													</table>
												</td>
											</tr>
												
																					
											<tr>
												<td align="center">&nbsp;</td>
											</tr>
											<tr>
												<td><div style="height:20px ;">
													</div>
													<div class="new_officer">
														<table summary="Department Contacts Updated">
														<caption>Department Contacts Updated</caption>  
														<tbody>
														    <tr>
														    	<td class="write_day"><strong>Updated : </strong>2016-08-20</td>
														        <td class="contact_team"><strong>Department : </strong>Technology Development Dept.</td>
														        <td class="contact_tel"><strong>Contacts : </strong>+82)52-216-3503</td>																        
														    </tr>
														</tbody>
														</table>
													</div>
													<!-- new_officer end -->
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<!-- contents end-->
<!-- footer -->
<%@ include file="../include/copyright.jsp" %>
<!-- footer end-->
</body></html>