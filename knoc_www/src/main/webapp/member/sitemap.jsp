<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","09");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>    
<%@include file="/include/comheader.jsp"%>

  <!--// subtopNavi: start //-->
  <%@include file="/include/subtopnavi_new.jsp"%>

    <div id="contents">
        <%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
        <div id="rightarea">
            <div id="subcnts">
               <%@include file="/include/subtop_member.jsp"%>
                <!--// location: start //-->
                <div class="locadv">
                    <a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
                    &gt; <span>기타서비스</span> &gt; <span class="locanow">사이트맵</span>
                 </div>
        <!--// location: end //-->
            
                <div class="pagetle">
                    <h3><img src="/images/member/ttl_site_map.gif" alt="사이트맵" /></h3>
                </div>
                <div id="boardsec">
					<div class="sitmap_section" style="height:710px;">                	
					<% 	//정보공개
						ArrayList site05 = MenuMa.getMenuList("05","Y");	
					%>                  
                	<table width="230" border="0" cellspacing="0" cellpadding="0">
                  	<tr>
                    <td height="48" align="center" background="../images/sitemap/titlebox_bg.gif" class="title_text">정보공개</td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/titlebox_bar.gif" width="230" height="17" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/contbox_top.gif" width="230" height="13" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td align="center" valign="top" background="../images/sitemap/contbox_bg.gif">
                    	<table width="200" border="0" cellspacing="0" cellpadding="2">
					<%
						Iterator iter = site05.iterator();
						int s = 1;
						int j = 1;
						int m = 1;
						while(iter.hasNext()){		
							MenuBean mb = (MenuBean)iter.next();
							if (mb.getMCode() != null) {
								if (mb.getMCode().substring(4,8).equals("0000")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%					
									}
									
									if (s > 1) { //out.println("</div>"); 
									}
									if (s <= 5) {
										//out.println("<div class=\"s_menu01\">");
									} else {
										//out.println("<div class=\"s_menu02\">");
									}				
					%>						
											<tr>
											<td width="12" align="left" class="table_titlebottom"><img src="../images/sitemap/img_bull.gif" width="18" height="18" alt="" /></td>
											<td align="left" class="table_titlebottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
											</tr>
					<%
									s = s + 1;
									j = 1;
									m = 1;
								} else if (mb.getMCode().substring(6,8).equals("00")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j == 1) {
					%>
											<tr>
											<td width="12" align="left">&nbsp;</td>
											<td align="left">
												<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>				
												<tr>
												<td width="12" align="left" class="table_bottom"><img src="../images/sitemap/sub_bullet.gif" width="10" height="7" alt="" /></td>
												<td align="left" class="table_bottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
												</tr>					
					<%				
									j = j + 1;
									m = 1;
								} else {
									if (m == 1) {
					%>
																			
												<tr>
												<td width="12" align="left" class="table_bottom">&nbsp;</td>
												<td align="left" class="table_bottom">
													<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>
													<tr>
													<td width="10" align="left">-</td>
													<td align="left"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
													</tr>                              	
					<%				
									m = m + 1;
								}
							}
						}
						if (m > 1) {
					%>
														</table>
													</td>
													</tr>
					<%		
								} 		
						if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%		
						} 					
					%>	 	                        	                        
											</table>
										</td>
										</tr>
										<tr>
										<td><img src="../images/sitemap/contbox_bottom.gif" width="230" height="13" alt="" /></td>
										</tr>
										</table>
					</div>

					<div class="sitmap_section">               
					<% 	//공사소개
						ArrayList site01 = MenuMa.getMenuList("01","Y");	
					%>	                
                	<table width="230" border="0" cellspacing="0" cellpadding="0">
                  	<tr>
                    <td height="48" align="center" background="../images/sitemap/titlebox_bg.gif" class="title_text">공사소개</td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/titlebox_bar.gif" width="230" height="17" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/contbox_top.gif" width="230" height="13" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td align="center" valign="top" background="../images/sitemap/contbox_bg.gif">
                    	<table width="200" border="0" cellspacing="0" cellpadding="2">
					<%
						iter = site01.iterator();
						s = 1;
						j = 1;
						m = 1;
						while(iter.hasNext()){		
							MenuBean mb = (MenuBean)iter.next();
							if (mb.getMCode() != null) {
								if (mb.getMCode().substring(4,8).equals("0000")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%					
									}
									
									if (s > 1) { //out.println("</div>"); 
									}
									if (s <= 5) {
										//out.println("<div class=\"s_menu01\">");
									} else {
										//out.println("<div class=\"s_menu02\">");
									}				
					%>						
											<tr>
											<td width="12" align="left" class="table_titlebottom"><img src="../images/sitemap/img_bull.gif" width="18" height="18" alt="" /></td>
											<td align="left" class="table_titlebottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
											</tr>
					<%
									s = s + 1;
									j = 1;
									m = 1;
								} else if (mb.getMCode().substring(6,8).equals("00")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j == 1) {
					%>
											<tr>
											<td width="12" align="left">&nbsp;</td>
											<td align="left">
												<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>				
												<tr>
												<td width="12" align="left" class="table_bottom"><img src="../images/sitemap/sub_bullet.gif" width="10" height="7" alt="" /></td>
												<td align="left" class="table_bottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
												</tr>					
					<%				
									j = j + 1;
									m = 1;
								} else {
									if (m == 1) {
					%>
																			
												<tr>
												<td width="12" align="left" class="table_bottom">&nbsp;</td>
												<td align="left" class="table_bottom">
													<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>
													<tr>
													<td width="10" align="left">-</td>
													<td align="left"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
													</tr>                              	
					<%				
									m = m + 1;
								}
							}
						}
						if (m > 1) {
					%>
														</table>
													</td>
													</tr>
					<%		
								} 		
						if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%		
						} 					
					%>	           	
											</table>
										</td>
										</tr>
										<tr>
										<td><img src="../images/sitemap/contbox_bottom.gif" width="230" height="13" alt="" /></td>
										</tr>
										</table>
					</div>

					<div class="sitmap_section">                 	
					<% 	//사업소개
						ArrayList site03 = MenuMa.getMenuList("03","Y");	
					%>	                
                	<table width="230" border="0" cellspacing="0" cellpadding="0">
                  	<tr>
                    <td height="48" align="center" background="../images/sitemap/titlebox_bg.gif" class="title_text">사업소개</td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/titlebox_bar.gif" width="230" height="17" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/contbox_top.gif" width="230" height="13" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td height="180" align="center" valign="top" background="../images/sitemap/contbox_bg.gif">
                    	<table width="200" border="0" cellspacing="0" cellpadding="2">
					<%
						iter = site03.iterator();
						s = 1;
						j = 1;
						m = 1;
						while(iter.hasNext()){		
							MenuBean mb = (MenuBean)iter.next();
							if (mb.getMCode() != null) {
								if (mb.getMCode().substring(4,8).equals("0000")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%					
									}
									
									if (s > 1) { //out.println("</div>"); 
									}
									if (s <= 5) {
										//out.println("<div class=\"s_menu01\">");
									} else {
										//out.println("<div class=\"s_menu02\">");
									}				
					%>						
											<tr>
											<td width="12" align="left" class="table_titlebottom"><img src="../images/sitemap/img_bull.gif" width="18" height="18" alt="" /></td>
											<td align="left" class="table_titlebottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
											</tr>
					<%
									s = s + 1;
									j = 1;
									m = 1;
								} else if (mb.getMCode().substring(6,8).equals("00")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j == 1) {
					%>
											<tr>
											<td width="12" align="left">&nbsp;</td>
											<td align="left">
												<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>				
												<tr>
												<td width="12" align="left" class="table_bottom"><img src="../images/sitemap/sub_bullet.gif" width="10" height="7" alt="" /></td>
												<td align="left" class="table_bottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
												</tr>					
					<%				
									j = j + 1;
									m = 1;
								} else {
									if (m == 1) {
					%>
																			
												<tr>
												<td width="12" align="left" class="table_bottom">&nbsp;</td>
												<td align="left" class="table_bottom">
													<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>
													<tr>
													<td width="10" align="left">-</td>
													<td align="left"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
													</tr>                              	
					<%				
									m = m + 1;
								}
							}
						}
						if (m > 1) {
					%>
														</table>
													</td>
													</tr>
					<%		
								} 		
						if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%		
						} 					
					%>	                         
											</table>
										</td>
										</tr>
										<tr>
										<td><img src="../images/sitemap/contbox_bottom.gif" width="230" height="13" alt="" /></td>
										</tr>
										</table>
					</div>

					<div class="sitmap_section">                	
					<% 	//열린경영
						ArrayList site02 = MenuMa.getMenuList("02","Y");	
					%>		                
                	<table width="230" border="0" cellspacing="0" cellpadding="0">
                  	<tr>
                    <td height="48" align="center" background="../images/sitemap/titlebox_bg.gif" class="title_text">열린경영</td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/titlebox_bar.gif" width="230" height="17" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/contbox_top.gif" width="230" height="13" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td height="180" align="center" valign="top" background="../images/sitemap/contbox_bg.gif">
                    	<table width="200" border="0" cellspacing="0" cellpadding="2">
					<%
						iter = site02.iterator();
						s = 1;
						j = 1;
						m = 1;
						while(iter.hasNext()){		
							MenuBean mb = (MenuBean)iter.next();
							if (mb.getMCode() != null) {
								if (mb.getMCode().substring(4,8).equals("0000")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%					
									}
									
									if (s > 1) { //out.println("</div>"); 
									}
									if (s <= 5) {
										//out.println("<div class=\"s_menu01\">");
									} else {
										//out.println("<div class=\"s_menu02\">");
									}				
					%>						
											<tr>
											<td width="12" align="left" class="table_titlebottom"><img src="../images/sitemap/img_bull.gif" width="18" height="18" alt="" /></td>
											<td align="left" class="table_titlebottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
											</tr>
					<%
									s = s + 1;
									j = 1;
									m = 1;
								} else if (mb.getMCode().substring(6,8).equals("00")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j == 1) {
					%>
											<tr>
											<td width="12" align="left">&nbsp;</td>
											<td align="left">
												<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>				
												<tr>
												<td width="12" align="left" class="table_bottom"><img src="../images/sitemap/sub_bullet.gif" width="10" height="7" alt="" /></td>
												<td align="left" class="table_bottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
												</tr>					
					<%				
									j = j + 1;
									m = 1;
								} else {
									if (m == 1) {
					%>
																			
												<tr>
												<td width="12" align="left" class="table_bottom">&nbsp;</td>
												<td align="left" class="table_bottom">
													<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 


					/**
					* 수정일 : 2015. 02. 24
					* 수정자 : 마용민(milgam12@inplusweb.com)
					* 내  용 : 외부링크 추가
					*/

					String strTarget = "";
					String strLinkUrl = mb.getUrl();

					if(strLinkUrl != null && strLinkUrl.length() > 5 && strLinkUrl.substring(0, 4).equals("http")) {
						strTarget = " target=\"_blank\"";
					}
					%>
													<tr>
													<td width="10" align="left">-</td>
													<td align="left"><a href="<%=mb.getUrl()%>"<%=strTarget%>><%=mb.getName() %></a></td>
													</tr>                              	
					<%				
									m = m + 1;
								}
							}
						}
						if (m > 1) {
					%>
														</table>
													</td>
													</tr>
					<%		
								} 		
						if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%		
						} 					
					%>	                   	
											</table>
										</td>
										</tr>
										<tr>
										<td><img src="../images/sitemap/contbox_bottom.gif" width="230" height="13" alt="" /></td>
										</tr>
										</table>
					 </div>

					<div class="sitmap_section">                	
					<% 	//사이버홍보실
						ArrayList site11 = MenuMa.getMenuList("11","Y");	
					%>		                
                	<table width="230" border="0" cellspacing="0" cellpadding="0">
                  	<tr>
                    <td height="48" align="center" background="../images/sitemap/titlebox_bg.gif" class="title_text">사이버홍보실</td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/titlebox_bar.gif" width="230" height="17" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/contbox_top.gif" width="230" height="13" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td height="180" align="center" valign="top" background="../images/sitemap/contbox_bg.gif">
                    	<table width="200" border="0" cellspacing="0" cellpadding="2">
					<%
						iter = site11.iterator();
						s = 1;
						j = 1;
						m = 1;
						while(iter.hasNext()){		
							MenuBean mb = (MenuBean)iter.next();
							if (mb.getMCode() != null) {
								if (mb.getMCode().substring(4,8).equals("0000")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%					
									}
									
									if (s > 1) { //out.println("</div>"); 
									}
									if (s <= 5) {
										//out.println("<div class=\"s_menu01\">");
									} else {
										//out.println("<div class=\"s_menu02\">");
									}				
					%>						
											<tr>
											<td width="12" align="left" class="table_titlebottom"><img src="../images/sitemap/img_bull.gif" width="18" height="18" alt="" /></td>
											<td align="left" class="table_titlebottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
											</tr>
					<%
									s = s + 1;
									j = 1;
									m = 1;
								} else if (mb.getMCode().substring(6,8).equals("00")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j == 1) {
					%>
											<tr>
											<td width="12" align="left">&nbsp;</td>
											<td align="left">
												<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>				
												<tr>
												<td width="12" align="left" class="table_bottom"><img src="../images/sitemap/sub_bullet.gif" width="10" height="7" alt="" /></td>
												<td align="left" class="table_bottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
												</tr>					
					<%				
									j = j + 1;
									m = 1;
								} else {
									if (m == 1) {
					%>
																			
												<tr>
												<td width="12" align="left" class="table_bottom">&nbsp;</td>
												<td align="left" class="table_bottom">
													<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>
													<tr>
													<td width="10" align="left">-</td>
													<td align="left"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
													</tr>                              	
					<%				
									m = m + 1;
								}
							}
						}
						if (m > 1) {
					%>
														</table>
													</td>
													</tr>
					<%		
								} 		
						if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%		
						} 					
					%>	                   	
											</table>
										</td>
										</tr>
										<tr>
										<td><img src="../images/sitemap/contbox_bottom.gif" width="230" height="13" alt="" /></td>
										</tr>
										</table>
					 </div>
					  <div class="sitmap_section">                	
					<% 	//고객참여
						ArrayList site04 = MenuMa.getMenuList("04","Y");	
					%>                
										<table width="230" border="0" cellspacing="0" cellpadding="0">
										<tr>
										<td height="48" align="center" background="../images/sitemap/titlebox_bg.gif" class="title_text">고객참여</td>
										</tr>
										<tr>
										<td><img src="../images/sitemap/titlebox_bar.gif" width="230" height="17" alt="" /></td>
										</tr>
										<tr>
										<td><img src="../images/sitemap/contbox_top.gif" width="230" height="13" alt="" /></td>
										</tr>
										<tr>
										<td align="center" valign="top" background="../images/sitemap/contbox_bg.gif">
											<table width="200" border="0" cellspacing="0" cellpadding="2">
					<%
						iter = site04.iterator();
						s = 1;
						j = 1;
						m = 1;
						while(iter.hasNext()){		
							MenuBean mb = (MenuBean)iter.next();
							if (mb.getMCode() != null) {
								if (mb.getMCode().substring(4,8).equals("0000")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%					
									}
									
									if (s > 1) { //out.println("</div>"); 
									}
									if (s <= 5) {
										//out.println("<div class=\"s_menu01\">");
									} else {
										//out.println("<div class=\"s_menu02\">");
									}				
					%>						
											<tr>
											<td width="12" align="left" class="table_titlebottom"><img src="../images/sitemap/img_bull.gif" width="18" height="18" alt="" /></td>
											<td align="left" class="table_titlebottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
											</tr>
					<%
									s = s + 1;
									j = 1;
									m = 1;
								} else if (mb.getMCode().substring(6,8).equals("00")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j == 1) {
					%>
											<tr>
											<td width="12" align="left">&nbsp;</td>
											<td align="left">
												<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>				
												<tr>
												<td width="12" align="left" class="table_bottom"><img src="../images/sitemap/sub_bullet.gif" width="10" height="7" alt="" /></td>
												<td align="left" class="table_bottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
												</tr>					
					<%				
									j = j + 1;
									m = 1;
								} else {
									if (m == 1) {
					%>
																			
												<tr>
												<td width="12" align="left" class="table_bottom">&nbsp;</td>
												<td align="left" class="table_bottom">
													<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>
													<tr>
													<td width="10" align="left">-</td>
													<td align="left"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
													</tr>                              	
					<%				
									m = m + 1;
								}
							}
						}
						if (m > 1) {
					%>
														</table>
													</td>
													</tr>
					<%		
								} 		
						if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%		
						} 					
					%>	                    	                        
											</table>
										</td>
										</tr>
										<tr>
										<td><img src="../images/sitemap/contbox_bottom.gif" width="230" height="13" alt="" /></td>
										</tr>
										</table>
					 </div>

					<!-- div class="sitmap_section02">                	
					<% 	//석유개발연구원
						ArrayList site06 = MenuMa.getMenuList("06","Y");	
					%>                  
                	<table width="230" border="0" cellspacing="0" cellpadding="0">
                  	<tr>
                    <td height="48" align="center" background="../images/sitemap/titlebox_bg.gif" class="title_text">석유개발연구원</td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/titlebox_bar.gif" width="230" height="17" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/contbox_top.gif" width="230" height="13" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td align="center" valign="top" background="../images/sitemap/contbox_bg.gif">
                    	<table width="200" border="0" cellspacing="0" cellpadding="2">
					<%
						iter = site06.iterator();
						s = 1;
						j = 1;
						m = 1;
						while(iter.hasNext()){		
							MenuBean mb = (MenuBean)iter.next();
							if (mb.getMCode() != null) {
								if (mb.getMCode().substring(4,8).equals("0000")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%					
									}
									
									if (s > 1) { //out.println("</div>"); 
									}
									if (s <= 5) {
										//out.println("<div class=\"s_menu01\">");
									} else {
										//out.println("<div class=\"s_menu02\">");
									}				
					%>						
											<tr>
											<td width="12" align="left" class="table_titlebottom"><img src="../images/sitemap/img_bull.gif" width="18" height="18" alt="" /></td>
											<td align="left" class="table_titlebottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
											</tr>
					<%
									s = s + 1;
									j = 1;
									m = 1;
								} else if (mb.getMCode().substring(6,8).equals("00")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j == 1) {
					%>
											<tr>
											<td width="12" align="left">&nbsp;</td>
											<td align="left">
												<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>				
												<tr>
												<td width="12" align="left" class="table_bottom"><img src="../images/sitemap/sub_bullet.gif" width="10" height="7" alt="" /></td>
												<td align="left" class="table_bottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
												</tr>					
					<%				
									j = j + 1;
									m = 1;
								} else {
									if (m == 1) {
					%>
																			
												<tr>
												<td width="12" align="left" class="table_bottom">&nbsp;</td>
												<td align="left" class="table_bottom">
													<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>
													<tr>
													<td width="10" align="left">-</td>
													<td align="left"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
													</tr>                              	
					<%				
									m = m + 1;
								}
							}
						}
						if (m > 1) {
					%>
														</table>
													</td>
													</tr>
					<%		
								} 		
						if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%		
						} 					
					%>	 	                        	                        
											</table>
										</td>
										</tr>
										<tr>
										<td><img src="../images/sitemap/contbox_bottom.gif" width="230" height="13" alt="" /></td>
										</tr>
										</table>
					</div-->
  
					<div class="sitmap_section">               	
					<% 	//인재개발센터
						ArrayList site12 = MenuMa.getMenuList("12","Y");	
					%>                  
                	<table width="230" border="0" cellspacing="0" cellpadding="0">
                  	<tr>
                    <td height="48" align="center" background="../images/sitemap/titlebox_bg.gif" class="title_text">인재개발센터</td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/titlebox_bar.gif" width="230" height="17" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/contbox_top.gif" width="230" height="13" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td align="center" valign="top" background="../images/sitemap/contbox_bg.gif">
                    	<table width="200" border="0" cellspacing="0" cellpadding="2">
					<%
						iter = site12.iterator();
						s = 1;
						j = 1;
						m = 1;
						while(iter.hasNext()){		
							MenuBean mb = (MenuBean)iter.next();
							if (mb.getMCode() != null) {
								if (mb.getMCode().substring(4,8).equals("0000")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%					
									}
									
									if (s > 1) { //out.println("</div>"); 
									}
									if (s <= 5) {
										//out.println("<div class=\"s_menu01\">");
									} else {
										//out.println("<div class=\"s_menu02\">");
									}				
					%>						
											<tr>
											<td width="12" align="left" class="table_titlebottom"><img src="../images/sitemap/img_bull.gif" width="18" height="18" alt="" /></td>
											<td align="left" class="table_titlebottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
											</tr>
					<%
									s = s + 1;
									j = 1;
									m = 1;
								} else if (mb.getMCode().substring(6,8).equals("00")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j == 1) {
					%>
											<tr>
											<td width="12" align="left">&nbsp;</td>
											<td align="left">
												<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>				
												<tr>
												<td width="12" align="left" class="table_bottom"><img src="../images/sitemap/sub_bullet.gif" width="10" height="7" alt="" /></td>
												<td align="left" class="table_bottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
												</tr>					
					<%				
									j = j + 1;
									m = 1;
								} else {
									if (m == 1) {
					%>
																			
												<tr>
												<td width="12" align="left" class="table_bottom">&nbsp;</td>
												<td align="left" class="table_bottom">
													<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>
													<tr>
													<td width="10" align="left">-</td>
													<td align="left"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
													</tr>                              	
					<%				
									m = m + 1;
								}
							}
						}
						if (m > 1) {
					%>
														</table>
													</td>
													</tr>
					<%		
								} 		
						if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%		
						} 					
					%>	 	                        	                        
											</table>
										</td>
										</tr>
										<tr>
										<td><img src="../images/sitemap/contbox_bottom.gif" width="230" height="13" alt="" /></td>
										</tr>
										</table>
					 </div>

					<!-- div class="sitmap_section">  
					<% 	//이사회
						ArrayList site08 = MenuMa.getMenuList("08","Y");	
					%>                  
                	<table width="230" border="0" cellspacing="0" cellpadding="0">
                  	<tr>
                    <td height="48" align="center" background="../images/sitemap/titlebox_bg.gif" class="title_text">이사회</td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/titlebox_bar.gif" width="230" height="17" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/contbox_top.gif" width="230" height="13" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td align="center" valign="top" background="../images/sitemap/contbox_bg.gif">
                    	<table width="200" border="0" cellspacing="0" cellpadding="2">
					<%
						iter = site08.iterator();
						s = 1;
						j = 1;
						m = 1;
						while(iter.hasNext()){		
							MenuBean mb = (MenuBean)iter.next();
							if (mb.getMCode() != null) {
								if (mb.getMCode().substring(4,8).equals("0000")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%					
									}
									
									if (s > 1) { //out.println("</div>"); 
									}
									if (s <= 5) {
										//out.println("<div class=\"s_menu01\">");
									} else {
										//out.println("<div class=\"s_menu02\">");
									}				
					%>						
											<tr>
											<td width="12" align="left" class="table_titlebottom"><img src="../images/sitemap/img_bull.gif" width="18" height="18" alt="" /></td>
											<td align="left" class="table_titlebottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
											</tr>
					<%
									s = s + 1;
									j = 1;
									m = 1;
								} else if (mb.getMCode().substring(6,8).equals("00")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j == 1) {
					%>
											<tr>
											<td width="12" align="left">&nbsp;</td>
											<td align="left">
												<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>				
												<tr>
												<td width="12" align="left" class="table_bottom"><img src="../images/sitemap/sub_bullet.gif" width="10" height="7" alt="" /></td>
												<td align="left" class="table_bottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
												</tr>					
					<%				
									j = j + 1;
									m = 1;
								} else {
									if (m == 1) {
					%>
																			
												<tr>
												<td width="12" align="left" class="table_bottom">&nbsp;</td>
												<td align="left" class="table_bottom">
													<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>
													<tr>
													<td width="10" align="left">-</td>
													<td align="left"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
													</tr>                              	
					<%				
									m = m + 1;
								}
							}
						}
						if (m > 1) {
					%>
														</table>
													</td>
													</tr>
					<%		
								} 		
						if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%		
						} 					
					%>	 	                        	                        
											</table>
										</td>
										</tr>
										<tr>
										<td><img src="../images/sitemap/contbox_bottom.gif" width="230" height="13" alt="" /></td>
										</tr>
										</table>
					  </div-->

					<div class="sitmap_section">                  	
					<% 	//기타서비스
						ArrayList site09 = MenuMa.getMenuList("09","Y");	
					%>                  
                	<table width="230" border="0" cellspacing="0" cellpadding="0">
                  	<tr>
                    <td height="48" align="center" background="../images/sitemap/titlebox_bg.gif" class="title_text">기타서비스</td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/titlebox_bar.gif" width="230" height="17" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td><img src="../images/sitemap/contbox_top.gif" width="230" height="13" alt="" /></td>
                  	</tr>
                  	<tr>
                    <td align="center" valign="top" background="../images/sitemap/contbox_bg.gif">
                    	<table width="200" border="0" cellspacing="0" cellpadding="2">
					<%
						iter = site09.iterator();
						s = 1;
						j = 1;
						m = 1;
						while(iter.hasNext()){		
							MenuBean mb = (MenuBean)iter.next();
							if (mb.getMCode() != null) {
								if (mb.getMCode().substring(4,8).equals("0000")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%					
									}
									
									if (s > 1) { //out.println("</div>"); 
									}
									if (s <= 5) {
										//out.println("<div class=\"s_menu01\">");
									} else {
										//out.println("<div class=\"s_menu02\">");
									}				
					%>						
											<tr>
											<td width="12" align="left" class="table_titlebottom"><img src="../images/sitemap/img_bull.gif" width="18" height="18" alt="" /></td>
											<td align="left" class="table_titlebottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
											</tr>
					<%
									s = s + 1;
									j = 1;
									m = 1;
								} else if (mb.getMCode().substring(6,8).equals("00")) {
									if (m > 1) {
					%>
													</table>
												</td>
												</tr>
					<%					
									}
									if (j == 1) {
					%>
											<tr>
											<td width="12" align="left">&nbsp;</td>
											<td align="left">
												<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>				
												<tr>
												<td width="12" align="left" class="table_bottom"><img src="../images/sitemap/sub_bullet.gif" width="10" height="7" alt="" /></td>
												<td align="left" class="table_bottom"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
												</tr>					
					<%				
									j = j + 1;
									m = 1;
								} else {
									if (m == 1) {
					%>
																			
												<tr>
												<td width="12" align="left" class="table_bottom">&nbsp;</td>
												<td align="left" class="table_bottom">
													<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<%					
									} 
					%>
													<tr>
													<td width="10" align="left">-</td>
													<td align="left"><a href="<%=mb.getUrl() %>"><%=mb.getName() %></a></td>
													</tr>                              	
					<%				
									m = m + 1;
								}
							}
						}
						if (m > 1) {
					%>
														</table>
													</td>
													</tr>
					<%		
								} 		
						if (j > 1) {
					%>
												</table>
											</td>
											</tr>
					<%		
						} 					
					%>	 	                        	                        
											</table>
										</td>
										</tr>
										<tr>
										<td><img src="../images/sitemap/contbox_bottom.gif" width="230" height="13" alt="" /></td>
										</tr>
										</table>                	
										
									</div>

              </div>
            </div>
      </div>
    
        
    </div>
<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>