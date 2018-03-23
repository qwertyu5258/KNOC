<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />    
<% 
String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
String sague_nid = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("sague_nid")));

    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","02");
	application.setAttribute("gNavMenuDepth3","01");
	application.setAttribute("gNavMenuDepth4","08");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	
	
%>        
<%@include file="/include/comheader.jsp"%>
<script type="text/javascript">
function goListPage(p_page){
	location.href= "./sub02_2_1_8_list.jsp?page="+p_page;
}

function goCommentExec(p_sague_nid){
	
	if(document.getElementById("user_name").value == ""){
		alert("제출기관(제출자)을 작성해 주세요.");
		document.getElementById("user_name").focus();
		return;
	}
	
	if(document.getElementById("tel_01").value == ""){
		alert("전화번호를 입력해 주세요.");
		document.getElementById("tel_01").focus();
		return;
	}
	
	if(document.getElementById("tel_02").value == ""){
		alert("전화번호를 입력해 주세요.");
		document.getElementById("tel_02").focus();
		return;
	}
	
	if(document.getElementById("tel_03").value == ""){
		alert("전화번호를 입력해 주세요.");
		document.getElementById("tel_03").focus();
		return;
	}
	
	if(document.getElementById("user_opinion").value == ""){
		alert("제출의견을 작성해 주세요.");
		document.getElementById("user_opinion").focus();
		return;
	}
	
	if(confirm("의견을 등록하시겠습니까?")){
		document.commentForm.submit();	
	}
}

function getsize(str){
	var comment_byte = document.getElementById("comment_byte");
    var chk = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_0123456789\~!@#$%^&*()_+| ";
    var length = 0;
    var sub_length = 0;
 	//var Str = "";
    
    for(var i=0; i<str.length; i++){
         if(chk.indexOf(str.charAt(i)) >= 0 ){
                length++;
         }else{
                length+=2;
         }
    }
    
    comment_byte.innerHTML = length;
    if(length > 1200){
     alert("댓글은 1200byte 이상 초과하실수 없습니다.");
     for(var i=0; i<str.length; i++){
         if(chk.indexOf(str.charAt(i)) >= 0 ){
        	 sub_length++;
         }else{
        	 sub_length+=2;
         }
         if(sub_length  > 1199){
      	 	document.getElementById("user_opinion").value = document.getElementById("user_opinion").value.substring(0,1200);
      	 	comment_byte.innerHTML = "1200";
      	 	return false;
      } 
    }
     //$('comment_comtents').value.substring(0,200);
	  	//document.getElementById("user_opinion").value = document.getElementById("user_opinion").value.substring(0,200);
	  	//$('user_opinion').value = $('user_opinion').value.suubstring(0,100);
    }
   //document.form01.txt_length.value = length;
}

</script>

	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->
<%
String user_nm = "";
String vertuarno = "";
if (uid == "" || "".equals(uid)){
%>
<script type="text/javascript">
	alert("아이핀(인터넷주민번호대체수단) 또는 회원 ID로 로그인 후 이용해 주십시오.");
	location.href= "/member/login.jsp?returnURL=/sub02/sub02_2_1_8_form.jsp?sague_nid=<%=sague_nid%>";
</script>
<%			
}else{
	user_nm = ses.getUserName();
	vertuarno = ses.getUserVirtualno();
} %>
	<div id="contents">
    	<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_02.jsp"%>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>열린경영</span>
                    &gt; <span>경영공시</span>
					&gt; <span>일반현황</span>
					&gt; <span class="locanow">사규 제·개정 예고</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h3><img src="/images/management/ttl_sub02_2_1.gif" alt="일반현황" /></h3>
				</div>
				<!--시작-->
				<div class="status">
					<h4><img src="/images/management/tit_2_2_1_8.gif" alt="사규 제·개정 예고"/></h4>				
				</div>
				<div class="rules">
					
					<fieldset>
					<legend>사규 제·개정 예고 의견 등록</legend>
					<form id="commentForm" name="commentForm" method="post" action="./sub02_2_1_8_comment_exec.jsp">
					<input type="hidden" id="sague_nid" name="sague_nid" value="<%=sague_nid %>" />
					<table class="cr_view" summary="사규 제·개정 예고 의견 등록">
					<caption>사규 제·개정 예고 의견 등록</caption>
					<colgroup>
						<col width="20%" />
						<col width="30%" />
						<col width="20%" />
						<col width="30%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">의견제출 대상 규정</th>
							<td colspan="3">영업규정</td>
						</tr>
						<tr>
							<th scope="row"><label for="user_name">제출기관(제출자)</label></th>
							<td>
								<input type="text" id="user_name" name="user_name" class="s_01" value="<%=user_nm %>" readonly/>
								<input type="hidden" id="vertuar_no" name="vertuar_no" value="<%=vertuarno %>" />
							</td>
							<th scope="row"><label for="tel_no">전화번호</label></th>
							<td>
								<input type="text" id="tel_01" name="tel_01" class="s_02" /> -
								<input type="text" title="전화번호 중간자리 입력" id="tel_02" name="tel_02" class="s_02" /> -
								<input type="text" title="전화번호 마지막자리 입력" id="tel_03" name="tel_03" class="s_02" />
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="user_opinion">제출의견<br />(건의,대안제시 등)</label></th>
							<td colspan="3">
								<p class="byte">현재 <span id="comment_byte" >0</span> / 최대1200byte(최대입력 글자수는 공백포함 한글600자입니다.)</p>
								<textarea rows="0" cols="0" id="user_opinion" name="user_opinion" onkeyup ="getsize(this.value);"></textarea>
							</td>
						</tr>
					</tbody>
					</table>
					</form>
					
					<div class="r_btn">
						<a href="#goListPage" onclick="goListPage('<%=nowpage%>'); return false;"><img src="/images/management/btn_list08.gif" alt="목록" /></a>
						<a href="#goCommentExec" onclick="goCommentExec('<%=sague_nid%>');"><img src="/images/management/btn_ragist08.gif" alt="의견 등록하기" /></a>
					</div>
					</fieldset>
				
				</div><!-- rules end -->
	
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
							<td><strong>담당부서 : </strong>기획조정실 기획관리팀</td>
							<td><strong>연락처 : </strong>031-380-2567</td>
							<td></td>
						</tr>
					</tbody>
					</table>
				</div><!-- new_officer end -->
				<!-- div class="infoCheck"><%@include file="/include/satisfy_link.jsp"%></div-->	
				<!--//끝-->
			</div>
		</div>
	</div>
	
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>
</body>
</html>