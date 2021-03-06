<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.neoboard.data.*, com.neoboard.* , com.neoboard.session.*, com.neoboard.tags.JUtil, com.neoboard.util.* " %>
<%@taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>

<jsp:useBean id="bm" class="com.neoboard.NeoBoardManager" scope="page" />
<jsp:useBean id="etcutil" scope="page" class="com.neoboard.util.EtcUtil" />
<%
	String sessionName = (String)pageContext.getAttribute("NB_SESNAME",PageContext.REQUEST_SCOPE);

	UserSession userSession = null;
	if(sessionName == null || sessionName.equals(""))
		userSession = (UserSession)session.getAttribute("USERSESSION");
	else
		userSession = (UserSession)session.getAttribute(sessionName);

	PageAttribute pageBean = (PageAttribute)pageContext.getAttribute("NB_PAGE",PageContext.REQUEST_SCOPE);

	Search schBean = (Search)pageContext.getAttribute("NB_SEARCH",PageContext.REQUEST_SCOPE);

	Property propBean = (Property)pageContext.getAttribute("NB_PROPERTY",PageContext.REQUEST_SCOPE);

	Authority authBean = (Authority)pageContext.getAttribute("NB_AUTHORITY",PageContext.REQUEST_SCOPE);

	String skinRoot = Property.SKIN_URL_IMG + "/" + propBean.getSkinID();
	String neoRoot = Property.ROOT_URL;

	/*
		::: rtype :::
		민원(부조리) 사항: MW
		불법하도급 신고: IL
		공익 신고: PU
	*/
	String rtype = EtcUtil.checkNull(request.getParameter("rtype"));
%>

