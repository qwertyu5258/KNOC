<%@page import="com.neoboard.data.AttachFile"%>
<%@page import="java.io.File"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.knoc.sitectrl.mgr.MgrSession"%>
<%@page import="java.util.Iterator"%>
<%@page import="kr.co.knoc.gov_public.GovPublicBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.knoc.util.EtcUtil"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>

<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>

<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="govPublicManager" scope="page" class="kr.co.knoc.gov_public.GovPublicManager" />

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
	 	
	
	ArrayList<HashMap<String, String>> govPublicList = govPublicManager.getGovPublicFileList(gov_public_nid, request);
	//ArrayList<GovPublicBean> govPublicList = govPublicManager.getGovPublicList(gpk, pp.getNPage(), pp.getNPageSize(), search_type, search_keyword);
	
	/**
	* 공개목록 기본 정보
	*/
	HashMap<String, Object> hashMap2 = null;
	if(gov_public_nid.length()>0) {
		hashMap2 = govPublicManager.getGovPublicView(Integer.parseInt(gov_public_nid));	
	}

	String title = "";
	String gov_public_kind = "";
	if(hashMap2 != null && !hashMap2.isEmpty()){
		GovPublicBean gb = (GovPublicBean)hashMap2.get("gb");
		title = EtcUtil.checkNull(gb.getTitle());

		if(gb.getGov_public_kind() == 1) { gov_public_kind = "회사현황"; }
		else if(gb.getGov_public_kind() == 2) { gov_public_kind = "HSEQ"; }
		else if(gb.getGov_public_kind() == 3) { gov_public_kind = "감사"; }
		else if(gb.getGov_public_kind() == 4) { gov_public_kind = "사업계획"; }
		else if(gb.getGov_public_kind() == 5) { gov_public_kind = "계약관리"; }
		else if(gb.getGov_public_kind() == 6) { gov_public_kind = "사회공헌"; }
		else if(gb.getGov_public_kind() == 7) { gov_public_kind = "인사복지"; }
		else if(gb.getGov_public_kind() == 8) { gov_public_kind = "예산재무"; }
		else if(gb.getGov_public_kind() == 9) { gov_public_kind = "정보통신"; }
		else if(gb.getGov_public_kind() == 10) { gov_public_kind = "상생협력"; }
		else if(gb.getGov_public_kind() == 11) { gov_public_kind = "석유개발"; }
		else if(gb.getGov_public_kind() == 12) { gov_public_kind = "석유비축"; }
		else if(gb.getGov_public_kind() == 13) { gov_public_kind = "알뜰주유소"; }
		else if(gb.getGov_public_kind() == 14) { gov_public_kind = "석유정보"; }
		else if(gb.getGov_public_kind() == 15) { gov_public_kind = "홍보"; }
	}
%>

<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
    application.setAttribute("gNavMenuDepth1","05");
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
		location.href = "/SiteControl/neoboard/board_05.jsp?gpk=<%=gpk%>&page=<%=nowpage %>&search_type=<%=search_type %>&search_keyword=<%=search_keyword %>";
	}
	function goWriteFn(p_gov_public_nid){
		location.href = "/SiteControl/neoboard/board_05_edit_file.jsp?gpk=<%=gpk%>&page=<%=nowpage %>&search_type=<%=search_type %>&search_keyword=<%=search_keyword %>&gov_public_nid=" + p_gov_public_nid;
	}
	function goModifyFileFn(p_gov_public_nid, gov_public_file_seq){
		location.href = "/SiteControl/neoboard/board_05_edit_file.jsp?gpk=<%=gpk%>&page=<%=nowpage %>&search_type=<%=search_type %>&search_keyword=<%=search_keyword %>&gov_public_nid=" + p_gov_public_nid+"&gov_public_file_seq="+ gov_public_file_seq;
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
									
									<p style="font-weight:bold; margin:0 0 5px 0; color:#333; font-size:12px;">* <%=gov_public_kind%> &gt; <%=title%></p>
									<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
										<colgroup>
										<col width="10%">
										<col width="*">
										<col width="20%">
										<col width="10%">
										<col width="10%">																				
										</colgroup>
										<tr height="25" bgcolor="E7E7E7">
											<td align="center">번호</td>
												
											<td align="center">파일이름</td>											
											<td align="center">등록일</td>											
											<td align="center">첨부파일</td>
											<td align="center">수정</td>																																					
										</tr>
									<%if(govPublicList.size() == 0){ %> 
										<tr height="25" bgcolor="#FFFFFF">
											<td align="center" colspan="5">등록된 자료가 없습니다.</td>
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
											<td align="center"><%=EtcUtil.checkNull(hashMap.get("REG_DATE")) %></td>											
											<td align="center" style="word-break:break-all;">
											<%if(hashMap.containsKey("GOV_PUBLIC_FILE_SEQ") && hashMap.get("GOV_PUBLIC_FILE_SEQ") != null){ %>
												<a href="board_05_filedown.jsp?gov_public_file_seq=<%=EtcUtil.checkNull(hashMap.get("GOV_PUBLIC_FILE_SEQ")) %>">
													<img src="<%=getFileImage(request, EtcUtil.checkNull(hashMap.get("ORG_FILE_NM"))) %>" border="0" width="16" height="16" alt="<%=EtcUtil.checkNull(hashMap.get("ORG_FILE_NM")) %>" />
												</a>
											<%}else{out.print("&nbsp;");} %>
											</td>
											<td align="center" style="word-break:break-all;">
												<a href="#view" onclick ="goModifyFileFn('<%=hashMap.get("GOV_PUBLIC_NID") %>','<%=hashMap.get("GOV_PUBLIC_FILE_SEQ") %>')"><input style="cursor:pointer;" type="button" value="파일수정"></a>
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
											<td bgcolor="#FFFFFF" align="left"><input type="button" value="돌아가기" style="width:80px; padding-top:4px; cursor:pointer;" onclick="goListFn();"></td>
											<td width="100px" height="25" bgcolor="#FFFFFF" align="center"></td>
											<td bgcolor="#FFFFFF" align="right"><input type="button" value="파일추가" style="width:80px; padding-top:4px; cursor:pointer;" onclick="goWriteFn('<%=gov_public_nid %>');"></td>
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