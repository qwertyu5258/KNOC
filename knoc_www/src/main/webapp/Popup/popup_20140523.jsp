<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>    
<%@ page import = "kr.co.knoc.popup.*"%>
<jsp:useBean id="PopNewMa" scope="page" class="kr.co.knoc.popup.PopupNewManager" />
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<% request.setCharacterEncoding("euc-kr"); %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>홈페이지 서비스 접속 장애 안내</title>
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
    	setCookie("pop20140523","closepop20140523-2",1);
		self.close();
   }
   
//-->
</script>
<body leftmargin="0" topmargin="0">
<div id="popzone" style="marign:auto 0;">
	<div>
	<IMG border=0 src="20140523.jpg" />
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr height="20">
				<td background="/images/popup_btn/pop_bg.gif" align="right" style="padding:10px">
					<img src="/images/popup_btn/btn_close_one_day.gif" onclick="closeWin();" style="cursor:hand" alt="닫기" />
				</td>
			</tr>				
		</table>
	</div>	
</div>
</body>
</html>