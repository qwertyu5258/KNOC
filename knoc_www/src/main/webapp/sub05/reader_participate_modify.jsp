<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.participate.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="ParticipateBa" scope="page" class="kr.co.knoc.participate.ParticipateManager" />
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","11");
	application.setAttribute("gNavMenuDepth2","05");
	application.setAttribute("gNavMenuDepth3","04");
	application.setAttribute("gNavMenuDepth4","01");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%> 
<%   
 	request.setCharacterEncoding("euc-kr"); 

	int pageNo = etcutil.checkNullInt(request.getParameter("page").toString(), 1);
	
	String schType = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schType")), "8859_1");
	String schText = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schText")), "8859_1");
	
	ParticipateManager pbm = new ParticipateManager(); 
	HashMap dataMap = pbm.getParticipateBbsInfo(etcutil.checkNullInt(request.getParameter("question_nid").toString(), 0),etcutil.checkNullInt(request.getParameter("participate_bbs_nid").toString(), 0));
%>  
  
<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<div id="contentsLayer">
<%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->

<script type="text/javascript">
<!--
	
	function onSubmit(){
		
		var form = document.form01;
		
		if(document.getElementById("writer").value == ""){
			alert("성명를 입력해 주세요.");
			document.getElementById("writer").focus();
			return;
		}
		
		if(document.getElementById("bbs_pass").value == ""){
			alert("비밀번호를 입력해 주세요.");
			document.getElementById("bbs_pass").focus();
			return;
		}
		if(document.getElementById("bbs_pass").value.length < 6){
			alert("비밀번호는 6자 이상 입력해야 합니다.");
			document.getElementById("bbs_pass").focus();			
			return;
		}
		if(!check_pwd(document.getElementById("bbs_pass").value)){
			alert('비밀번호는 영문 숫자를 반드시 혼용하여야만합니다.');
			document.getElementById("bbs_pass").focus();			
			return;
		}
		
		if(document.getElementById("bbs_cellphone").value == ""){
			alert("휴대폰 번호를 입력해 주세요.");
			document.getElementById("bbs_cellphone").focus();
			return;
		}
		
		if(document.getElementById("bbs_email").value == ""){
			alert("이메일을 입력해 주세요.");
			document.getElementById("bbs_email").focus();
			return;
		}
		
		if(form.begin_title.options[form.begin_title.selectedIndex].value == ""){
			alert("말머리를 선택해주세요");
			return;
		}
		
		if(document.getElementById("bbs_title").value == ""){
			alert("제목을 입력해 주세요.");
			document.getElementById("bbs_title").focus();
			return;
		}
		
		if(document.getElementById("bbs_contents").value == ""){
			alert("내용을 입력해 주세요.");
			document.getElementById("bbs_contents").focus();
			return;
		}
		
		if(confirm("수정 하시겠습니까?")){
			form.submit();
		}
	}
	
	
	function check_pwd(str) {
		var reg = new RegExp("^[0-9a-zA-Z]+$");
		var reg2 = new RegExp("[0-9]+");
		var reg3 = new RegExp("[a-zA-Z]+");
		return reg.test(str) && reg2.test(str) && reg3.test(str);
	}

