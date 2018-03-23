<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.participate.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="ParticipateBa" scope="page" class="kr.co.knoc.participate.ParticipateManager" />

<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "사보독자참여";  		// 서브 Depth 제목
    String gNavSubName = "neoboard";				// 서브 Depth 이름
    String gNavDepthTitle1 = "04"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

    application.setAttribute("gNavMenuDepth1","03");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "게시판생성";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	int pageNo = etcutil.checkNullInt(etcutil.checkNull(request.getParameter("page")).toString(), 1);  // 보안약점 조치 2016.03.21 ECJ
	
	String schType = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schType")), "8859_1");
	String schText = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schText")), "8859_1");
	
	
	ParticipateManager pbm = new ParticipateManager(); 
	HashMap dataMap = pbm.getParticipateBbsInfo(etcutil.checkNullInt(etcutil.checkNull(request.getParameter("question_nid")).toString(), 0),etcutil.checkNullInt(etcutil.checkNull(request.getParameter("participate_bbs_nid")).toString(), 0));  // 보안약점 조치 2016.03.21 ECJ
%>


<script language=javascript>
<!--
	function goDeletePage(questionSeq,participateSeq){
		if(confirm("정말 삭제하시겠습니까?")){
			document.getElementById("questionSeq").value = questionSeq;
			document.getElementById("participateSeq").value = participateSeq;
			
			document.deleteForm.submit();
		}
	}
//-->
</script>


<jsp:include flush="true" page="../inc/top.jsp" />
	
	<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="195" valign="top">  
			<%@ include file = "left.jsp" %> 
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
												<td><img src="../images/admin_left_03.gif" width="11" height="11"> 게시판 관리 > 사보 독자 참여</td>
												<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">게시판 관리 > 사보 독자 참여</span></td>
											</tr>
											<tr>
												<td height="2" colspan="2" bgcolor="EAEAEC"></td>
											</tr>
										</table>
										
										<table width="100%" height="15"  border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td></td>
											</tr>
										</table>
										
										<form id="deleteForm" name="deleteForm" method="post" action="/SiteControl/neoboard/board_03_delete.jsp" >
											<input type="hidden" id="questionSeq" name="questionSeq" value="" />
											<input type="hidden" id="participateSeq" name="participateSeq" value="" />
										</form>
										
										<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
											<tr height=30>
												<td>사보독자참여 상세 정보</td>
											</tr>
										</table>
										
										<table width="80%"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
											<tr>
												<td width="100px" height="25" bgcolor="E7E7E7" align="center">제 목</td>
												<td bgcolor="#FFFFFF" style="padding-left:10;"><%=etcutil.checkNull(dataMap.get("BBS_TITLE").toString())  %></td>
											</tr>	
											<tr>
												<td width="100px" height="25" bgcolor="E7E7E7" align="center">말머리</td>
												<td bgcolor="#FFFFFF" style="padding-left:10;">
												<%
													if("qna".equals(etcutil.checkNull(dataMap.get("BEGIN_TITLE").toString()))){
														out.println("퀴즈정답");
													}else if("cnq".equals(etcutil.checkNull(dataMap.get("BEGIN_TITLE").toString()))){
														out.println("사보의견");
													}else{
														out.println("사보신청");
													}
												%>
												</td>
											</tr>		
											<tr>
												<td width="100px" height="25" bgcolor="E7E7E7" align="center">글쓴이</td>
												<td bgcolor="#FFFFFF" style="padding-left:10;"><%=etcutil.checkNull(dataMap.get("WRITER").toString())  %></td>
											</tr>
											<tr>
												<td width="100px" height="25" bgcolor="E7E7E7" align="center">비밀번호</td>
												<td bgcolor="#FFFFFF" style="padding-left:10;"><%=etcutil.checkNull(dataMap.get("BBS_PASS").toString())  %></td>
											</tr>
											<tr>
												<td width="100px" height="25" bgcolor="E7E7E7" align="center">휴대폰</td>
												<td bgcolor="#FFFFFF" style="padding-left:10;"><%=etcutil.checkNull(dataMap.get("BBS_CELLPHONE").toString())  %></td>
											</tr>				
											<tr>
												<td width="100px" height="25" bgcolor="E7E7E7" align="center">이메일</td>
												<td bgcolor="#FFFFFF" style="padding-left:10;"><%=etcutil.checkNull(dataMap.get("BBS_EMAIL").toString())  %></td>
											</tr>	
											<tr>
												<td width="100px" height="25" bgcolor="E7E7E7" align="center">내 용</td>
												<td bgcolor="#FFFFFF" style="padding-left:10;"><%=etcutil.checkNull(dataMap.get("BBS_CONTENTS").toString().replaceAll("\r\n","<br />"))  %></td>
											</tr>	
										</table>
										
										<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
											<tr>
												<td height="10"></td>
											</tr>
											<tr>
												<td align="right">
													<table cellSpacing="0" cellPadding="0" border="0" style="color:#4c4c4c;">
														<tr>
															<td>
																<table cellSpacing="0" cellPadding="0" border="0" style="color:#4c4c4c;">
																	<tr>
																		<td>
																			<table cellSpacing="0" cellPadding="0" border="0">
																				<tr height="22">
																					<td></td>
																					<td><input type=button value="목록" onclick="javascript:history.back()"></td>
																					<td></td>
																				</tr>
																			</table>
																		</td>
																	</tr>
																</table>
															</td>
															<td width="15"></td>
															<td>
																<table cellSpacing="0" cellPadding="0" border="0">
																	<tr height="22">
																		<td></td>
																		<td><input type=button onclick="goDeletePage('<%=etcutil.checkNull(dataMap.get("QUESTION_NID").toString())  %>','<%=etcutil.checkNull(dataMap.get("PARTICIPATE_BBS_NID").toString())  %>'); return false;" value="삭제" ></td>
																		<td></td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<tr height=20px>
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
	<%@ include file="../inc/bottom.jsp" %>