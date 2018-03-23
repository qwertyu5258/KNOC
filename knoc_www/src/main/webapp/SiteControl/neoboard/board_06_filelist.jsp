<%@page import="com.neoboard.data.AttachFile"%>
<%@page import="java.io.File"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.knoc.sitectrl.mgr.MgrSession"%>
<%@page import="java.util.Iterator"%>
<%@page import="kr.co.knoc.gov_public.GovPublicBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.knoc.util.EtcUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>

<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>

<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="govPublicManager" scope="page" class="kr.co.knoc.gov_public_test.GovPublicManager" />

<% request.setCharacterEncoding("euc-kr"); %>

<%
	MgrSession ms = (MgrSession)request.getSession().getAttribute("ADMINSESSION");
	if(ms == null || (ms != null && (Integer.parseInt(ms.getUserLevel()) > 5))){
		out.print("<script>alert('접근권한이 없습니다.');history.back();</script>");
	}
%>

<%
	String gpk = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("gpk")));
	String nowpage = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("page")));
	
	String search_type = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("search_type")));
	String search_keyword = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("search_keyword")));
	String gov_public_nid = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("gov_public_nid")));
	
	ArrayList<HashMap<String, String>> govPublicList = govPublicManager.getGovPublicFileList(gov_public_nid);
	//ArrayList<GovPublicBean> govPublicList = govPublicManager.getGovPublicList(gpk, pp.getNPage(), pp.getNPageSize(), search_type, search_keyword);
	
	
%>

<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
    application.setAttribute("gNavMenuDepth1","06");
	application.setAttribute("gNavMenuDepth2","01");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>

<%!
	private String getFileImage(HttpServletRequest request, String fileName){
		
		String imgFileNm = fileName.toLowerCase();
		String mime = "";
		String imgSrc = "";
		
		if(imgFileNm.lastIndexOf(".") > -1)
	    	mime = imgFileNm.substring(imgFileNm.lastIndexOf(".")+1);
	    else
	    	mime = "unknown";
	    
	    if(AttachFile.containsMime(mime))
	    	imgSrc = "/neoboard/skin/skin01/images/mime_" + mime + ".gif";
	    else
	    	imgSrc = "/neoboard/skin/skin01/images/mime_unknown.gif";
	    
		return imgSrc;
	}
%>

<jsp:include flush="true" page="../inc/top.jsp" />

<script language=javascript>
	
	function goListFn(){
		location.href = "/SiteControl/neoboard/board_06.jsp?gpk=<%=gpk%>&page=<%=nowpage %>&search_type=<%=search_type %>&search_keyword=<%=search_keyword %>";
	}
	function goWriteFn(p_gov_public_nid){
		location.href = "/SiteControl/neoboard/board_06_edit_file.jsp?gpk=<%=gpk%>&page=<%=nowpage %>&search_type=<%=search_type %>&search_keyword=<%=search_keyword %>&gov_public_nid=" + p_gov_public_nid;
	}
	function goModifyFileFn(p_gov_public_nid, gov_public_file_seq){
		location.href = "/SiteControl/neoboard/board_06_edit_file.jsp?gpk=<%=gpk%>&page=<%=nowpage %>&search_type=<%=search_type %>&search_keyword=<%=search_keyword %>&gov_public_nid=" + p_gov_public_nid+"&gov_public_file_seq="+ gov_public_file_seq;
	}
</script>

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="195" valign="top">  
			<jsp:include flush="true" page="left.jsp"/>    
		</td>
		<td valign="top">
			<table width="100%" height="200"  border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td valign="top">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td valign="top">
									<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td><img src="../images/admin_left_03.gif" width="11" height="11"> 게시판 관리 &gt; 사전정보공개</td>
											<td width="500" align="right" style="padding-right:20;">HOME &gt; <span class="style6">게시판 관리 &gt; 사전정보공개</span></td>
										</tr>
										<tr>
											<td height="2" colspan="2" bgcolor="EAEAEC"></td>
										</tr>
									</table>
									<table width="100%" height="15" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td></td>
										</tr>
									</table>
									
									
									<div style="clear:both; height:6px;"></div>
									
									<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
										<colgroup>
											<col width="30px">
											<col width="200px">
											<col width="200px">
											<col width="100px">
											<col width="30px">
											<col width="30px">																				
										</colgroup>
										<tr height="25" bgcolor="E7E7E7">
											<td align="center">번호</td>
											<td align="center">공표제목</td>																						
											<td align="center">파일이름</td>											
											<td align="center">등록일</td>											
											<td align="center">첨부파일</td>
											<td align="center">수정</td>																																					
										</tr>
									<%if(govPublicList.size() == 0){ %> 
										<tr height="25" bgcolor="#FFFFFF">
											<td align="center" colspan="6">등록된 자료가 없습니다.</td>
										</tr>
									<% 
										}else{
											int fileNum = govPublicList.size();
											Iterator<HashMap<String, String>> iter = govPublicList.iterator();
											while(iter.hasNext()){
												HashMap<String, String> hashMap = (HashMap<String, String>)iter.next();
									%>
										<tr height="25" bgcolor="#FFFFFF">
											<td align="center"><%=fileNum %></td>
											<td align="left" style="padding-left:10px;"><%=EtcUtil.checkNull(hashMap.get("FILE_TITLE")) %></td>
											<td align="left" style="padding-left:10px;"><%=EtcUtil.checkNull(hashMap.get("ORG_FILE_NM")) %></td>
											<td align="center"><%=EtcUtil.checkNull(hashMap.get("REG_DATE")) %></td>											
											<td align="center" style="word-break:break-all;">
											<%if(hashMap.containsKey("GOV_PUBLIC_FILE_SEQ") && hashMap.get("GOV_PUBLIC_FILE_SEQ") != null){ %>
												<a href="board_06_filedown.jsp?gov_public_file_seq=<%=EtcUtil.checkNull(hashMap.get("GOV_PUBLIC_FILE_SEQ")) %>">
													<img src="<%=getFileImage(request, EtcUtil.checkNull(hashMap.get("ORG_FILE_NM"))) %>" border="0" width="16" height="16" alt="<%=EtcUtil.checkNull(hashMap.get("ORG_FILE_NM")) %>" />
												</a>
											<%}else{out.print("&nbsp;");} %>
											</td>
											<td align="center" style="word-break:break-all;">
												<a href="#view" onclick ="goModifyFileFn('<%=hashMap.get("GOV_PUBLIC_NID") %>','<%=hashMap.get("GOV_PUBLIC_FILE_SEQ") %>')"><input style="cursor:pointer;" type="button" value="수정"></a>
											</td>								
										</tr>
									<%				
												fileNum--;
											}
										}
									%>	
									</table>
									<br />
									<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="B5B5B5">
										<tr>
											<td bgcolor="#FFFFFF" align="left"><input type="button" value="목록" style="width:80px; padding-top:4px; cursor:pointer;" onclick="goListFn();"></td>
											<td width="100px" height="25" bgcolor="#FFFFFF" align="center"></td>
											<td bgcolor="#FFFFFF" align="right"><input type="button" value="등록" style="width:80px; padding-top:4px; cursor:pointer;" onclick="goWriteFn('<%=gov_public_nid %>');"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr height="20px"></tr>
			</table>			
		</td>
	</tr>
</table>

<jsp:include flush="true" page="../inc/bottom.jsp"/>