//-->
</script>
					<div id="rightarea">
						<div id="subcnts">
							<%@include file="/include/subtop_11.jsp"%>
							<!--// location: start //-->
							<div class="locadv">
								<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
								&gt; <span>사이버홍보실</span> &gt; <span>홍보간행물</span> &gt; <span>사보 - 석유사랑</span> &gt; <span class="locanow">사보독자참여</span>
							</div>
							<!--// location: end //-->
							
							<div class="pagetle">
								<h3 class="tleimg"><img src="/images/information/sabo_tit.gif" alt="사보독자참여" /></h3>
							</div>
							
					<div id="boardsec">
						<form action="reader_participate_write_ok.jsp" method="post" name="form01" id="form01">
							<input type="hidden" id="questionNo" name="questionNo" value="1" />
							<input type="hidden" id="participate_bbs_seq" name="participate_bbs_seq" value="<%=etcutil.checkNull(dataMap.get("PARTICIPATE_BBS_NID").toString())  %>" />
							<input type="hidden" id="page" name="page" value="<%=pageNo %>" />
							<input type="hidden" id="schType" name="schType" value="<%=schType %>" />
							<input type="hidden" id="schText" name="schText" value="<%=schText %>" />
							
							<table cellspacing="0" cellpadding="0" class="viewtype" summary="사보 독자 참여게시판의 상세정보를 입력합니다.">
								<caption>사보 독자 참여 글쓰기</caption>
								<colgroup>
									<col width="100px" />
									<col width="260px" />
									<col width="100px" />
									<col width="260px" />
								</colgroup>			
								<tr>
									<th scope="row" class="th1"><label for="writer">성명</label></th>
									<td class="td1" colspan="3"><input type="text" value="<%=etcutil.checkNull(dataMap.get("WRITER").toString())  %>" id="writer" name="writer" maxlength="50" class="input" style="width:120px;" /></td>
								</tr>
								<tr>
									<th scope="row" class="th1"><label for="bbs_pass">비밀번호</label></th>
									<td class="cnts1" colspan="3">
										<input type="password"" value="<%=etcutil.checkNull(dataMap.get("BBS_PASS").toString())  %>" id="bbs_pass" name="bbs_pass" maxlength="12" class="input" style="width:120px;" /> * 비밀번호는 영문/숫자 조합 6자 이상입니다. 
									</td>
								</tr>
								<tr>
									<th scope="row" class="th1"><label for="bbs_cellphone">휴대폰</label></th>
									<td class="td1"><input type="text" value="<%=etcutil.checkNull(dataMap.get("BBS_CELLPHONE").toString())  %>" id="bbs_cellphone" name="bbs_cellphone" class="input" style="width:200px;" /></td>
									<th scope="row" class="th1"><label for="bbs_email">이메일</label></th>
									<td class="td1"><input type="text" value="<%=etcutil.checkNull(dataMap.get("BBS_EMAIL").toString())  %>" id="bbs_email" name="bbs_email" class="input" style="width:200px;" /></td>
								</tr>
								<tr>
									<th scope="row" class="th1"><label for="begin_title">말머리</label></th>
									<td class="td1" colspan="3">
										<select id="begin_title" name="begin_title" style="width:100px;">
											<option value="">선택</option>
											<option value="qna" <%if("qna".equals(etcutil.checkNull(dataMap.get("BEGIN_TITLE").toString()))){out.print("selected");}%>>퀴즈정답</option>
											<option value="cnq" <%if("cnq".equals(etcutil.checkNull(dataMap.get("BEGIN_TITLE").toString()))){out.print("selected");}%>>사보의견</option>
											<option value="cna" <%if("cna".equals(etcutil.checkNull(dataMap.get("BEGIN_TITLE").toString()))){out.print("selected");}%>>사보신청</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th1"><label for="bbs_title">제목</label></th>
									<td class="td1" colspan="3"><input type="text" value="<%=etcutil.checkNull(dataMap.get("BBS_TITLE").toString())  %>" id="bbs_title" name="bbs_title" class="input" maxlength="200" style="width:100%;" /></td>
								</tr>
								
								<tr>
									<th scope="row" class="th1"><label for="bbs_contents">내&nbsp;&nbsp;용</label></th>
									<td class="cnts1" colspan="3"><textarea name="bbs_contents" id="bbs_contents" cols="120" style="width:100%;height:300px" class="inputST"><%=etcutil.checkNull(dataMap.get("BBS_CONTENTS").toString())  %></textarea></td>
								</tr>
			
							</table>
						</form>		
									
						<div class="boardbtm mtm10">
							<div class="btnsec">
								<a href="#content" onclick="onSubmit(); return false;"><input type="image" src="/images/board/btn_ok.gif" alt="확인" /></a>
								<a href="reader_participate_bbs.jsp?question_nid=1"><img src="/images/board/btn_cancel.gif" alt="취소" /></a>
							</div>
						</div>								
							
					</div>	
				</div>
			</div>
		</div>
	
		<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

	</body>
</html>