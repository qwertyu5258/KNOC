<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%@ include file="/ENG/include/topmenu.jsp" %>
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
							<table border="0" cellspacing="0" cellpadding="0" class="con_wrap">
								<tr>
									<td><!-- contimg --><%@ include file="../include/contimg01.jsp" %></td>
								</tr>
								<tr>
									<td height="34" align="right"><img src="../images/ico_home.gif" alt="home" /> &gt; About Us &gt; <span class="loca_text"> Message From CEO</span></td>
								</tr>
								<tr>
									<td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub01/ttl_sub01_1_1.gif" alt="Message from ceo" width="132" height="24" /></td>
								</tr>
								<tr>
									<td height="40" align="center">&nbsp;</td>
								</tr>
								<tr>
									<td align="center" valign="top">
										<table style="width:690px;text-align:center;" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td>
													<table width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td width="412" valign="top">
																<table width="741px" border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td><img src="../images/sub01/great_en_01.gif" alt=" Message From CEO  " style="text-align:center;" longdesc="../longdesc/ceo_greeting_eng.html" /></td>
																	</tr>															
																</table>
															</td>
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
																	    	<td class="write_day"><strong>Updated : </strong>2016-04-05</td>
																	        <td class="contact_team"><strong>Department : </strong>President's Office</td>
																	        <td class="contact_tel"><strong>Contacts : </strong>+82)52-216-2033</td>																        
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
			</td>
		</tr>
	</table>
</div>
<!-- contents end-->
<!-- footer -->
<%@ include file="../include/copyright.jsp" %>
<!-- footer end-->
</body>
</html>
