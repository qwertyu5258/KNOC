<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.sitectrl.mgr.*"%>
<%@ page import = "kr.co.knoc.division.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MgrH" scope="page" class="kr.co.knoc.sitectrl.mgr.MgrHelper" />
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "관리자관리";  		// 서브 Depth 제목
    String gNavSubName = "manager";				// 서브 Depth 이름
    String gNavDepthTitle1 = "01"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

	application.setAttribute("gNavMenuDepth1","01");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "관리자정보/권한설정";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");
	String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_word")),"8859_1");
	String key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_gbn")),"8859_1");
	
	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");
	ArrayList al = MgrH.getAdminList(key_gbn, key_word, pp.getNPage(), pp.getNPageSize());		
	
	int count = MgrH.getAdminListCount(key_gbn, key_word);
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">
	function goFind()
	{
		var t = document.schform;
		t.submit();
	}	
	function edit(user_id) {
         	document.bForm.action = 'adminEdit.jsp';
          	document.bForm.userid.value = user_id;
           	document.bForm.submit();
	}
	function jsWrite() {
		location.href = "adminWrite.jsp";
	}
	function jsDelete() {
		var ff = document.bForm;
	    if (!isSelect(document.bForm, "uid")) {
	        alert("삭제할 게시물을 선택하세요.");
	        return;
	    }
	    if (confirm("삭제를 하시겠습니까?")) {	
	    	ff.action = "adminDeleteOk.jsp";
	        ff.submit();
	
	    }
	}
</script>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="195" valign="top">  
<%@ include file = "left.jsp" %>  
</td>  
<td>
채용관리
</td>
</tr>
</table>
<%@ include file="../inc/bottom.jsp" %>	