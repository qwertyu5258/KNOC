<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","03");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","03");
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
									<td><!-- contimg --><%@ include file="../include/contimg03.jsp" %></td>
								</tr>
								<tr>
									<td height="34" align="right"><img src="../images/ico_home.gif" alt="home" /> &gt; Operations &gt; Oil  Stockpiling Projects &gt; <span class="loca_text">Operation of Stockpiling Facilities </span></td>
								</tr>
								<tr>
									<td height="24" width="235" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub03/sub3_title26.gif" alt="Operation of Stockpiling Facilities" width="235" height="24" /></td>
								</tr>
								<tr>
									<td height="40" align="center">&nbsp;</td>
								</tr>
								<tr>
									<td align="center" valign="top">
										<table class="contents" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td align="left">
													<table width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td width="20"><img src="../images/sub03/sub06_bull01.gif" width="20" height="16" alt="" /></td>
															<td height="25"><p><strong>Map of Storage Bases</strong></p></td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td align="left">KNOC is running nine stockpiling bases with a capacity of 146 million barrels of oil, and currently holds 94 million barrels of reserves, excluding international joint stockpiling reserves as of Sep 2016.</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td align="center"><img src="../images/sub03/3_3_img03.gif" alt="" width="650" height="605" /></td>
											</tr>
											<tr>
												<td height="40px">&nbsp;</td>
											</tr>
											<tr>
												<td>
													<div style="height:20px ;">
													</div>
													<div class="new_officer">
														<table summary="Department Contacts Updated">
														<caption>Department Contacts Updated</caption>  
														<tbody>
														    <tr>
														    	<td class="write_day"><strong>Updated : </strong>2016-11-10</td>
														        <td class="contact_team"><strong>Department : </strong>Petroleum Stockpile Dept.</td>
														        <td class="contact_tel"><strong>Contacts : </strong>+82)52-216-5005</td>																        
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