<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

	function do_submit(f) {

		if(!f.agree.checked) {
			alert("개인정보 수집 동의를 하셔야합니다.");
			f.agree.focus();
			return;
		}


		if(f.subject.value == "") {
			alert("글 제목을 입력해 주시기 바랍니다.");
			f.subject.focus();
			f.subject.select();
			return;
		}

		if(f.name.value == "") {
			alert("성명을 입력해 주시기 바랍니다.");
			f.name.focus();
			f.name.select();
			return;
		}


		if(f.passwd.value=='') {
			alert("비밀번호를 입력해 주시기 바랍니다.");
			f.passwd.focus();
			return;
		}
		/**
		if(f.HTML_BODY.value =="") {
			alert("글 내용을 입력해 주시기 바랍니다.");
			f.HTML_BODY.focus();
			return;
		}
		**/
		if(!checkAllFileExt(f)){
			alert("선택하신 파일은 업로드 할 수 없습니다.");
			return;
		}

		if(confirm("글을 등록하시겠습니까?")) {

			oEditors.getById["HTML_BODY"].exec("UPDATE_IR_FIELD", []);
			// 에디터의 내용에 대한 값 검증은 이곳에서 textarea 필드인 ir1의 값을 이용해서 처리하면 됩니다.

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
		if( !checkFileExt(obj) ) alert ( "선택하신 파일은 업로드 하실 수 없습니다. 다시 선택해주세요" );
	}

	// 업로드 파일의 확장자 검사
	/**
	* 2016. 03. 21 / MYM
	* 보안약점 조치
	*/
	function checkFileExt(obj){
		<%
		String strDefaultNotAllowedExtension = propBean.getDefaultNotAllowedExtension();
		if(strDefaultNotAllowedExtension == null) { strDefaultNotAllowedExtension = ""; }
		strDefaultNotAllowedExtension = strDefaultNotAllowedExtension.replaceAll(",","|");
		%>
		if( obj.value.toLowerCase().match(/(<%=strDefaultNotAllowedExtension%>)$/) ){
			return false;
		}

		return true;
	}

	function checkAllFileExt(f){
	<%for( int i = 1 ; i <= propBean.getMaxFileAttach() ; i++) {%>
		if ( f.file<%=i%>.value != "" ){
			if(!checkFileExt(f.file<%=i%>) ) return false;
		}
	<%}%>

		return true;
	}

// 금지어 검사 함수
	function checkBanwd(obj) {
	    var banwd = new Array();
<%
	    String[] banwd_ar;
		if (propBean.getBanwd() != null && !propBean.getBanwd().equals("")){
			banwd_ar = propBean.getBanwd().split(",");
			for (int i = 0; i < banwd_ar.length; i++) {
%>
				banwd[<%=i%>] = "<%=banwd_ar[i]%>";
<%
			}
%>
		var len = banwd.length;
	    var content = obj.value;
	    var ban_text = "";
	    var idx = -1;
	    for(i = 0 ; i < len ; i++) {
	        idx = content.indexOf(banwd[i]);
	        if(-1 < idx) {
	            alert("'" + banwd[i] + "'는(은) 등록할 수 없는 단어입니다.");
	            return false;
	        }
	    }
<%
		}
%>
		return true;
	}

	function openZipcode() {

//		window.open("/member/pop_post.jsp","pop_post","width=362,height=280,scrollbars=yes");
		
		new daum.Postcode({
			oncomplete: function(data) {

            var fullAddr = ''; // 최종 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }				

  		 	document.getElementById('zipno1').value = data.zonecode; //5자리 새우편번호 사용
  		 	document.getElementById('addr1').value = fullAddr;
  		 	document.getElementById('addr2').focus();

			}
		}).open();

	}

	function setZipcode(zipcode1,zipcode2,addr1) {
		document.writeform.zipno1.value = zipcode1;
		document.writeform.addr1.value = addr1;
	}

</script>
<script type="text/javascript" src="/neoboard/js/comm.js"></script>
<!-- SmartEditor 삽입 -->
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<!-- form -->
<div id="boardsec">
<form name="writeform" method="post" action="<%=etcutil.SSL_DOMAIN_URL%><%=Property.SERVLET_ROOT%>/RegistArticle?bid=<%=propBean.getBoardID()%>&amp;callback=<%=pageBean.getPageUrl()%>&amp;ses=<%=sessionName%>&amp;grp=<%=schBean.getGroup()%>" enctype="multipart/form-data">
<input name="id" type="hidden" value="<%= userSession==null ? "":userSession.getUserID()%>" />
<input name="virtualno" type="hidden" value="<%= userSession==null ? "":userSession.getUserVirtualno()%>" />
<input name="secret" type="hidden" value="1" />
	<table cellspacing="0" cellpadding="0" class="viewtype" summary="<%=propBean.getBoardName() %>에 게시물을 등록합니다">
	<caption><%=propBean.getBoardName() %>게시물등록</caption>
	<colgroup><col width="110px" /><col width="130px" /><col width="110px" /><col width="130px" /><col width="110px" /><col width="130px" /></colgroup>
		<tbody>
		<tr>
			<th scope="row" class="th1"><label for="name">* 성명</label></th>
			<td class="td1"><input type="text" id="name" name="name" class="input" style="width:110px;" value="<%= userSession==null ? "":userSession.getUserName() %>" maxlength="32" <%if(userSession!=null && propBean.getUseAuth().equals("1")) { %>readonly="readonly"<% } %> /></td>
                        <th scope="row" class="th1"><label for="passwd">* 비밀번호</label></th>
			<td class="td1" colspan="3"><input type="password" value="" id="passwd" name="passwd" class="input" style="width:110px;" maxlength="16" /></td>
                        <!--<th scope="row" class="th1"><label for="subjtxt">비밀번호 확인</label></th>
			<td class="td1"><input type="password" value="" id="passwd" name="passwd" class="input" style="width:110px;" /></td>-->
		</tr>
		<tr>
			<th scope="row" class="th1"><label for="tel1">전화번호(선택)</label></th>
			<td class="td1"><input type="text" value="" id="tel1" name="tel1" class="input" style="width:25px;" maxlength="3" title="지역번호"/> - <input type="text" value="" id="tel2" name="tel2" class="input" style="width:25px;" maxlength="4" title="국번"/> - <input type="text" value="" id="tel3" name="tel3" class="input" style="width:25px;" maxlength="4" title="전화번호 끝자리"/></td>
			<th scope="row" class="th1"><label for="email">이메일(선택)</label></th>
			<td class="td1" colspan="3"><input type="text" value="" id="email" name="email" class="input" style="width:150px;" maxlength="200" /></td>
		</tr>
		<tr>
			<th scope="row" class="th1" rowspan="3"><label for="zipno1">주소</label></th>
			<td class="td1" colspan="5"><input type="text" value="" id="zipno1" name="zipno1" class="input" style="width:60px;" maxlength="3" readonly onclick="openZipcode();"  title="우편번호 앞자리"/> <a href="/member/pop_post.jsp" target="_blank" onclick="openZipcode(); return false;"><img src="<%=skinRoot %>/images/btn_se.gif" align="top" alt="우편번호찾기" /></a></td>
		</tr>
		<tr>
	         <td class="td1" colspan="5"><input type="text" value="" id="addr1" name="addr1" maxlength="200" class="input" style="width:580px;" readonly onclick="openZipcode();" title="기본주소"/></td>
		</tr>
	    <tr>
	         <td class="td1" colspan="5"><input type="text" value="" id="addr2" name="addr2" maxlength="200" class="input" style="width:580px;" title="나머지 주소" /></td>
		</tr>
		<tr>
			<th scope="row" class="th1"><label for="job">직업</label></th>
			<td class="td1" colspan="5">
			<select name="job" id="job">
			<option selected="selected" value="초/중/고생">초/중/고생</option>
		  <option value="대학(원)생">대학(원)생</option>
		  <option value="공무원">공무원</option>
		  <option value="자영업">자영업</option>
		  <option value="직장인">직장인</option>
		  <option value="언론인">언론인</option>
		  <option value="교직자">교직자</option>
		  <option value="법조인">법조인</option>
		  <option value="의료인">의료인</option>
		  <option value="예술인">예술인</option>
		  <option value="군인">군인</option>
		  <option value="무직">무직</option>
		  <option value="기타">기타</option>
			</select></td>
		</tr>
		<tr>
			<th scope="row" class="th1"><label for="contGubun">분류</label></th>
			<td class="td1" colspan="5">
			<%if("MW".equals(rtype)){ %>
				<label for="contGubun1">사이버민원</label>
				<input type="radio" id="contGubun1" name="contGubun" value="사이버민원" checked="checked" />
				<label for="contGubun2">부조리신고</label>
				<input type="radio" id="contGubun2" name="contGubun" value="부조리신고" />

			<%}else if("IL".equals(rtype)){ %>
				불법하도급 신고
				<input type="hidden" name="contGubun" value="불법하도급 신고" />

			<%}else if("PU".equals(rtype)){ %>
				공익신고
				<input type="hidden" name="contGubun" value="공익신고" />
			<%} %>
			</td>
		</tr>
		<tr>
			<th scope="row" class="th1"><label for="subjtxt">제목</label></th>
			<td class="td1" colspan="5"><input type="text" value="" id="subjtxt" name="subject" class="input" style="width:570px;" maxlength="<%=propBean.getMaxSubjectLength()%>" /></td>
		</tr>
		<% if ( propBean.getUseGroup().equals("1")) { %>
		<!--  그룹 시작  -->
		<tr>
			<th scope="row" class="th1"><label for="grp">그룹선택</label></th>
			<td class="td1" colspan="5">
				<select name="grp" id="grp" style="wihdt:150px;">
				<option value="" >선택해 주세요</option>
				<%=com.neoboard.PropertyManager.getGroupSelect(propBean.getBoardID(), "") %>
				</select>
			</td>
		</tr>
		<!-- 그룹 종료  -->
		<% } %>
		<tr>
			<th scope="row" class="th1"><label for="htmlBody">내&nbsp;&nbsp;용</label></th>
			<td class="td1" colspan="5"><textarea name="HTML_BODY" id="HTML_BODY" cols="95" rows="15" class="area"></textarea></td>
		</tr>
		<% if ( propBean.getUseMovie().equals("1")) { %>
		<tr>
			<th scope="row" class="th1"><label for="url">동영상 URL</label></th>
			<td class="td1" colspan="5">
				<input type="text" value="" name="url" id="url" class="input" style="width:430px;" maxlength="200" />
			</td>
		</tr>
		<% } %>
		<tr>
			<th scope="row" class="th1"><label for="file1">첨부파일</label></th>
			<td class="td1" colspan="5">
				<div class="filedv1">
			<%
			if (propBean.getMaxFileAttach() > 0) {
				for( int i = 1 ; i <= propBean.getMaxFileAttach(); i++) {
					%>
					<input type="file" name="file<%=i%>" id="file<%=i%>" value="" class="input" style="width:330px;" title="첨부파일<%=i%>" /><span class="f_pad"> <%=propBean.getMaxUploadLimit("MB")%></span><br />
					<%
					}
				}
			%>
				</div>
			</td>
		</tr>
		</tbody>
	</table>
    <div>
        <ul style="padding:30px 0 0 0;">
            <li><strong>안내</strong></li>
            <li>* 성명, 비밀번호는 필수 입력항목이며 미 기재시 게시글 등록이 제한됩니다.</li>
            <li>* 전화번호, 이메일은 선택항목이며 미 기재시 요청 서비스 제공에 제한이 있을 수 있습니다.</li>
            <li>* 게시글에 개인정보 입력은 금지됩니다.</li>
        </ul>
    </div>
	<div class="checkAgree">
		<input type="checkbox" id="agree" name="agree" class="vc"/> <label for="agree">상기 안내를 확인하였으며 개인정보 수집에 동의함.</label>
	</div>
</form>
	<div class="boardbtm">
		<div class="btnsec">
			<!--a href="#" onclick="do_submit(document.writeform);"><img src="<%=skinRoot %>/images/btn_ok.gif" alt="확인" /></a-->
			<input type="image"  onclick="do_submit(document.writeform);" src="<%=skinRoot %>/images/btn_ok.gif" alt="확인" />
			<!--<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("list",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName,false)%>"><img src="<%=skinRoot %>/images/btn_cancel.gif" alt="취소" /></a>-->
		<%if("MW".equals(rtype)){ %>
			<a href="/sub04/sub04_5.jsp"><img src="<%=skinRoot %>/images/btn_cancel.gif" alt="취소" /></a>

		<%}else if("IL".equals(rtype)){ %>
			<a href="/sub04/sub04_5_6.jsp"><img src="<%=skinRoot %>/images/btn_cancel.gif" alt="취소" /></a>

		<%}else if("PU".equals(rtype)){ %>
			<a href="/sub04/sub04_5_7.jsp"><img src="<%=skinRoot %>/images/btn_cancel.gif" alt="취소" /></a>
		<%} %>


		</div>
	</div>
</div>

<!-- form //-->

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "HTML_BODY",
	sSkinURI: "/smartEditor/SEditorSkin.html",
	fCreator: "createSEditorInIFrame"
});
</script>