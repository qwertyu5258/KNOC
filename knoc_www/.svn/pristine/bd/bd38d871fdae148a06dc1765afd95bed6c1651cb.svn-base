<%@page import="kr.co.knoc.gov_public.GovPublicFileBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.co.knoc.sitectrl.mgr.MgrSession"%>
<%@page import="kr.co.knoc.gov_public.GovPublicBean"%>
<%@page import="kr.co.knoc.util.EtcUtil"%>
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
	String gov_public_nid = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("gov_public_nid")));
	String search_type = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("search_type")));
	String search_keyword = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("search_keyword")));
	
	HashMap<String, Object> hashMap = null;
	
	if(gov_public_nid.length()>0){
		hashMap = govPublicManager.getGovPublicView(Integer.parseInt(gov_public_nid));	
	}
	
	String gov_public_kind = "";
	String title = "";
	String department = "";
	String public_time = "";
	String public_cycle = "";
	String public_link = "";
	
	String gov_public_file_seq = "";
	String org_file_nm = "";
	String save_file_nm = "";
	String file_path = "";
	
	if(hashMap != null && !hashMap.isEmpty()){
		GovPublicBean gb = (GovPublicBean)hashMap.get("gb");
 		GovPublicFileBean gfb = (GovPublicFileBean)hashMap.get("gfb");
		
		gov_public_kind = (gb.getGov_public_kind()>0)?Integer.toString(gb.getGov_public_kind()):"";
		title = EtcUtil.checkNull(gb.getTitle());
		department = EtcUtil.checkNull(gb.getDepartment());
		public_time = EtcUtil.checkNull(gb.getPublic_time());
		public_cycle = EtcUtil.checkNull(gb.getPublic_cycle());
		public_link = EtcUtil.checkNull(gb.getPublic_link());
		
		gov_public_file_seq = (gfb.getGov_public_file_seq()>0)?Integer.toString(gfb.getGov_public_file_seq()):"";
		org_file_nm = EtcUtil.checkNull(gfb.getOrg_file_nm());
		save_file_nm = EtcUtil.checkNull(gfb.getSave_file_nm());
		file_path = EtcUtil.checkNull(gfb.getFile_path());
	}
%>

<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
    application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","01");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>

<jsp:include flush="true" page="../inc/top.jsp" />

<script language="javascript">
	
	function goEditOkFn(){ 
		var fm = document.boardform01;
		if(fm.gov_public_kind.value == ""){
			alert("공개목록구분을 선택하세요.");
			fm.gov_public_kind.focus();
			return;
		}
		if(fm.title.value == ""){
			alert("공개목록을 입력하세요.");
			fm.title.focus();
			return;
		}
		if(fm.department.value == ""){
			alert("담당부서를 입력하세요.");
			fm.department.focus();
			return;
		}
		
		if(confirm((fm.gov_public_nid.value == ""?"등록":"수정")+" 하시겠습니까?")){
			fm.action="board_05_edit_ok.jsp";
			fm.submit();
		}
	}
	
	function goDeleteFn(){
		var fm = document.boardform01;
		if(confirm("삭제 하시겠습니까?")){
			fm.action="board_05_delete.jsp";
			fm.submit();
		}
	}

	function goCancelFn(){
		var fm = document.boardform01;
		location.href="/SiteControl/neoboard/board_05.jsp?gpk=" + fm.gpk.value + "&page=" + fm.page.value + "&search_type=" + fm.search_type.value + "&search_keyword=" + fm.search_keyword.value;
	}
	
	function fileCtl(p_obj){
		var fm = document.boardform01; 
		if(p_obj.checked){
			fm.gov_public_file.disabled = 0;
		}else{
			fm.gov_public_file.disabled = 1;
		}
	}
	
