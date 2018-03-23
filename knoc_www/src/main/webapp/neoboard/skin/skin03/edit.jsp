<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.neoboard.data.*,com.neoboard.*,com.neoboard.session.*,com.neoboard.util.*" %>
<%@taglib uri="/WEB-INF/tlds/neoboardtaglib.tld" prefix="neo" %>
<jsp:useBean id="bm" class="com.neoboard.NeoBoardManager" scope="page" />
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
	
	Article article = (Article)pageContext.getAttribute("NB_ARTICLE",PageContext.REQUEST_SCOPE);
	
	String skinRoot = Property.SKIN_URL_IMG + "/" + propBean.getSkinID();
	String neoRoot = Property.ROOT_URL;

	String userLevel = "9";

	if (userSession!=null && !userSession.equals("")) {
		userLevel = userSession.getUserLevel();
	}
	NeoBoardManager manager = new NeoBoardManager();
	boolean checkid = manager.checkID(propBean.getBoardID(), Integer.toString(article.getNo()));
	
	String phone1 = "";
	String phone2 = "";
	String phone3 = "";
	String zipno1 = "";
	
	int tag1 = 0;
	int tag2 = 0;
	if (article.getPhone() != null && !article.getPhone().equals("")) {
		tag1 = article.getPhone().indexOf("-");
       	tag2 = article.getPhone().indexOf("-", tag1+1);
       	if ((tag1 > 0) && (tag2 > 0))
       	{
       		phone1 = article.getPhone().substring(0, tag1);
            phone2 = article.getPhone().substring(tag1+1, tag2);
            phone3 = article.getPhone().substring(tag2+1, article.getPhone().length());
		}
	}	
	if (article.getZipcode() != null && !article.getZipcode().equals("")) {
		zipno1 = article.getZipcode();		
	}
%>
<% if(!article.getId().equals("guest") && !Property.isViewable("edit",authBean,propBean,userSession,article.getId())) { %>
	<script language=javascript>
	alert("수정 권한이 없습니다.");
	history.back();
	</script>
<% 
	return;
} %>

