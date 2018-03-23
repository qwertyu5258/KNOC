<%@page import="kr.co.knoc.sinmungo.ArticleManager"%>
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
	
	
	ArticleManager articleManager = new ArticleManager(); 
	HashMap dataMap = articleManager.getArticleInfo(etcutil.checkNullInt(request.getParameter("article_nid").toString(), 0));  
	ArrayList fileList = articleManager.getArticleFileList(etcutil.checkNullInt(request.getParameter("article_nid").toString(), 0));
	
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
		location.href = "/ENG/sinmungo/main.jsp";
	}
	
	function onSubmit(){
		
		if(document.getElementById("subject").value == ""){
			alert("Enter the title. please.");
			document.getElementById("subject").focus();
			return;
		}

		if(document.getElementById("content").value == ""){
			alert("Enter the opinion. please.");
			document.getElementById("content").focus();
			return;
		}
		
		if(confirm("Do you want to modify?")){
			document.getElementById("form01").submit();
		}
	}
	
	function goListPage(){
		document.getElementById("form02").submit();
	}
	
	function fileDownFn(p_file_nid){		
		location.href = "/common/fileDown.jsp?file_nid="+p_file_nid;
	}
	
	function fileDelfn(p_file_nid, article_nid, file_idx){	
		if(confirm("Are you sure you want to delete ?")){ 
			document.getElementById("old_save_filex"+file_idx).value="";
			document.getElementById("old_filex"+file_idx).value="";
			document.getElementById("old_nid_filex"+file_idx).value="";
			location.href = "/ENG/sinmungo/delete_file_submit.jsp?file_nid="+p_file_nid+"&article_nid="+article_nid;
		}
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
            <td><!-- contimg --><%@ include file="../include/contimg05.jsp" %></td>
          </tr>
          <tr>
            <td height="34" align="right"><p><img src="../images/ico_home.gif" alt="home" /> &gt;Service &gt;<span class="loca_text"> E-Complaints Mailbox</span></td>
          </tr>
           <tr>
            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="/ENG/images/info/ttl_sub05_1_2.gif" width="161" height="24" alt=" E-Complaints Mailbox" /></td>
          </tr>
          <tr>
            <td align="center" valign="top" background="0">
         
				<div id="rightarea">
					<div id="subcnts">			
						<div id="boardsec">
				
							<form action="/ENG/sinmungo/list.jsp" method="post" name="form02" id="form02">
								<input type="hidden" name="article_pwd" value="<%=dataMap.get("ARTICLE_PWD") %>">
								<input type="hidden" name="page" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page"))) %>">
								<input type="hidden" name="field" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))) %>">
								<input type="hidden" name="searchValue" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("searchValue"))) %>">
							</form>	
							<form action="/ENG/sinmungo/modify_submit.jsp" method="post" name="form01" id="form01" enctype="multipart/form-data">
								<%-- 
								<input type="hidden" name="article_pwd" value="<%=dataMap.get("ARTICLE_PWD") %>">
								--%>
								<input type="hidden" name="article_nid"  value="<%=dataMap.get("ARTICLE_NID").toString() %>">
								<input type="hidden" name="order_no" value="0">
								<input type="hidden" name="status_no" value="1">
								<input type="hidden" name="level_no" value="0">
								<input type="hidden" value="" id="obm_type" name="obm_type" />		
							<table width="720" border="0" cellspacing="0" cellpadding="0">
							<tr>
							<td>
								<table width="720" border="0" cellspacing="0" cellpadding="5">	
								<tr>
									<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop">Title</td>
									<td align="left" colspan="2" class="board_titletop2" style="padding: 10px 0 10px 0;"><input type="text" value="<%=etcutil.checkNull(dataMap.get("SUBJECT").toString())  %>" id="subject" name="subject" maxlength="200" class="input" style="width:570px;" /></td> 
								</tr>
								 	
								<tr>
									<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3"><label for="htmlBody">Content</label></td>
									<td colspan="3" align="left" class="board_listbott" style="padding: 10px 0 10px 0;">
									<textarea name="content" id="content" cols="120" style="width:100%;height:300px" class="inputST"><%=etcutil.checkNull(dataMap.get("CONTENTS").toString())  %></textarea>
									</td>
								</tr>
								<tr>
									<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">Password</td>
									<td colspan="3" align="left" class="board_listbott" style="padding: 10px 0 10px 0;">
										<input type="password" value="<%=etcutil.checkNull(dataMap.get("ARTICLE_PWD").toString())  %>"id="article_pwd" name="article_pwd" maxlength="12" class="input" style="width:120px;" />
									</td>
								</tr>
								
								</table>
							</form>					
								<div class="boardbtm mtm10">
									<div class="btnsec">
										<a href="#submit" onclick="onSubmit();return false;"><input type="image" src="/neoboard/skin/skin12/images/btn_ok.gif" alt="OK" /></a>
										<a href="#content" onclick="goListPage();return false;"><img src="/neoboard/skin/skin12/images/btn_cancel.gif" alt="cancel" /></a>
									</div>
								</div>								
										
						</div>	
					</div>
				</div>

			</td>
          </tr>
          <tr>
          	<td height="40">&nbsp;</td>
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


</body>
</html>