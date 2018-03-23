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

	ArticleManager articleManager = new ArticleManager();
	HashMap dataMap = articleManager.getArticleInfo(etcutil.checkNullInt(request.getParameter("article_nid").toString(), 0));
	ArrayList article_comment = null;
	article_comment = articleManager.getArticleCommentInfo(etcutil.checkNullInt(request.getParameter("article_nid").toString(), 0));

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
	if(!<%=isMaster %> && !<%=isUser %>){
		alert("Not have access.");
		location.href = "/ENG/sinmungo/notice.jsp";
	}

	function fileDownFn(p_file_nid){
		location.href = "/common/fileDown.jsp?file_nid="+p_file_nid;
	}

	function goListPage(){
		document.getElementById("form01").submit();
	}

	function goDeletePage(article_nid){
		if(confirm("Are you sure you want to delete ?")){
		location.href = "/ENG/sinmungo/delete_submit.jsp?article_nid="+article_nid;
		}
	}

	function goModifyPage(article_nid){
		location.href = "/ENG/sinmungo/modify.jsp?article_nid="+article_nid;
	}

	function goUpdateCommentViewCheck(p_no){
		$("comment_div_"+p_no).toggle();
	}

	function goSubmitFn(){
		if(document.getElementById("comment_comtents").value == ""){
			alert("내용을 입력해 주세요.");
			document.getElementById("comment_comtents").focus();
			return;
		}

		if(confirm("등록 하시겠습니까?")){
			document.getElementById("com_form").submit();
		}
	}

	function goUpdateComment(p_no){
		if(document.getElementById("comment_comtents").value == ""){
			alert("내용을 입력해 주세요.");

			return;
		}
		if(confirm("수정 하시겠습니까?")){
			document.getElementById("comment_form_"+p_no).submit();
		}
	}

	function goDeleteFn(p_no){
		if(confirm("삭제 하시겠습니까?")){
			document.getElementById("comment_del_form_"+p_no).submit();
		}
	}

