<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>    
<%@ page import = "kr.co.knoc.popup.*"%>
<jsp:useBean id="PopNewMa" scope="page" class="kr.co.knoc.popup.PopupNewManager" />
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<% request.setCharacterEncoding("euc-kr"); %>    
<%   	
	int	no	= (request.getParameter("no")==null)?0:Integer.parseInt(request.getParameter("no"));
	if(no <= 0) {
%>		
<script type="text/javascript">
	alert("등록된 팝업이 아닙니다.");
	self.close();
</script>
<%	
		return;
	}
	PopupNewBean pnb = PopNewMa.getPopupNew(no);
	String cookie_date = pnb.getRegDateString("yyyyMMddhhmmss");
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><%=pnb.getTitle() %></title>
<link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
<style type="text/css">
<!--
html, body, div, span, object, iframe,
p, blockquote, pre,
a, abbr, address, big, cite, code,
del, dfn, em, font, img, ins, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, 
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend, 
table, caption, tbody, tfoot, thead, tr, th, td 
{margin: 0; padding: 0;	border:0;} 
legend { visibility:hidden; height:0; width:0; font-size:0;display:none;}
-->
</style>
</head>
<script type="text/javascript" language="javascript" src="/share/js/common.js"></script>
<script type="text/javascript">
<!--

   function closeWin()
   {
    	setCookie("<%=cookie_date%>","close<%=cookie_date%>",1);
		self.close();
   }
   
//-->
</script>
<body leftmargin="0" topmargin="0">
<div id="popzone" style="marign:auto 0;">
<%-- 
<div>
<IMG border=0 src="http://www.knoc.co.kr/Popup/130118_popimg.jpg" width=413 height=222 useMap=#Map /><MAP id=Map name=Map><AREA href="http://www.knoc.co.kr/sub04/sub04_8_1.jsp?page=1&amp;num=4&amp;mode=view&amp;field=&amp;text=&amp;bid=CLEAR1&amp;ses=USERSESSION&amp;psize=12" shape=rect target=_blank coords=11,159,203,210><AREA href="http://www.knoc.co.kr/sub04/sub04_8_1.jsp?page=1&amp;num=11&amp;mode=view&amp;field=&amp;text=&amp;bid=CLEAR1&amp;ses=USERSESSION&amp;psize=12" shape=rect target=_blank coords=205,160,402,212></MAP>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr height="20">
			<td background="/images/popup_btn/pop_bg.gif" align="right" style="padding:10px">
			<% if (pnb.getCookie().equals("Y")) { %>
				<img src="/images/popup_btn/btn_close_one_day.gif" onclick="closeWin();" style="cursor:pointer" alt="닫기" />
			<% } %>
			</td>
		</tr>				
	</table>
</div>	
 --%>
<%=pnb.getContent() %>
		
			<table cellpadding="0" cellspacing="0" border="0" width="100%" style="border-collapse:collapse;">				
					<tr>
						<td background="/images/popup_btn/pop_bg.gif" align="right" style="height:25px;">
						<% if (pnb.getCookie().equals("Y")) { %>
							<img src="/images/popup_btn/btn_close_one_day.gif" onclick="closeWin();" style="cursor:pointer; margin-right:5px; " alt="닫기" />
						<% } %>
						</td>
					</tr>				
			</table>	
</div>
</body>
</html>