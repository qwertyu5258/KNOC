<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.content.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.MenuManager" />
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( ������ �ƴ�??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "�޴� �� ������ ����";  		// ���� Depth ����
    String gNavSubName = "content";				// ���� Depth �̸�
    String gNavDepthTitle1 = "03"; 		// Ȩ > ���� > ����1 ����
    String gNavDepthName1 = "";				// Ȩ > ���� > ����1 �̹��� �±� �̸�
    String gNavDepthTitle2 = ""; 				// Ȩ > ���� > ����1 > ����2 ����

	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "�޴�����";  					// ���� ������ ����
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String depth1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth1")),"8859_1");
	if (depth1 == null || depth1.equals("")) {
		depth1 = "01";
	}
	String menu_name1 = "";
	if (depth1.equals("01")) {
		menu_name1 = "����Ұ�";
	} else if (depth1.equals("02")) {
		menu_name1 = "�����濵";
	} else if (depth1.equals("03")) {
		menu_name1 = "����Ұ�";
	} else if (depth1.equals("04")) {
		menu_name1 = "��������";
	} else if (depth1.equals("11")) {
		menu_name1 = "���̹�ȫ����";
	} else if (depth1.equals("05")) {
		menu_name1 = "��������";
	} else if (depth1.equals("06")) {
		menu_name1 = "�����������";
	} else if (depth1.equals("07")) {
		menu_name1 = "���";
	} else if (depth1.equals("08")) {
		menu_name1 = "�̻�ȸ";
	} else if (depth1.equals("09")) {
		menu_name1 = "��Ÿ����";
	} else if (depth1.equals("10")) {
		menu_name1 = "����Ʈ�˻�";
	} else if (depth1.equals("12")) {
		menu_name1 = "���簳�߼���";
	}  
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">
	function jsEdit(no) {
         	document.bForm.action = 'menuEdit.jsp';
          	document.bForm.no.value = no;
           	document.bForm.submit();
	}
	function jsWrite() {
		document.bForm.action = "menuWrite.jsp";
       	document.bForm.submit();
	}
	function jsDelete(mcode) {
		var ff = document.bForm;
	    if (confirm("�޴��� ���� �޴��� ������ ��� �����޴��� ���� �ǽʴϴ�.\n������ �Ͻðڽ��ϱ�?")) {	
	    	ff.action = "menuDeleteOk.jsp";
	    	ff.mcode.value = mcode;
	        ff.submit();
	
	    }
	}
</script>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="195" valign="top">  
<%@ include file = "left.jsp" %>  
</td>  
<td valign=top>
	<table width="100%" height="200"  border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td valign="top">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td valign="top">			
			<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> �޴� ���� > �޴�����</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">�޴� ���� > �޴�����</span></td>
			</tr>
			<tr>
			<td height="2" colspan="2" bgcolor="EAEAEC"></td>
			</tr>
			</table>
			<table width="100%" height="15"  border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td></td>
			</tr>
			</table>
			<table align=center class=tableBorder border="0" cellpadding="0" cellspacing="0" width="100%">		
			<tr>
			<td class=descBorder_r>
			<input type=button value=' �޴� ��� ' class=button onClick="jsWrite();">
			<input type=button value=' �޴� ���� ����' class=button onClick="location.href='menuListEdit.jsp';">
			</td>
			</tr>        
			</table>		
			<br></br>
			<table align=center class=tableBorder border="0" cellpadding="0" cellspacing="0" width="100%">		
			<tr>
			<td class=descBorder_r>
			<a href="menuList.jsp?depth1=01">����Ұ�</a> 
			 | <a href="menuList.jsp?depth1=02">�����濵</a>
			 | <a href="menuList.jsp?depth1=03">����Ұ�</a>
			 | <a href="menuList.jsp?depth1=04">��������</a>
			 | <a href="menuList.jsp?depth1=11">���̹�ȫ����</a>
			 | <a href="menuList.jsp?depth1=05">��������</a>
			 | <a href="menuList.jsp?depth1=06">�����������</a>
			 | <a href="menuList.jsp?depth1=12">���簳�߼���</a>
			 <!-- | <a href="menuList.jsp?depth1=07">���</a> -->
			 | <a href="menuList.jsp?depth1=08">�̻�ȸ</a>
			 | <a href="menuList.jsp?depth1=09">��Ÿ����</a>
			 | <a href="menuList.jsp?depth1=10">����Ʈ�˻�</a>
			</td>
			</tr>        
			</table>				
<!-- ROW ���� -->	
<form name="bForm" method="post" action="menuList.jsp">
<input type="hidden" name="no" value="">
<input type="hidden" name="mcode" value="">
<input type="hidden" name="depth1" value="<%=depth1 %>">	
</form>
<% 
	ArrayList al01 = MenuMa.getMenuList(depth1,"");	
%>
			<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
			<tr height="25"  bgcolor="000000">
			<td align=center width="60"><font color=ffffff>no.</font></td>
			<td align=center width="100"><font color=ffffff>�޴��ڵ�</font></td>
			<td align=center width="100"><font color=ffffff>�޴���</font></td>			
			<td align=center><font color=ffffff>���</font></td>			
			<td align=center width="150"><font color=ffffff>����</font></td>						
			</tr>    
<%
	Iterator iter = al01.iterator();
	int i = 1;
	String bgcolor = "";	
	String delMcode = "";
	while(iter.hasNext()){		
		MenuBean mb = (MenuBean)iter.next();
		if (mb.getMCode().substring(4,8).equals("0000")) {
			bgcolor = "#8FA4BB";
			delMcode = mb.getMCode().substring(0,4);
		} else if (mb.getMCode().substring(6,8).equals("00")) {
			bgcolor = "#BBD5F0";
			delMcode = mb.getMCode().substring(0,6);
		} else {
			bgcolor = "#ECF4FC";			
			delMcode = mb.getMCode();
		}
%>																																	
			<tr height="25"  bgcolor="<%=bgcolor %>">
			<td align=center><%=i %></td>						
			<td align=center><%=mb.getMCode() %></td>			
			<td align=center><%=mb.getName() %></td>			
			<td align=center><a href="<%=mb.getUrl()%>" target="_blank"><%=menu_name1 %> <%=MenuMa.getMenuName(mb.getMCode()) %></a></td>						
			<td align=center><input type=button value=' ���� ' class=button onClick="jsEdit(<%=mb.getNo() %>);">
			<input type=button value=' ���� ' class=button onClick="jsDelete('<%=delMcode %>');"></td>
			</tr>
<%				
		i = i + 1;
	}
%>				
			</table>
		</td>
		</tr>
		</table>		
		<br>					
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
<%@ include file="../inc/bottom.jsp" %>	