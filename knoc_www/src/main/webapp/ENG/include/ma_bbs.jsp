<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>    
<%@ page import = "kr.co.knoc.content.*"%>
<%@ page import = "java.util.*"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />

<link rel="stylesheet" href="/ENG/css/maincss.css" type="text/css" />
<link rel="stylesheet" href="/ENG/css/sub.css" type="text/css" title="PRDOM CSS" />
<link rel="stylesheet" href="/ENG/css/sub01.css" type="text/css" title="PRDOM CSS"/>
<link rel="stylesheet" href="/ENG/css/sub02.css" type="text/css" title="PRDOM CSS"/>
<link rel="stylesheet" href="/ENG/css/sub04.css" type="text/css" title="PRDOM CSS"/>
<link rel="stylesheet" href="/ENG/css/sub05.css" type="text/css" title="PRDOM CSS"/>
<link rel="stylesheet" href="/ENG/css/sitemap.css" type="text/css" title="PRDOM CSS"/>
<link rel="stylesheet" href="/ENG/css/board.css" type="text/css" title="PRDOM CSS"/>
<title>M&A NEWS</title>
<script type="text/javascript">
	window.resizeTo(734,500);
</script>
</head>

<body>
<table cellpadding="0" cellspacing="0" width="600" border="0">
<tr>
	<td height="25" style="background: #ece9e4;text-align:right;padding-right:5px;" ><img src="http://www.knoc.co.kr/ENG/images/ico_home.gif" align="absmiddle" alt=""/> > <span class="loca_text"> M&A News</span></td>
</tr>
<tr>
	<td style="padding-top:5px;">
	<table  cellpadding="0" cellspacing="0" width="550" border="0" align="center">
	<tr>
	<td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="../images/new_main/ma_ptt.gif" alt="M&A NEWS" /></td>
	</tr>
	<tr>
		<td><neo:neoboardFacade parentUri="<%=request.getServletPath()%>" mode="list" bid="ENGNEWS" adminURL="" sessionName="USERSESSION"/></td>
	</tr>
	</table>
		


	
	</td>
</tr>
</table>

</body>
</html>