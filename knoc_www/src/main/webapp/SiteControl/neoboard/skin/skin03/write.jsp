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
%>

<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function do_submit(f) {

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
	<table cellspacing="0" cellpadding="0" class="viewtype" summary="<%=propBean.getBoardName() %>에 게시물을 등록합니다">
<form name="writeform" method="post" action="<%=etcutil.SSL_DOMAIN_URL%><%=Property.SERVLET_ROOT%>/RegistArticle?bid=<%=propBean.getBoardID()%>&amp;callback=<%=pageBean.getPageUrl()%>&amp;ses=<%=sessionName%>&amp;grp=<%=schBean.getGroup()%>" enctype="multipart/form-data">
<input name="id" type="hidden" value="<%= userSession==null ? "":userSession.getUserID()%>" />
	<caption><%=propBean.getBoardName() %>게시물등록</caption>
	<colgroup><col width="110px" /><col width="130px" /><col width="110px" /><col width="130px" /><col width="110px" /><col width="130px" /></colgroup>
		<tr>
			<th class="th1">성명</th>
			<td class="td1"><input type="text" id="name" name="name" class="input" style="width:110px;" value="<%= userSession==null ? "":userSession.getUserName() %>" maxlength="32" <%if(userSession!=null && propBean.getUseAuth().equals("1")) { %>readonly="readonly"<% } %> /></td>
                       	<th class="th1">비밀번호</th>
			<td class="td1" colspan="3"><input type="password" value="" id="passwd" name="passwd" class="input" style="width:110px;" maxlength="16" /></td>
                        <!-- <th class="th1">비밀번호 확인</th>
			<td class="td1"><input type="text" value="" id="subjtxt" class="input" style="width:110px;" /></td> -->
		</tr>
		<tr>
			<th class="th1" rowspan="3">주소</th>
			<td class="td1" colspan="5"><input type="text" value="" id="zipno1" name="zipno1" class="input" style="width:60px;" maxlength="3" readonly onClick="openZipcode();" /> <img src="<%=skinRoot %>/images/btn_se.gif" align="top" alt="주소찾기" onClick="openZipcode();" style="cursor:hand" /></td>
		</tr>
		<tr>
	         <td class="td1" colspan="5"><input type="text" value="" id="addr1" name="addr1" maxlength="200" class="input" style="width:580px;" readonly onClick="openZipcode();" /></td>
		</tr>
	    <tr>
	         <td class="td1" colspan="5"><input type="text" value="" id="addr2" name="addr2" maxlength="200" class="input" style="width:580px;" /></td>
		</tr>
		<tr>
			<th class="th1">이메일</th>
			<td class="td1" colspan="5"><input type="text" id="email" name="email" class="input" style="width:580px;" value="" maxlength="200" /></td>
		</tr>
		<tr>
			<th class="th1">전화번호</th>
			<td class="td1" colspan="5"><input type="text" value="" id="tel1" name="tel1" class="input" style="width:25px;" maxlength="3" /> - <input type="text" value="" id="tel2" name="tel2" class="input" style="width:25px;" maxlength="4" /> - <input type="text" value="" id="tel3" name="tel3" class="input" style="width:25px;" maxlength="4" /></td>
		</tr>
		<tr>
			<th class="th1">공개형태</th>
			<td class="td1" colspan="5">열람ㆍ시청 <input name="viewStatus" type="radio" value="열람ㆍ시청" checked="checked" /> 사본ㆍ출력물 <input name="viewStatus" type="radio" value="사본ㆍ출력물" /> 전자파일 <input name="viewStatus" type="radio" value="전자파일" /> 복제ㆍ인화물 <input name="viewStatus" type="radio" value="복제ㆍ인화물" /> 기타 <input name="viewStatus" type="radio" value="기타" /></td>
		</tr>
		<tr>
			<th class="th1">수령방법</th>
			<td class="td1" colspan="5">직접방문 <input name="kind" type="radio" value="직접방문" checked="checked" /> 우편 <input name="kind" type="radio" value="우편" />   모사전송 <input name="kind" type="radio" value="모사전송" />   전자우편 <input name="kind" type="radio" value="전자우편" />  기타 <input name="kind" type="radio" value="기타" />  </td>
		</tr>
		<tr>
			<th class="th1">사용목적</th>
			<td class="td1" colspan="5">학술연구 <input name="object" type="radio" value="학술연구" checked="checked" /> 사업관련 <input name="object" type="radio" value="사업관련" /> 행정감시 <input name="object" type="radio" value="행정감시" /> 쟁송관련 <input name="object" type="radio" value="쟁송관련" /> 재산관리 <input name="object" type="radio" value="재산관리" /> 기타 <input name="object" type="radio" value="기타" /></td>
		</tr>
		<tr>
			<th class="th1">수수료감면</th>
			<td class="td1" colspan="5">해당 <input name="cut" type="radio" value="해당" checked="checked" /> 해당없음 <input name="cut" type="radio" value="해당없음" /></td>
		</tr>
		<tr>
			<th class="th1">수수료감면사유</th>
			<td class="td3" colspan="5"><input type="text" id="cutContent" name="cutContent class="input" style="width:580px;" maxlength="200" /><p><p>
                        <font style="color:#D32602">※공공기관의 정보공개에 관한 법률시행령 제 17조제3항의 규정에 의하여 수수료 감면대상에 해당하는 경우에 기재하며, 감면사유를 증명할 수 있는 서류를 첨부하시기 바랍니다.</font>

                        </td>
		</tr>
		<tr>
			<th class="th1">제&nbsp;&nbsp;목</th>
			<td class="td1" colspan="5"><input type="text" value="" id="subjtxt" name="subject" class="input" style="width:570px;" maxlength="<%=propBean.getMaxSubjectLength()%>" /></td>
		</tr>
		<% if ( propBean.getUseGroup().equals("1")) { %>
		<!--  그룹 시작  -->
		<tr>
			<th class="th1"><label for="subjtxt">그룹선택</label></th>
			<td class="td1" colspan="5">
				<select name="grp" style="wihdt:150px;">
				<option value="" >선택해 주세요</option>
				<%=com.neoboard.PropertyManager.getGroupSelect(propBean.getBoardID(), "") %>
				</select>
			</td>
		</tr>
		<!-- 그룹 종료  -->
		<% } %>
		<tr>
			<th class="th1">내&nbsp;&nbsp;용</th>
			<td class="td12" colspan="5"><textarea  name="HTML_BODY" id="HTML_BODY"  cols="95" rows="15" class="area"></textarea></td>
		</tr>
		<% if ( propBean.getUseSecret().equals("1")) { %>
		<tr>
			<th class="th1"><label for="subjtxt">공개여부</label></th>
			<td class="td1" colspan="5">
				<input type="radio" name="secret" value="0" checked />공개 <input type="radio" name="secret" value="1" /> 비공개
			</td>
		</tr>
		<% } %>
		<% if ( propBean.getUseMovie().equals("1")) { %>
		<tr>
			<th class="th1"><label for="subjtxt">동영상 URL</label></th>
			<td class="td1" colspan="5">
				<input type="text" value="" name="url" id="url" class="input" style="width:430px;" maxlength="200" />
			</td>
		</tr>
		<% } %>
		<tr>
			<th class="th1"><label for="fileadd">첨부파일</label></th>
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
        <tr>
			<th class="th1">담당자전화번호</th>
			<td class="td1" colspan="5">담당자 : 홍길동 Tel. 031-123-4567   이메일 hkd@knoc.co.kr</td>
		</tr>
</form>
	</table>

	<div class="boardbtm">
		<div class="btnsec">
			<img src="<%=skinRoot %>/images/btn_ok.gif" alt="확인" onclick="do_submit(document.writeform);" style="cursor:hand" />
			<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("list",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName,false)%>"><img src="<%=skinRoot %>/images/btn_cancel.gif" alt="취소" /></a>
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