</script>

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="195" valign="top">  
			<%@include file="left.jsp" %> 
		</td>
		<td valign="top">
			<table width="100%" height="200" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td valign="top">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td valign="top">
									<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td><img src="../images/admin_left_03.gif" width="11" height="11">게시판 관리 &gt; 사전정보공개</td>
											<td width="500" align="right" style="padding-right:20;">HOME &gt; <span class="style6">게시판 관리 &gt; 사전정보공개</span></td>
										</tr>
										<tr>
											<td height="2" colspan="2" bgcolor="EAEAEC"></td>
										</tr>
									</table>

									<div style="clear:both; height:45px;"></div>

									<form method="post" name="boardform01" enctype="multipart/form-data">
										
										<input type="hidden" name="gpk" value="<%=gpk %>" />
										<input type="hidden" name="page" value="<%=nowpage %>" />	
										<input type="hidden" name="gov_public_nid"  value="<%=gov_public_nid %>" />
										
										<input type="hidden" name="search_type" value="<%=search_type %>" />
										<input type="hidden" name="search_keyword" value="<%=search_keyword %>" />
									
										<table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
											<tr height="25">
												<td width="120" align="left" bgcolor="#e7e7e7">공개목록구분</td>
												<td colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;">
													<select name="gov_public_kind">
														<option value="" <%="".equals(gov_public_kind)?"selected":"" %>>선택하세요.</option>
														<option value="1" <%="1".equals(gov_public_kind)?"selected":"" %>>회사현황</option>
														<option value="2" <%="2".equals(gov_public_kind)?"selected":"" %>>HSEQ</option>
														<option value="3" <%="3".equals(gov_public_kind)?"selected":"" %>>감사</option>
														<option value="4" <%="4".equals(gov_public_kind)?"selected":"" %>>사업계획</option>
														<option value="5" <%="5".equals(gov_public_kind)?"selected":"" %>>계약관리</option>
														<option value="6" <%="6".equals(gov_public_kind)?"selected":"" %>>사회공헌</option>
														<option value="7" <%="7".equals(gov_public_kind)?"selected":"" %>>인사복지</option>
														<option value="8" <%="8".equals(gov_public_kind)?"selected":"" %>>예산재무</option>
														<option value="9" <%="9".equals(gov_public_kind)?"selected":"" %>>정보통신</option>
														<option value="10" <%="10".equals(gov_public_kind)?"selected":"" %>>상생협력</option>
														<option value="11" <%="11".equals(gov_public_kind)?"selected":"" %>>석유개발</option>
														<option value="12" <%="12".equals(gov_public_kind)?"selected":"" %>>석유비축</option>
														<option value="13" <%="13".equals(gov_public_kind)?"selected":"" %>>알뜰주유소</option>
														<option value="14" <%="14".equals(gov_public_kind)?"selected":"" %>>석유정보</option>
														<option value="15" <%="15".equals(gov_public_kind)?"selected":"" %>>홍보</option>
													</select>
												</td>
											</tr>	
											<tr height="25">
												<td align="left" bgcolor="#e7e7e7">공개목록</td>
											    <td colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;">
											  		<input type="text" name="title" class="input" size="70%" value="<%=title %>" maxlength="200" />
											  	</td>
											</tr>		
											<tr height="25">
											    <td align="left" bgcolor="#e7e7e7">담당부서</td>
											  	<td class="td1" colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;">
											 		<input type="text" name="department" class="input" size="70%" value="<%=department %>" maxlength="200" />
											  	</td>
											</tr>
											<tr height="25">
											  	<td align="left" bgcolor="#e7e7e7">공개시기</td>
											  	<td colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;">
											  		<input type="text" name="public_time" class="input" size="70%" value="<%=public_time %>" maxlength="200"  />
											  	</td>
											</tr>
											<tr height="25">
											  	<td align="left" bgcolor="#e7e7e7">공개주기</td>
											  	<td colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;">
											  		<input type="text" name="public_cycle" class="input" size="70%" value="<%=public_cycle %>" maxlength="200"  />
											  	</td>
											</tr>				
											<tr height="25">
												<td align="left" bgcolor="#e7e7e7">링크</td>
												<td colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;">
													<p style="color:#a7a7a7; margin:0;">※ 직접 파일을 등록하지 않고 링크만 걸 경우, http://www.knoc.co.kr/ 형태의 전체 주소를 입력해주세요.</p>
													<input type="text" name="public_link" class="input" size="70%" value="<%=public_link %>" maxlength="200"  />
												</td>
											</tr>	
											<!-- <tr height="25">
												<td align="left" bgcolor="#e7e7e7">첨부파일</td>
												<td colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10;">
													<input type="file" name="gov_public_file" value="" <%=gov_public_file_seq.length() > 0?"disabled":"" %> />
												<%if(gov_public_file_seq.length() > 0){ %>
													<br /><%=org_file_nm %>
													<input type="checkbox" name="gov_public_file_seq" onclick="fileCtl(this);" style="vertical-align:middle;" value="<%=gov_public_file_seq %>" />
													왼쪽 체크박스를 선택하시면 이미 첨부된 파일은 삭제됩니다.
												<%} %>
												</td>
											</tr>-->	
										</table>
									</form>	
										
									<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td height="10px"></td>
										</tr>
										<tr>
											<td align="left"><input type=button onclick="goCancelFn();" style="width:80px; padding-top:4px; cursor:pointer;"  value="취소" /></td>
											<td align="right">
												<input type=button onclick="goEditOkFn(); return false;" style="width:80px; padding-top:4px; cursor:pointer;" value="<%=gov_public_nid == null || gov_public_nid.length() == 0?"등록":"수정" %>" />
											<%if(gov_public_nid.length() > 0){ %>
												<input type=button onclick="goDeleteFn(); return false;" style="width:80px; padding-top:4px; cursor:pointer;" value="삭제" />
											<%} %>
											</td>
										</tr>
										<tr>
											<td height="30px"></td>
										</tr>
									</table>
									
								<%if(gov_public_nid != null && gov_public_nid.length() > 0){ %>
									<dl style="background-color:#dff2ff; padding:20px 30px 20px 0; line-height:1.5em; color:#000; ">
										<dd>* 첨부파일을 교체하고 싶은 경우 첨부파일 아래부분의 체크 박스를 선택하고 새로 등록하실 파일을 찾아보기 버튼을 클릭하여 선택하신 후 표 우측 하단의  '수정' 버튼을 클릭하시기 바랍니다. </dd>
										<dd style="margin-top:8px;">* 표 우측 하단의 삭제 버튼의 경우  클릭 시 해당 게시물이 전체가 삭제되므로 해당 페이지에서는 게시물의 삭제를 원하시는 경우에만 '삭제' 버튼을 클릭하시기 바랍니다.</dd>
									</dl>
								<%} %>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<br /><br /><br /><br />

<%@ include file="../inc/bottom.jsp" %>