<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"> 
	function do_submit(f) {
		var f = document.writeform;

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

		
	<% if (session.getAttribute("ADMINSESSION") == null && Integer.parseInt(userLevel) > 6 && !checkid) { %>
		if(f.passwd.value=='') {
			alert("비밀번호를 입력해 주시기 바랍니다.");
			f.passwd.focus();
			return;
		}
	<% } %>            	
		if(f.HTML_BODY.value =="") {
			alert("글 내용을 입력해 주시기 바랍니다.");
			f.HTML_BODY.focus();
			return;
		}

		if(!checkAllFileExt(f)){
			alert("선택하신 파일은 업로드 할 수 없습니다.");
			return;
		}

		if(confirm("글을 수정하시겠습니까?")) {
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
	function checkFileExt(obj){
		if( obj.value.toLowerCase().match(/(<%=propBean.getDefaultNotAllowedExtension().replaceAll(",","|")%>)$/) ){
			return false;
		}
		return true;
	}

	function checkAllFileExt(f){
<%for( int i = 1 ; i <= propBean.getMaxFileAttach() ; i++) {%>
		if ( f.file<%=i%>.value != ""){
			if(!checkFileExt(f.file<%=i%>) ) return false;
		}
<%}%>
		return true;
	}

	function checkFile(c, index) {
		var fo = eval("document.writeform.file" + index);
		if(typeof(fo) != "object") return;
		
		if(c.checked) {
			fo.disabled = 0;
		}else {
		fo.disabled = 1;
		}
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
		//window.open("/member/pop_post.jsp","pop_post","width=362,height=280,scrollbars=yes");
		
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

<%
StringBuffer action = new StringBuffer();
action.append(EtcUtil.SSL_DOMAIN_URL);
action.append(Property.SERVLET_ROOT);
action.append("/EditArticle");
action.append("?num=");
action.append(article.getNo());
action.append("&amp;bid=");
action.append(propBean.getBoardID());
action.append("&amp;ses=");
action.append(sessionName);
action.append("&amp;callback=");
action.append(pageBean.getPageUrl());
action.append("&amp;page=");
action.append(pageBean.getPage());
action.append("&amp;mode=");
action.append(pageBean.getPageMode());
for(int i = 0 ; i < schBean.getSearchParam().size(); i++) { 
SearchParam sp = (SearchParam)schBean.getSearchParam().get(i);
action.append("&amp;field=");
action.append(sp.getField());
action.append("&text=");
action.append(sp.getText());
}
action.append("&amp;dir=");
action.append(schBean.getDir());
action.append("&amp;order=");
action.append(schBean.getOrder());
action.append("&amp;grp=");
action.append(schBean.getGroup());
action.append("&amp;psize=");
action.append(propBean.getListPerPage());
%>
<script type="text/javascript" src="/neoboard/js/comm.js"></script>
<!-- SmartEditor 삽입 -->
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
			
<!-- form -->
<div id="boardsec">
<form name="writeform" method="post" action="<%=action.toString()%>" enctype="multipart/form-data">
<input name="id" type="hidden" value="<%=article.getId()%>" />
<input name="name" type="hidden" value="<%=article.getName()%>" />
<input name="secret" type="hidden" value="1" />
	<table cellspacing="0" cellpadding="0" class="viewtype" summary="<%=propBean.getBoardName() %>에 게시물을 등록합니다">	
	<caption><%=propBean.getBoardName() %>게시물등록</caption>
	<colgroup><col width="110px" /><col width="130px" /><col width="110px" /><col width="130px" /><col width="110px" /><col width="130px" /></colgroup>
		<tr>
			<th scope="row" class="th1"><label for="name">성명</label></th>
			<td class="td1"><input type="text" id="name" name="name" class="input" style="width:110px;" value="<%=article.getName() %>" maxlength="32" readonly="readonly" /></td>
                       	<th scope="row" class="th1"><label for="passwd">비밀번호</label></th>
			<td class="td1" colspan="3"><input type="password" value="" id="passwd" name="passwd" class="input" style="width:110px;" maxlength="16" /></td>
                        <!-- <th scope="row" class="th1">비밀번호 확인</th>
			<td class="td1"><input type="text" value="" id="subjtxt" class="input" style="width:110px;" /></td> -->
		</tr>
		<tr>
			<th scope="row" class="th1" rowspan="3"><label for="zipno1">주소</label></th>
			<td class="td1" colspan="5"><input type="text" value="<%=zipno1 %>" id="zipno1" name="zipno1" class="input" style="width:60px;" maxlength="3" readonly onclick="openZipcode();" title="우편번호 앞자리"/> <a href="#" onclick="openZipcode();"><img src="<%=skinRoot %>/images/btn_se.gif" align="top" alt="주소찾기"  title="우편번호 뒷자리"/></a></td>
		</tr>
		<tr>
	         <td class="td1" colspan="5"><input type="text" value="<%=article.getAddr1() %>" id="addr1" name="addr1" maxlength="200" class="input" style="width:580px;" readonly onclick="openZipcode();"  title="기본주소"/></td>
		</tr>
	    <tr>
	         <td class="td1" colspan="5"><input type="text" value="<%=article.getAddr2() %>" id="addr2" name="addr2" maxlength="200" class="input" style="width:580px;"  title="나머지 주소"/></td>
		</tr>
		<tr>
			<th scope="row" class="th1"><label for="email">이메일</label></th>
			<td class="td1" colspan="5"><input type="text" id="email" name="email" class="input" style="width:580px;" value="<%=article.getEmail() %>" maxlength="200" /></td>
		</tr>
		<tr>
			<th scope="row" class="th1"><label for="tel1">전화번호</label></th>
			<td class="td1" colspan="5"><input type="text" value="<%=phone1 %>" id="tel1" name="tel1" class="input" style="width:25px;" maxlength="3" title="지역번호"/> - <input type="text" value="<%=phone2 %>" id="tel2" name="tel2" class="input" style="width:25px;" maxlength="4" title="국번"/> - <input type="text" value="<%=phone3 %>" id="tel3" name="tel3" class="input" style="width:25px;" maxlength="4" title="전화번호 끝자리"/></td>
		</tr>
		<tr>
			<th scope="row" class="th1">공개형태</th>
			<td class="td1" colspan="5"><label for="open_a">열람ㆍ시청 <input name="viewStatus" id="open_a" type="radio" value="열람ㆍ시청" <% if (article.getViewStatus().equals("열람ㆍ시청")) { %>checked="checked"<% } %> /></label> <label for="open_b">사본ㆍ출력물 <input name="viewStatus" type="radio" id="open_b" value="사본ㆍ출력물" <% if (article.getViewStatus().equals("사본ㆍ출력물")) { %>checked="checked"<% } %> /></label> <label for="open_c">전자파일 <input name="viewStatus" id="open_c" type="radio" value="전자파일" <% if (article.getViewStatus().equals("전자파일")) { %>checked="checked"<% } %> /></label> <label for="open_d">복제ㆍ인화물 <input name="viewStatus" type="radio" id="open_d" value="복제ㆍ인화물" <% if (article.getViewStatus().equals("복제ㆍ인화물")) { %>checked="checked"<% } %> /></label> <label for="open_e">기타 <input name="viewStatus" type="radio" id="open_e" value="기타" <% if (article.getViewStatus().equals("기타")) { %>checked="checked"<% } %> /></label></td>
		</tr>
		<tr>
			<th scope="row" class="th1">수령방법</th>
			<td class="td1" colspan="5"><label for="recive_a">직접방문 <input name="kind" type="radio" id="recive_a" value="직접방문" <% if (article.getKind().equals("직접방문")) { %>checked="checked"<% } %> /></label> <label for="recive_b">우편 <input name="kind" type="radio" id="recive_b" value="우편" <% if (article.getKind().equals("우편")) { %>checked="checked"<% } %> /></label>   <label for="recive_c">모사전송 <input name="kind" type="radio" id="recive_c" value="모사전송" <% if (article.getKind().equals("모사전송")) { %>checked="checked"<% } %> /></label>   <label for="recive_d">전자우편 <input name="kind" type="radio" id="recive_d" value="전자우편" <% if (article.getKind().equals("전자우편")) { %>checked="checked"<% } %> /></label>  <label for="recive_e">기타 <input name="kind" type="radio" id="recive_e" value="기타" <% if (article.getKind().equals("기타")) { %>checked="checked"<% } %> /></label>  </td>
		</tr>
		<tr>
			<th scope="row" class="th1">사용목적</th>
			<td class="td1" colspan="5"><label for="use_a">학술연구 <input name="object" type="radio" id="use_a" value="학술연구" <% if (article.getObject().equals("학술연구")) { %>checked="checked"<% } %> /></label> <label for="use_b">사업관련 <input name="object" type="radio"  id="use_b" value="사업관련" <% if (article.getObject().equals("사업관련")) { %>checked="checked"<% } %> /></label> <label for="use_c">행정감시 <input name="object" type="radio"  id="use_c" value="행정감시" <% if (article.getObject().equals("행정감시")) { %>checked="checked"<% } %> /></label> <label for="use_d">쟁송관련 <input name="object" type="radio"  id="use_d" value="쟁송관련" <% if (article.getObject().equals("쟁송관련")) { %>checked="checked"<% } %> /></label> <label for="use_e">재산관리 <input name="object" type="radio"  id="use_e" value="재산관리" <% if (article.getObject().equals("재산관리")) { %>checked="checked"<% } %> /></label> <label for="use_f">기타 <input name="object" type="radio"  id="use_f" value="기타" <% if (article.getObject().equals("기타")) { %>checked="checked"<% } %> /></label></td>
		</tr>
		<tr>
			<th scope="row" class="th1">수수료감면</th>
			<td class="td1" colspan="5"><label for="commission_a">해당 <input name="cut" type="radio" id="commission_a" value="해당" <% if (article.getCut().equals("해당")) { %>checked="checked"<% } %> /></label> <label for="commission_b">해당없음 <input name="cut" type="radio" id="commission_b" value="해당없음"  <% if (article.getCut().equals("해당없음")) { %>checked="checked"<% } %>/></label></td>
		</tr>
		<tr>
			<th scope="row" class="th1"><label for="cutContent">수수료감면사유</label></th>
			<td class="td3" colspan="5"><input type="text" id="cutContent" name="cutContent" class="input" style="width:580px;" value="<%=article.getCutContent() %>" maxlength="200" /><p><p>
                        <font style="color:#D32602">※공공기관의 정보공개에 관한 법률시행령 제 17조제3항의 규정에 의하여 수수료 감면대상에 해당하는 경우에 기재하며, 감면사유를 증명할 수 있는 서류를 첨부하시기 바랍니다.</font>

                        </td>
		</tr>
		<tr>
			<th scope="row" class="th1"><label for="subjtxt">제&nbsp;&nbsp;목</label></th>
			<td class="td1" colspan="5"><input type="text" value="<%=article.getSubject() %>" id="subjtxt" name="subject" class="input" style="width:570px;" maxlength="<%=propBean.getMaxSubjectLength()%>" /></td>
		</tr>
		<% if ( propBean.getUseGroup().equals("1")) { %>	
		<!--  그룹 시작  -->
		<tr>
			<th scope="row" class="th1"><label for="grp">그룹선택</label></th>
			<td class="td1" colspan="5">
				<select name="grp" id="grp" style="wihdt:150px;">						
				<option value="" >선택해 주세요</option>
				<%=com.neoboard.PropertyManager.getGroupSelect(propBean.getBoardID(), article.getGrp())%>
				</select>
			</td>
		</tr>			
		<!-- 그룹 종료  -->
		<% } %>
		<tr>
			<th scope="row" class="th1"><label for="htmlBody">내&nbsp;&nbsp;용</label></th>
			<td class="td12" colspan="5"><textarea name="HTML_BODY" id="HTML_BODY"  cols="95" rows="15" class="area"><%=article.getContent() %></textarea></td>
		</tr>
		<% if ( propBean.getUseMovie().equals("1")) { %>
		<tr>
			<th scope="row" class="th1"><label for="url">동영상 URL</label></th>
			<td class="td1" colspan="5">
				<input type="text" value="<%=article.getUrl() %>" name="url" id="url" class="input" style="width:430px;" maxlength="200" />
			</td>
		</tr>			
		<% } %>
		<tr>
			<th scope="row" class="th1"><label for="fileadd">첨부파일</label></th>
			<td class="td1" colspan="5">
				<div class="filedv1">
<%
AttachFiles attachFiles = article.getFiles();
for( int i = 1 ; i <= propBean.getMaxFileAttach(); i++) {
%>

<%
	if(attachFiles != null && i <= attachFiles.size() )  {
%>		               		
						<input type="file" name="file<%=i%>" id="file<%=i%>" value="" class="input" style="width:330px;" title="첨부파일<%=i%>" onchange="filterExtension(this);" disabled /><span class="f_pad"> <%=propBean.getMaxUploadLimit("MB")%></span><br />						
<%	} else { %>						
						<input type="file" name="file<%=i%>" id="file<%=i%>" value="" class="input" style="width:330px;" title="첨부파일<%=i%>" onchange="filterExtension(this);" /><span class="f_pad"> <%=propBean.getMaxUploadLimit("MB")%></span><br />						
<%	} 	
	if(attachFiles != null && i <= attachFiles.size() )  {
		AttachFile f = attachFiles.getAttachFile(i-1);
%>
									<div style="height:24px;">
										<a tabindex="0"><font style='font-size:8pt;color=gray'>첨부파일: <b><%=f.getFileName()%></font></a>
										<input title="파일삭제" type="checkbox" name="fileupdate" id="fileupdate" value="<%=f.getNo()%>" onclick="checkFile(this,<%=i%>);" onkeypress="checkFile(this,<%=i%>);">
									<span style="padding-top:3px"><a tabindex="0"><font style='font-size:8pt;color=gray'>왼쪽 체크박스를 선택하시면 이미 첨부된 화일은 삭제됩니다.</font></a></span>
									</div>
<%
	}
}	
%>	
				</div>				
			</td>
		</tr>
        <tr>
			<th scope="row" class="th1">담당자전화번호</th>
			<td class="td1" colspan="5">담당자 : 총무관리처 총무팀 차정민 사원 Tel. 031-380-2308</td>
		</tr>
	</table>
</form>			
	<div class="boardbtm">
		<div class="btnsec">
			<a href="#" onclick="do_submit(document.writeform);"><img src="<%=skinRoot %>/images/btn_ok.gif" alt="확인" /></a>
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