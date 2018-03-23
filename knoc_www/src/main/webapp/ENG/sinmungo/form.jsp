<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.channel.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="ChannelMa" scope="page" class="kr.co.knoc.channel.ChannelManager" />
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","00");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	
	request.setCharacterEncoding("euc-kr");
	
	String mode = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("m")));
	
	
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	String pwd = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("qpwd")));
	
	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	
	ArrayList al = new ArrayList();
	int count = 0;
	int seq = 0;

	boolean isMaster = false;
	boolean isUser = false;

	if(session.getAttribute("SINMUNGO_STATUS_NO") != null){ 
		if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("1")){
			isMaster = true;
		}else if(session.getAttribute("SINMUNGO_STATUS_NO").toString().trim().equals("2")){
			isUser = true;
		} 
	}

%>   

<%@ include file="../include/topmenu.jsp" %>
<!-- topmenu end -->
<script type="text/javascript">
<!--
	if(!<%=isUser %>){
		alert("Not have access.");
		location.href = "/ENG/sinmungo/notice.jsp";
	}
	
	function onSubmit(){
	
		if(document.getElementById("subject").value == ""){
			alert("Enter the title. please.");
			document.getElementById("subject").focus();
			return;
		}
		if(document.getElementById("article_pwd").value == ""){
			alert("Enter the password. please.");
			document.getElementById("article_pwd").focus();
			return;
		}
		if(document.getElementById("article_pwd").value.length < 6){
			alert("Password at least 6 characters must be entered.");
			document.getElementById("article_pwd").focus();			
			return;
		}
		if(!check_pwd(document.getElementById("article_pwd").value)){
			alert('Password must be numbers only.');
			document.getElementById("article_pwd").focus();			
			return;
		}

		if(document.getElementById("content").value == ""){
			alert("Enter the opinion. please.");
			document.getElementById("content").focus();
			return;
		}
		
		if(confirm("submit?")){
			document.getElementById("form01").submit();
		}
	}
	
	
	function check_pwd(str) {
		var reg = new RegExp("^[0-9a-zA-Z]+$");
		var reg2 = new RegExp("[0-9]+");
		var reg3 = new RegExp("[a-zA-Z]+");
		return reg.test(str) && reg2.test(str) && reg3.test(str);
	}
	
	var filecount = 1;
	
	function addfile(){
		filecount++;
		var filearea = "<div id='div"+ filecount +"' style='margin-top: 5px'></div><input type='file' id='file"+ filecount +"' name='filex"+ filecount +"'/>";
		$("filearea").insert(filearea);
	}
	
	function removefile(){
		if(filecount < 2){
			alert("Not be deleted anymore.");
			return;
		}
		$("div"+filecount).remove();
		$("file"+filecount).remove();
		filecount--;
	}
//-->
</script>

<!-- contents -->
<div id="container">
	<table width="100%" height="290" border="0" cellpadding="1" cellspacing="0">
	
	  <tr>
	    <td align="center" valign="top"><table width="1000" height="124" border="0" cellpadding="0" cellspacing="0">
	      <tr>
	        <td class="lnb_area"><%@ include file="../include/leftmenu.jsp" %></td>
	        <td width="30">&nbsp;</td>
	        <td valign="top">
	        <table width="760" border="0" cellspacing="0" cellpadding="0">
	         <tr>
	            <td height="30">&nbsp;</td>
	          </tr>
	          <tr>
	            <td><!-- contimg --> 
				<img src="../images/common/sub_title05.jpg" alt="" /></td>
	          </tr>
	          <tr>
	            <td height="34" align="right"><p><img src="../images/ico_home.gif" alt="home" /> &gt;Service &gt;<span class="loca_text"> E-Complaints Mailbox</span></td>
	          </tr>
	           <tr>
	            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img  src="/ENG/images/info/ttl_sub05_1_2.gif" width="161" height="24" alt=" E-Complaints Mailbox" /></td>
	          </tr>
	          <tr>
	            <td height="40" align="center">&nbsp;</td>
	          </tr>
	          
	          <tr>
	            <td align="center" valign="top" background="0">
	  
	<script type="text/javascript" src="/neoboard/js/comm.js"></script>
				
	<!-- form -->
	<form action="/ENG/sinmungo/submit.jsp" method="post" name="writeform" id="form01" enctype="multipart/form-data">
		<input type="hidden" name="order_no" value="0">
		<input type="hidden" name="status_no" value="1">
		<input type="hidden" name="level_no" value="0">
		<input type="hidden" value="" id="obm_type" name="obm_type" >
	 
	<table width="720" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td>
		<table width="720" border="0" cellspacing="0" cellpadding="5">	
		<tr>
			<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop">Title</td>
			<td align="left" colspan="3" class="board_titletop2"><input type="text" value="" id="subject" name="subject" maxlength="200" class="input" style="width:570px;" /></td> 
		</tr>
		 	
		<tr>
			<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3"><label for="htmlBody">Content</label></td>
			<td colspan="3" align="left" class="board_listbott">
			<textarea name="content" id="content" cols="120" style="width:100%;height:300px" class="inputST"></textarea>
			</td>
		</tr>
		<tr>
			<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">Password</td>
			<td colspan="3" align="left" class="board_listbott">
				<input type="password" value="" id="article_pwd" name="article_pwd" maxlength="12" class="input" style="width:120px;" />
			</td>
		</tr>
		
		</table>
	</td>
	</tr>
	<tr>
	<td>&nbsp;</td>
	</tr>
	<tr>
	<td height="50" align="right">
				<a href="#" onclick="onSubmit();return false;"><img src="/neoboard/skin/skin12/images/btn_ok.gif" alt="ok" />
	</a>
				<a href="/ENG/sinmungo/notice.jsp?user_id=<%=session.getAttribute("SINMUNGO_ID") %>"><img src="/neoboard/skin/skin12/images/btn_cancel.gif" border="0" alt="Ãë¼Ò" /></a>
	</td>
	</tr>
	</table>
	</form>
	<!-- form //-->
	
	            </td>
	          </tr>
	        </table></td>
	      </tr>
	    </table></td>
	  </tr>
	</table>
</div>
<!-- contents end-->



<!-- footer -->
<%@ include file="../include/copyright.jsp" %>
<!-- footer end-->


</body>
</html>