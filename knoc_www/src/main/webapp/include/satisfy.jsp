<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
int chkXSS = currentPage.indexOf("<script");
if(chkXSS > -1) { currentPage = "/"; }
%>
<form name="mform" method="post" action="/include/satisfyOk.jsp" onsubmit="document.mform.submit();return false">

<input type="hidden" name="mcode" value="<%=gNavMenuDepth1 %><%=gNavMenuDepth2 %><%=gNavMenuDepth3 %><%=gNavMenuDepth4 %>" />
<input type="hidden" name="user_id" value="<%=uid %>" />
<input type="hidden" name="return_url" value="<%=currentPage %>" />
<!-- 
<div class="satisfy">
	<img src="/images/management/sub02_2_1_im1_1.gif" alt="이 페이지에서 제공하는 정보에 만족하셨습니까?" /> <input name="score" type="radio" id="satisfaction5" value="5" checked="checked"/><label for="satisfaction5"><img src="/images/management/sub02_2_im1.gif" alt="매우만족" /></label> <input name="score" type="radio" id="satisfaction4" value="4"/><label for="satisfaction4"><img src="/images/management/sub02_2_im2.gif" alt="만족"/></label> <input name="score" type="radio" id="satisfaction3" value="3" /><label for="satisfaction3"><img src="/images/management/sub02_2_im3.gif" alt="보통" /></label> <input name="score" type="radio" id="satisfaction2" value="2" /><label for="satisfaction2"><img src="/images/management/sub02_2_im4.gif" alt="불만족" /></label> <input name="score" type="radio" id="satisfaction1" value="1"/><label for="satisfaction1"><img src="/images/management/sub02_2_im5.gif" alt="매우불만족"/></label>
</div>
<div class="satisfy2">
	<label for="satisfy_cmt" class="blindtext">만족도에 대한 글 입력</label><input type="text" id="satisfy_cmt" name="satisfy_cmt" value="" class="input w500" /> <input type="image" src="/images/management/sub02_2_1_im1_btn.gif" alt="확인" />
</div>
-->
<div style="clear:both ; height:5px ;"></div>
<div class="new_satisfy">
	<p>이 페이지에서 제공하는 정보에 <span>만족</span>하셨습니까?</p>
	<div>
		<input name="score" type="radio" id="satisfaction5" value="5" checked="checked"/> <label for="satisfaction5">매우만족</label>
		<input name="score" type="radio" id="satisfaction4" value="4"/> <label for="satisfaction4">만족</label>
		<input name="score" type="radio" id="satisfaction3" value="3" /> <label for="satisfaction3">보통</label>
		<input name="score" type="radio" id="satisfaction2" value="2" /> <label for="satisfaction2">불만족</label>
		<input name="score" type="radio" id="satisfaction1" value="1"/> <label for="satisfaction1">매우불만족</label>
		<label for="satisfy_cmt" class="blindtext">만족도에 대한 글 입력</label><input type="text" id="satisfy_cmt" name="satisfy_cmt" value="" class="input" style="width:270px ; .width:250px ;" /> <input type="image" src="/images/common/btn_satisfy.gif" alt="확인" />
	</div>
</div>

</form>						 