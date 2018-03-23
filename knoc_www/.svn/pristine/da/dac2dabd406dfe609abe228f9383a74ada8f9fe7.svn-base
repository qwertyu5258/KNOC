<% 	
	ArrayList leftmenu = MenuMa.getMenuList(gNavMenuDepth1,"Y");	
%>
    <table style="border-bottom:1px solid #d2d2d2;" border="0" cellspacing="0" cellpadding="0" >

          <tr>
            <td><img src="../img/common/sleft_tle<%=Integer.parseInt(gNavMenuDepth1)%>.gif" alt="About us" /></td>
          </tr>
<%          
	Iterator iterm = leftmenu.iterator();
	String oldMCode = "";
	String oldMCode2 = "";
	String flag = "";
	String flag2 = "";
	while(iterm.hasNext()){		
		EngMenuBean mb = (EngMenuBean)iterm.next();
		if (!oldMCode.equals("") && !oldMCode.equals(mb.getMCode().substring(2,4)) && oldMCode.equals(gNavMenuDepth2) && flag.equals("Y")) {
%>
            	</table>
            </td>
          </tr>		
<%			
			flag = "";	
			flag2 = "";	
		} else if (!oldMCode2.equals("") && !oldMCode2.equals(mb.getMCode().substring(4,6)) && oldMCode2.equals(gNavMenuDepth3) && mb.getMCode().substring(6,8).equals("00") && flag2.equals("Y")) {
%>
	        	</table>
	        </td>
	      </tr>		
<%			
	
			flag = "";	
			flag2 = "";						
		}
		if (mb.getMCode().substring(4,8).equals("0000")) {
			if (mb.getName().length() > 39) { %>          
          <tr class="leftmenu">
            <td height="70" align="left" background="../img/common/sleft_menubg_<% if (!mb.getMCode().substring(2,4).equals(gNavMenuDepth2)) { %>off<% } else { %>on<% } %>2.gif" class="leftmenu"><strong><a href="<%=mb.getUrl()%>" class="<% if (!mb.getMCode().substring(2,4).equals(gNavMenuDepth2)) { %>a1<% } else { %>a2<% } %>"><%=mb.getName() %></a></strong></td>
          </tr>
<%			} else { %>
          <tr class="leftmenu">
            <td height="35" align="left" background="../img/common/sleft_menubg_<% if (!mb.getMCode().substring(2,4).equals(gNavMenuDepth2)) { %>off<% } else { %>on<% } %>.gif" class="leftmenu"><strong><a href="<%=mb.getUrl()%>" class="<% if (!mb.getMCode().substring(2,4).equals(gNavMenuDepth2)) { %>a1<% } else { %>a2<% } %>"><%=mb.getName() %></a></strong></td>
          </tr>
<%			} %>	   
<%		
		} else if (mb.getMCode().substring(6,8).equals("00") && mb.getMCode().substring(2,4).equals(gNavMenuDepth2)) {
			if (flag.equals("")) {
%>       
          <tr>
            <td style="width:180px; padding-bottom:10px; border-right:1px solid #d2d2d2; border-left:1px solid #d2d2d2; background:#f0f0f0;" >
            	<table style="width:180px;" border="0" cellspacing="0" cellpadding="0">
<%			}	%>		            	
                <tr>
                  <td height="20" align="left" class="a1"><img src="../img/common/bg_dot.gif" alt="" /> <a href="<%=mb.getUrl()%>" class="a1"><%=mb.getName() %></a></td>
                </tr>
<%
			flag = "Y";			
		} else if (mb.getMCode().substring(2,4).equals(gNavMenuDepth2) && mb.getMCode().substring(4,6).equals(gNavMenuDepth3) && !mb.getMCode().substring(6,8).equals("00")) {
			if (flag2.equals("")) {
%>                
				
<%			}	%>
<%			if (mb.getName().length() > 21) { %>
                <tr>
                  <td align="left" class="td_sbumenu02">-<a href="<%=mb.getUrl()%>" class="a1"> <%=mb.getName() %></a></td>
                </tr>
<% 			} else { %>
                <tr>
                  <td align="left" class="td_sbumenu02">-<a href="<%=mb.getUrl()%>" class="a1"> <%=mb.getName() %></a></td>
                </tr>
<%			} %>                                
                
<%			
				flag2 = "Y";
			
		} else {
		}
		oldMCode = mb.getMCode().substring(2,4);
		oldMCode2 = mb.getMCode().substring(4,6);
	}
	if (flag.equals("Y") || flag2.equals("Y")) {
%>	
	        	</table>
	        </td>
	      </tr>							   
<%	} %>
        </table>