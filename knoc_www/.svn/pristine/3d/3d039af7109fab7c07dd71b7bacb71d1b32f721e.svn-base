<%@ page import = "kr.co.knoc.content.*"%>
<%@ page import = "java.util.*"%>

<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.EngMenuManager" /> 


<!-- top -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="89" align="center" valign="top" background="images/menu/bg_top.jpg">
    
    <div id="tmenu">
    <table width="990" border="0" cellspacing="0" cellpadding="0">
      <tr>
      	<td height="11"></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
            <td width="48"><a href="/ENG/main.jsp"><img src="images/menu/top_btn01.gif" width="48" height="18" border="0" alt="main" /></a></td>
            <td width="74"><a href="sub05/sub05_4.jsp"><img src="images/menu/top_btn02.gif" width="74" height="18" border="0" alt="Contact us" /></a></td>
            <td width="58"><a href="sitemap/sitemap.jsp"><img src="images/menu/top_btn03.gif" width="58" height="18" border="0" alt="sitemap" /></a></td>
            <td width="63" align="right"><a href="http://voice.knoc.co.kr/voicemon/mainGen.odc?method=generate&amp;d_idx=2"><img src="images/menu/tbtn_speaker_eng.gif" width="57" height="17" border="0" alt="voice"/></a></td>			
            <td width="56" align="right"><a href="http://www.knoc.co.kr/"><img src="images/menu/top_btn04.gif" width="50" height="17" border="0"  alt="KOREAN" /></a></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" id="tmenu">
          <tr>
            <td width="200" align="left" valign="top"><a href="/ENG/main.jsp"><img src="images/menu/h_logo_eng.gif" width="177" height="30" border="0" alt="KNOC (Korea National Oil Corporation) Logo" /></a></td>
            <td>&nbsp;</td>
            <td width="99"><a href="sub01/sub01_1_1.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image6','','images/menu/t_menu1_on.gif',1)"><img src="images/menu/t_menu1.gif" name="Image6" width="99" height="30" border="0" id="Image6" onmouseover="MM_showHideLayers('sub01','','show','sub02','','hide','sub03','','hide','sub04','','hide','sub05','','hide','sub06','','hide')" alt="Who we are" /></a></td>
            <td width="163"><a href="sub04/sub04_1_1.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','images/menu/t_menu4_on.gif',1)"><img src="images/menu/t_menu4.gif" name="Image9" width="163" height="30" border="0" id="Image9" onmouseover="MM_showHideLayers('sub01','','hide','sub02','','hide','sub03','','hide','sub04','','show','sub05','','hide','sub06','','hide')" alt="Business Performance" /></a></td>
            <td width="94"><a href="sub03/sub03_1_1_1.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','images/menu/t_menu3_on.gif',1)"><img src="images/menu/t_menu3.gif" name="Image8" width="94" height="30" border="0" id="Image8" onmouseover="MM_showHideLayers('sub01','','hide','sub02','','hide','sub03','','show','sub04','','hide','sub05','','hide','sub06','','hide')" alt="Operations" /></a></td>
            <td width="175"><a href="sub02/sub02_1_1_1.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image7','','images/menu/t_menu2_on.gif',1)"><img src="images/menu/t_menu2.gif" name="Image7" width="175" height="30" border="0" id="Image7" onmouseover="MM_showHideLayers('sub01','','hide','sub02','','show','sub03','','hide','sub04','','hide','sub05','','hide','sub06','','hide')" alt="Corporate Responsibility" /></a></td>
            <td width="74"><a href="sub05/sub05_2.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','images/menu/t_menu5_on.gif',1)"><img src="images/menu/t_menu5.gif" name="Image10" width="74" height="30" border="0" id="Image10" onmouseover="MM_showHideLayers('sub01','','hide','sub02','','hide','sub03','','hide','sub04','','hide','sub05','','show','sub06','','hide')" alt="Service" /></a></td>
            <td width="180"><a href="sub06/sub06_1_1.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image11','','images/menu/t_menu6_on.gif',1)"><img src="images/menu/t_menu6.gif" name="Image11" width="180" height="30" border="0" id="Image11" onmouseover="MM_showHideLayers('sub01','','hide','sub02','','hide','sub03','','hide','sub04','','hide','sub05','','hide','sub06','','show')" alt="E&amp;P Technology Institute" /></a></td>            
          </tr>
        </table></td>
      </tr>
    </table>
    
<!-- Who we are[start] -->    
<% 
	ArrayList al01 = MenuMa.getMenuList("01","Y");	
%>    
    <div id="sub01">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="10"><img src="images/menu/ts_left.gif"  alt="" /></td>
          <td align="center" background="images/menu/ts_bg.gif" class="submenu_text">
<%
	Iterator titer = al01.iterator();
	int i = 1;
	while(titer.hasNext()){		
		EngMenuBean mb = (EngMenuBean)titer.next();
		ArrayList al01s = MenuMa.getMenu1List(mb.getMCode().substring(0,2));
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {			
%>						
					<a href="<%=mb.getUrl() %>"><%=mb.getName() %></a>
<%			if (i < al01s.size()) { %>					
					<img src="images/menu/ts_bar.gif" width="1" height="6" class="submenu_bar" alt="" />
<%			
			}
			i = i + 1;
		}	
	}
%>		          
          </td>
          <td width="10"><img src="images/menu/ts_right.gif" alt="" /></td>
        </tr>
      </table>
    </div>
<!-- Who we are[end] -->