//-->
</script>
<!-- contents -->
<div id="container">
	<table width="100%" height="290" border="0" cellpadding="1" cellspacing="0">
	
	  <tr>
	    <td align="center" valign="top">
	    <table width="1000" height="124" border="0" cellpadding="0" cellspacing="0">
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
	            <td height="24" align="left" background="../images/sub06/title_line_bg.gif"><img src="/ENG/images/info/ttl_sub05_1_2.gif" width="161" height="24" alt="E-Complaints Mailbox" /></td>
	          </tr>
	          <tr>
	            <td height="40" align="center">&nbsp;</td>
	          </tr>
	
	          <tr>
	            <td align="center" valign="top" background="0">
	
	<script type="text/javascript">
		function do_submit(f) {
	
			if(f.name.value == "") {
				alert("Input write to write input orchid.");
				f.name.focus();
				f.name.select();
				return;
			}
	
	
			if(f.passwd.value=='') {
				alert('Input password to password input orchid.');
				f.passwd.focus();
				return;
			}
	
			if(f.subject.value == "") {
				alert("Input title to title input orchid.");
				f.subject.focus();
				f.subject.select();
				return;
			}
	
			if(f.HTML_BODY.value =="") {
				alert("Input content to content input orchid.");
				f.HTML_BODY.focus();
				return;
			}
	
			if(!checkAllFileExt(f)){
				alert("File is no upload.");
				return;
			}
	
			if(confirm("Submit?")) {
				if (checkBanwd(f.subject) && checkBanwd(f.HTML_BODY)) { //금지어 체킹
					try{
						// 이 라인은 현재 사용 중인 폼에 따라 달라질수 있습니다.
						f.submit();
					}catch(e){}
				}
			}
		}
	
	// 업로드 파일의 확장자 검사
		function filterExtension(obj){
			if( !checkFileExt(obj) ) alert ( "File is no upload." );
		}
	
	// 업로드 파일의 확장자 검사
		function checkFileExt(obj){
			if( obj.value.toLowerCase().match(/(jsp|asp|cgi|php|js|class|java|sh|bat|perl|php3|js%70|exe)$/) ){
				return false;
			}
	
			return true;
		}
	
		function checkAllFileExt(f){
	
	
			return true;
		}
	
	// 금지어 검사 함수
		function checkBanwd(obj) {
		    var banwd = new Array();
	
					banwd[0] = "sex";
	
					banwd[1] = "anal";
	
					banwd[2] = "kiss";
	
					banwd[3] = "porn";
	
					banwd[4] = "porno";
	
					banwd[5] = "hiffkeymmef";
	
					banwd[6] = "Pussy";
	
					banwd[7] = "lesbian";
	
			var len = banwd.length;
		    var content = obj.value;
		    var ban_text = "";
		    var idx = -1;
		    for(i = 0 ; i < len ; i++) {
		        idx = content.indexOf(banwd[i]);
		        if(-1 < idx) {
		            alert("'" + banwd[i] + "' is no submit.");
		            return false;
		        }
		    }
	
			return true;
		}
	</script>
	<script type="text/javascript" src="/neoboard/js/comm.js"></script>
	
	<!-- form -->
	<form name="writeform" method="post" action="http://www.knoc.co.kr/servlet/RegistArticle?bid=ENGQNA&amp;callback=/ENG/sub05/sub05_3.jsp&amp;ses=USERSESSION&amp;grp=" enctype="multipart/form-data">
	<input name="id" type="hidden" value="guest" />
	<input name="virtualno" type="hidden" value="13j3h3k83ho" />
	<input name="html" type="hidden" value="0" />
		<table width="720" border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td>
		
			<table width="720" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td>
				<table width="720" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop">Title</td>
					<td align="left" colspan="3" class="board_titletop2" style="padding: 10px 0 10px 0;"><%=etcutil.checkNull(dataMap.get("SUBJECT").toString())  %></td>
				</tr>
			
				<tr>
					<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3"><label for="htmlBody">Content</label></td>
					<td colspan="3" align="left" class="board_listbott" style="padding: 10px 0 10px 0;">
					<%=etcutil.checkNull(dataMap.get("CONTENTS").toString().replaceAll("\r\n","</br>"))  %>
					</td>
				</tr>
				<tr>
					<td width="80" align="center" bgcolor="#F1F1F1" class="board_titletop3">Password</td>
					<td colspan="3" align="left" class="board_listbott" style="padding: 10px 0 10px 0;">
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
					<%
						if(isUser){
					%>
						<a href="#Modify" onclick="goModifyPage('<%=etcutil.checkNull(dataMap.get("ARTICLE_NID").toString())  %>');return false;"><input type="image" src="/neoboard/skin/skin12/images/btn_modifiy.gif" alt="modifiy" /></a>
					<%
						}
					%>
						<a href="#Delete" onclick="goDeletePage('<%=etcutil.checkNull(dataMap.get("ARTICLE_NID").toString())  %>');return false;"><input type="image" src="/neoboard/skin/skin12/images/btn_delete.gif" alt="delete" /></a>
						<a href="#content" onclick="goListPage();return false;"><input type="image" src="/neoboard/skin/skin12/images/btn_list.gif" alt="list" /></a>
			</td>
			</tr>
			</table>
		</form>
		<!-- form //-->
		
		            </td>
		          </tr>
		          <tr>
		              	<td>
		<div style="height:20px ;"></div>
		<div class="new_officer">
			<table summary="Department Contacts Updated">
			<caption>Department Contacts Updated</caption>
			<tbody>
				<tr>
					<td class="write_day"><!-- strong>Updated : </strong>2016-04-05-->&nbsp;</td>
		       	 	<td class="contact_team"><strong>Department : </strong>Internal Auditing</td>
		        	<td class="contact_tel"><strong>Contacts : </strong>+82)31-380-2132</td>
				</tr>
			</tbody>
			</table>
		</div><!-- new_officer end -->
		              	</td>
		              </tr>
		        </table>
	        </td>
	      </tr>
	    </table>
	    </td>
	  </tr>
	</table>
	</td>
	</tr>
	</table>
</div>
<!-- contents end-->

<form action="list.jsp" method="post" name="form01" id="form01">
	<input type="hidden" name="article_pwd" value="<%=dataMap.get("ARTICLE_PWD") %>">
	<input type="hidden" name="page" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page"))) %>">
	<input type="hidden" name="field" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("field"))) %>">
	<input type="hidden" name="searchValue" value="<%=etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("searchValue"))) %>">			
</form>	

<!-- footer -->
<%@ include file="../include/copyright.jsp" %>
<!-- footer end-->


</body>
</html>