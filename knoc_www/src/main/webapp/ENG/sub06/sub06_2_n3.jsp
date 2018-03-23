<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","06");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","07");
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
								<td height="34" align="right"><img src="../images/ico_home.gif" alt="home" /> &gt; E&amp;P Technology  Institute &gt; Research &amp; Development &gt; <span class="loca_text"> Reservoir Simulation</span></td>
							</tr>
							<tr>
								<td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/sub06/ttl_sub06_2_n3.gif" alt="Reservoir Simulation" /></td>
							</tr>
							<tr>
								<td height="40" align="center">&nbsp;</td>
							</tr>
							<tr>
								<td align="center" valign="top"><!-- content start -->
									<div style="width:720px;text-align:justify;margin-bottom:30px;">
										<p>Reservoir simulation is one of the core processes in petroleum engineering. The process predicts the quantity of reserves and production efficiency depending on diverse production strategies. Computer-based 3D reservoir models are used.</p><br />
										<p>Development and production of a reservoir is very expensive. Uncertainties about the reservoir environment and its geological characteristics mean constant risks. Also, a failed development attempt imposes difficulties in restoring the environment. Reservoir simulation enables indirect application of development and production strategies without any risks. This helps to choose the optimal scenario for efficient development of a reservoir.</p><br />
										<p>EPTI conducted a reservoir simulation of Block 11-2 in Vietnam in 2008 to verify the block¡¯s feasibility for development. The institute also performed a simulation study of Ada in Kazakhstan in 2009, 2010, and 2012 to propose development and production strategies. For a simulation of the fractured reservoir of San Pedro in Peru, it used a discrete fracture network model. As for unconventional oil and gas wells, the institute adopted advanced simulation methods considering thermal injection, polymer injection, and other EOR techniques. Examples include simulations of heavy oil reserves in Hayter, Canada. Since 2013, EPTI has conducted simulation of reservoirs of unconventional carbonates in Canada.</p>
									</div>
									<!-- // content end -->
								</td>
							</tr>
							<tr>
								<td><div style="height:20px ;">
									</div>
									<div class="new_officer">
										<table summary="Department Contacts Updated">
											<caption>
											Department Contacts Updated
											</caption>
											<colgroup>
											<col width="auto" />
											<col width="25%" />
											<col width="22%" />
											</colgroup>
											<tbody>
												<tr>
													<td><strong>Department : </strong>Research and Development</td>
													<td><strong>Contacts : </strong>+82)52-216-5522</td>
													<td><strong>Updated : </strong>2016-01-31</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- new_officer end -->
								</td>
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
</body></html>