<!-- Business Performance[start] -->    
<% 
	ArrayList al04 = MenuMa.getMenuList("04","Y");	
%>    
    <div id="sub04">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="10"><img src="images/menu/ts_left.gif" alt="" /></td>
          <td align="center" background="images/menu/ts_bg.gif" class="submenu_text">
<%
	titer = al04.iterator();
	i = 1;
	while(titer.hasNext()){		
		EngMenuBean mb = (EngMenuBean)titer.next();
		ArrayList al04s = MenuMa.getMenu1List(mb.getMCode().substring(0,2));
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {			
%>						
					<a href="<%=mb.getUrl() %>"><%=mb.getName() %></a>
<%			if (i < al04s.size()) { %>					
					<img src="images/menu/ts_bar.gif" width="1" height="6" class="submenu_bar" alt="" />
<%			
			}
			i = i + 1;
		}	
	}
%>	
		  </td>
          <td width="10"><img src="images/menu/ts_right.gif" alt="" /></td>
        </tr>
      </table>
    </div>
<!-- Business Performance[end] -->

<!-- Operations[start] -->    
<% 
	ArrayList al03 = MenuMa.getMenuList("03","Y");	
%>	    
    <div id="sub03">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="10"><img src="images/menu/ts_left.gif" alt="" /></td>
          <td align="center" background="images/menu/ts_bg.gif" class="submenu_text">
<%
	titer = al03.iterator();
	i = 1;
	while(titer.hasNext()){		
		EngMenuBean mb = (EngMenuBean)titer.next();
		ArrayList al03s = MenuMa.getMenu1List(mb.getMCode().substring(0,2));
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {			
%>						
					<a href="<%=mb.getUrl() %>"><%=mb.getName() %></a>
<%			if (i < al03s.size()) { %>					
					<img src="images/menu/ts_bar.gif" width="1" height="6" class="submenu_bar" alt="" />
<%			
			}
			i = i + 1;
		}	
	}
%>	
		  </td>
          <td width="10"><img src="images/menu/ts_right.gif" alt="" /></td>
        </tr>
      </table>
    </div>
<!-- Operations[end] -->



<!-- Corporate Responsibility[start] -->    
<% 
	ArrayList al02 = MenuMa.getMenuList("02","Y");	
%>	    
    <div id="sub02">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="10"><img src="images/menu/ts_left.gif" alt="" /></td>
          <td align="center" background="images/menu/ts_bg.gif" class="submenu_text">
<%
	titer = al02.iterator();
	i = 1;
	while(titer.hasNext()){		
		EngMenuBean mb = (EngMenuBean)titer.next();
		ArrayList al02s = MenuMa.getMenu1List(mb.getMCode().substring(0,2));
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {			
%>						
					<a href="<%=mb.getUrl() %>"><%=mb.getName() %></a>
<%			if (i < al02s.size()) { %>					
					<img src="images/menu/ts_bar.gif" width="1" height="6" class="submenu_bar" alt="" />
<%			
			}
			i = i + 1;
		}	
	}
%>	
		  </td>
          <td width="10"><img src="images/menu/ts_right.gif" alt="" /></td>
        </tr>
      </table>
    </div>
<!-- Corporate Responsibility[end] -->


<!-- Service[start] -->    
<% 
	ArrayList al05 = MenuMa.getMenuList("05","Y");	
%>      
    <div id="sub05">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="10"><img src="images/menu/ts_left.gif" alt="" /></td>
          <td align="center" background="images/menu/ts_bg.gif" class="submenu_text">
<%
	titer = al05.iterator();
	i = 1;
	while(titer.hasNext()){		
		EngMenuBean mb = (EngMenuBean)titer.next();
		ArrayList al05s = MenuMa.getMenu1List(mb.getMCode().substring(0,2));
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {			
%>						
					<a href="<%=mb.getUrl() %>"><%=mb.getName() %></a>
<%			if (i < al05s.size()) { %>					
					<img src="images/menu/ts_bar.gif" width="1" height="6" class="submenu_bar" alt="" />
<%			
			}
			i = i + 1;
		}		
	}
%>	
		  </td>
          <td width="10"><img src="images/menu/ts_right.gif" alt="" /></td>
        </tr>
      </table>
    </div>
<!-- Service[end] -->

<!-- E&P Technology Institute[start] -->    
<% 
	ArrayList al06 = MenuMa.getMenuList("06","Y");	
%>       
    <div id="sub06">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="10"><img src="images/menu/ts_left.gif" alt="" /></td>
          <td align="center" background="images/menu/ts_bg.gif" class="submenu_text">
<%
	titer = al06.iterator();
	i = 1;
	while(titer.hasNext()){
		EngMenuBean mb = (EngMenuBean)titer.next();
		ArrayList al06s = MenuMa.getMenu1List(mb.getMCode().substring(0,2));
		if (mb.getMCode() != null && mb.getMCode().substring(4,8).equals("0000")) {			
%>						
					<a href="<%=mb.getUrl() %>"><%=mb.getName() %></a>
<%			if (i < al06s.size()) { %>					
					<img src="images/menu/ts_bar.gif" width="1" height="6" class="submenu_bar" alt="" />
<%			
			}
			i = i + 1;
		}		
	}
%>	
		  </td>
          <td width="10"><img src="images/menu/ts_right.gif" alt="" /></td>
        </tr>
      </table>
    </div>
<!-- E&P Technology Institute[end] -->

    </div>    
    </td>
  </tr>
</table>
<!-- top end-->