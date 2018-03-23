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
<% request.setCharacterEncoding("euc-kr"); %>
  
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
		
		if(form.captchaInput.value == ""){
			alert("자동입력방지 단어를 입력하세요.");
			form.captchaInput.focus();
			return;
		}
		
		if(confirm("등록 하시겠습니까?")){
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
					<div class="customer3">					
					<div class="declaration">
						<ul>							
							<li>한국석유공사는 정보통신망 이용촉진 및 정보보호 등에 관한 법률과 개인정보보호법 등 개인정보 관련 법령을 준수하며, 
							개인정보처리방침을 통하여 다음과 같이 개인정보를 수집하여 처리함을 알려드립니다. 
								<BR /><BR />
								<ul class="align_01">
									<li style="text-align:center;">
										<strong>- 다 음 -</strong>										
									</li>
									
									<li>
										<strong>1. 수집하는 개인정보 항목 </strong><BR />
										&nbsp;&nbsp;&nbsp;&nbsp;공사는 다음과 같은 항목들을 수집하여 처리합니다.<BR />
										&nbsp;&nbsp;&nbsp;&nbsp;-성명, 비밀번호, 전화번호, 이메일 
										
									</li>
									
									<li><strong>2. 개인정보의 수집·이용 목적 </strong> <BR />
									&nbsp;&nbsp;&nbsp;&nbsp;-사보 독자참여 게시판 운영 </li>
							
									<li><strong>3. 개인정보의 보유 및 이용기간</strong><BR />
									&nbsp;&nbsp;&nbsp;&nbsp;-보유 기간 : 2개월<BR />
									&nbsp;&nbsp;&nbsp;&nbsp;-보유 근거 : 공사 내부 방침 
									</li>
								
								</ul>
							</li>						
							
						</ul>
					</div>
			        </div>		
					<div id="boardsec">
						<form action="reader_participate_write_ok.jsp" method="post" name="form01" id="form01">
							<input type="hidden" id="questionNo" name="questionNo" value="1" />
							<input type="hidden" id="participate_bbs_seq" name="participate_bbs_seq" value="0" />
							
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
									<td class="td1" colspan="3"><input type="text" value="" id="writer" name="writer" maxlength="50" class="input" style="width:120px;" /></td>
								</tr>
								<tr>
									<th scope="row" class="th1"><label for="bbs_pass">비밀번호</label></th>
									<td class="cnts1" colspan="3">
										<input type="password"" value="" id="bbs_pass" name="bbs_pass" maxlength="12" class="input" style="width:120px;" /> * 비밀번호는 영문/숫자 조합 6자 이상입니다. 
									</td>
								</tr>
								<tr>
									<th scope="row" class="th1"><label for="bbs_cellphone">휴대폰</label></th>
									<td class="td1"><input type="text" value="" id="bbs_cellphone" name="bbs_cellphone" class="input" style="width:200px;" /></td>
									<th scope="row" class="th1"><label for="bbs_email">이메일</label></th>
									<td class="td1"><input type="text" value="" id="bbs_email" name="bbs_email" class="input" style="width:200px;" /></td>
								</tr>
								<tr>
									<th scope="row" class="th1"><label for="begin_title">말머리</label></th>
									<td class="td1" colspan="3">
										<select id="begin_title" name="begin_title" style="width:100px;">
											<option value="">선택</option>
											<option value="qna">퀴즈정답</option>
											<option value="cnq">사보의견</option>
											<option value="cna">사보신청</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th1"><label for="bbs_title">제목</label></th>
									<td class="td1" colspan="3"><input type="text" value="" id="bbs_title" name="bbs_title" class="input" maxlength="200" style="width:100%;" /></td>
								</tr>
								
								<tr>
									<th scope="row" class="th1"><label for="bbs_contents">내&nbsp;&nbsp;용</label></th>
									<td class="cnts1" colspan="3"><textarea name="bbs_contents" id="bbs_contents" cols="120" style="width:100%;height:300px" class="inputST"></textarea></td>
								</tr>
			
							</table>
							
							<div style="border:1px solid #aaa; background-color: #eee; margin-top:5px; height:75px; width:100%;">
								<ul style="width:500px; float:left;">
									<li style="width:500px; font-weight:bold; font-size:11px; padding:5px;">*프로그램을 이용한 자동 입력방지를 위해서 아래의 인증절차를 거치고 있습니다.</li>
									<li style="margin-left:5px; width:120px; float:left;">
										<img id="captchaImg" src="/servlet/Captcha" alt="Captcha Image" style="width:120px; height:40px; border:1px solid #ccc;" />
									</li>
									<li style="font-size:11px; color:#000; position:relative; top:0; left:10px; padding-top:5px; width:375px; float:left;">
										왼쪽에 표시된 숫자와 글자를<br/>대소문자를 구별해서 모두 입력해 주세요:
										<input type="text" name="captchaInput" style="width:60px;" maxlength="6" value="" />
									</li>
								</ul>
							</div>
						</form>		
									
						<div class="boardbtm mtm10">
							<div class="btnsec">
								<a href="#content" onclick="onSubmit();return false;"><input type="image" src="/images/board/btn_ok.gif" alt="확인" /></a>
								<a href="reader_participate_bbs.jsp?question_nid=1"><img src="/images/board/btn_cancel.gif" alt="취소" /></a>
							</div>
						</div>								
							
					</div>	
				</div>
				
				<div class="new_officer">
				<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<colgroup>
					<col width="auto" />
					<col width="22%" />
					<col width="22%" />
				</colgroup>
				<tbody>
					<tr>
						<td><strong>담당부서 : </strong>경영조정실 홍보팀</td>
						<td><strong>연락처 : </strong>031-380-2149</td>
						<td></td>
					</tr>
				</tbody>
				</table>
			</div><!-- new_officer end -->
				
			</div>
		</div>
	
		<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->

	</body>
</html>