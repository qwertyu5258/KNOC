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
%>
<% if(!article.getId().equals("guest") && !Property.isViewable("edit",authBean,propBean,userSession,article.getId())) { %>
	<script language=javascript>
	alert("���� ������ �����ϴ�.");
	history.back();
	</script>
<% 
	return;
} %>

<script type="text/javascript"> 
	function do_submit(f) {
		var f = document.writeform;

		if(f.subject.value == "") {
			alert("�� ������ �Է��� �ֽñ� �ٶ��ϴ�.");
			f.subject.focus(); 
			f.subject.select();
			return;
		}
		//if(f.name.value == "") {
		if(document.getElementById("name").value == "") {			
			alert("������ �Է��� �ֽñ� �ٶ��ϴ�.");
			f.name.focus(); 
			f.name.select();
			return;
		}

		
	<% if (session.getAttribute("ADMINSESSION") == null && Integer.parseInt(userLevel) > 6 && !checkid) { %>
		if(f.passwd.value=='') {
			alert("��й�ȣ�� �Է��� �ֽñ� �ٶ��ϴ�.");
			f.passwd.focus();
			return;
		}
	<% } %>            	
		if(f.HTML_BODY.value =="") {
			alert("�� ������ �Է��� �ֽñ� �ٶ��ϴ�.");
			f.HTML_BODY.focus();
			return;
		}

		if(!checkAllFileExt(f)){
			alert("�����Ͻ� ������ ���ε� �� �� �����ϴ�.");
			return;
		}

		if(confirm("���� �����Ͻðڽ��ϱ�?")) {
			oEditors.getById["HTML_BODY"].exec("UPDATE_IR_FIELD", []);	
			// �������� ���뿡 ���� �� ������ �̰����� textarea �ʵ��� ir1�� ���� �̿��ؼ� ó���ϸ� �˴ϴ�.
		
			if (checkBanwd(f.subject) && checkBanwd(f.HTML_BODY)) { //������ üŷ
				try{
					// �� ������ ���� ��� ���� ���� ���� �޶����� �ֽ��ϴ�.
					f.submit();
				}catch(e){}					
			}			
		}
	}
// ���ε� ������ Ȯ���� �˻�
	function filterExtension(obj){
		if( !checkFileExt(obj) ) alert ( "�����Ͻ� ������ ���ε� �Ͻ� �� �����ϴ�. �ٽ� �������ּ���" );
	}

// ���ε� ������ Ȯ���� �˻�
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
	
// ������ �˻� �Լ�	
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
	            alert("'" + banwd[i] + "'��(��) ����� �� ���� �ܾ��Դϴ�.");
	            return false;	            
	        }
	    }	    
<%			
		}
%>
		return true;	
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
<!-- SmartEditor ���� -->
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	
<a tabindex="0"><%=propBean.getTopIncludeText()%></a>	
			
<!-- form -->
<div id="boardsec">
<form name="writeform" method="post" action="<%=action.toString()%>" enctype="multipart/form-data">
<input name="id" type="hidden" value="<%=article.getId()%>" />
<input name="name" type="hidden" value="<%=article.getName()%>" />
<input name="secret" type="hidden" value="1" />
	<table cellspacing="0" cellpadding="0" class="viewtype" summary="<%=propBean.getBoardName() %>�� �Խù��� ����մϴ�">	
	<caption><%=propBean.getBoardName() %>�Խù����</caption>
	<colgroup><col width="110px" /><col width="130px" /><col width="110px" /><col width="130px" /><col width="110px" /><col width="130px" /></colgroup>
		<tr>
			<th scope="row" class="th1"><label for="name">����</label></th>
			<td class="td1"><input type="text" id="name" name="name" class="input" style="width:110px;" value="<%=article.getName()%>" maxlength="32" readonly="readonly" /></td>
                        <th scope="row" class="th1"><label for="passwd">��й�ȣ</label></th>
			<td class="td1" colspan="3"><input type="password" value="" id="passwd" name="passwd" class="input" style="width:110px;" maxlength="16" /></td>
                        <!--<th scope="row" class="th1"><label for="subjtxt">��й�ȣ Ȯ��</label></th>
			<td class="td1"><input type="password" value="" id="passwd" name="passwd" class="input" style="width:110px;" /></td>-->
		</tr>
		<tr>
			<th scope="row" class="th1"><label for="tel1">��ȭ��ȣ</label></th>
			<td class="td1"><input type="text" value="<%=phone1 %>" id="tel1" name="tel1" class="input" style="width:25px;" maxlength="3" title="������ȣ"/> - <input type="text" value="<%=phone2 %>" id="tel2" name="tel2" class="input" style="width:25px;" maxlength="4"  title="����"/> - <input type="text" value="<%=phone3 %>" id="tel3" name="tel3" class="input" style="width:25px;" maxlength="4"  title="��ȭ��ȣ ���ڸ�"/></td>
			<th scope="row" class="th1"><label for="email">�̸���</label></th>
			<td class="td1" colspan="3"><input type="text" value="<%=article.getEmail() %>" id="email" name="email" class="input" style="width:150px;" maxlength="200" /></td>
		</tr>		
<% if(!"SANGDAM".equals(propBean.getBoardID()) && !"CLEAR2".equals(propBean.getBoardID()) ){ %>
		<tr>
			<th scope="row" class="th1">���뱸��</th>
			<td class="td1" colspan="5"><label for="question">���� <input name="contGubun" id="question" type="radio" value="����" <% if (article.getContGubun().equals("����")) { %>checked="checked"<% } %> /></label> <label for="notify">�����Ű� <input name="contGubun" type="radio" value="�����Ű�" <% if (article.getContGubun().equals("�����Ű�")) { %>checked="checked"<% } %> /></label> <label for="praise">����Ī�� <input name="contGubun" type="radio" value="����Ī��" <% if (article.getContGubun().equals("����Ī��")) { %>checked="checked"<% } %> /></label> <label for="suggest">���� <input name="contGubun" type="radio" value="����" <% if (article.getContGubun().equals("����")) { %>checked="checked"<% } %> /></label> <label for="others">��Ÿ <input name="contGubun" type="radio" value="��Ÿ" <% if (article.getContGubun().equals("��Ÿ")) { %>checked="checked"<% } %> /></label></td>
		</tr>
<%} %>

		<tr>
			<th scope="row" class="th1"><label for="subjtxt">����</label></th>
			<td class="td1" colspan="5"><input type="text" value="<%=article.getSubject() %>" id="subjtxt" name="subject" class="input" style="width:570px;" maxlength="<%=propBean.getMaxSubjectLength()%>" /></td>
		</tr>
		<% if ( propBean.getUseGroup().equals("1")) { %>	
		<!--  �׷� ����  -->
		<tr>
			<th scope="row" class="th1"><label for="grp">�׷켱��</label></th>
			<td class="td1" colspan="5">
				<select name="grp" id="grp"style="wihdt:150px;">						
				<option value="" >������ �ּ���</option>
				<%=com.neoboard.PropertyManager.getGroupSelect(propBean.getBoardID(), article.getGrp()) %>
				</select>
			</td>
		</tr>			
		<!-- �׷� ����  -->
		<% } %>
		<tr>
			<th scope="row" class="th1"><label for="htmlBody">��&nbsp;&nbsp;��</label></th>
			<td class="td1" colspan="5"><textarea name="HTML_BODY" id="HTML_BODY" cols="95" rows="15" class="area"><%=article.getContent() %></textarea></td>
		</tr>
		<% if(propBean.getUseNotice().equals("1") && Property.isViewable("notice",authBean,propBean,userSession)) { %>
		<tr>
			<th scope="row" class="th1"><label for="notice">������</label></th>
			<td class="td1" colspan="5">
				<input  alt="������" title="������" type="checkbox" name="notice" id="notice" value="1" <% if (article.getNotice().equals("1")) { %>checked="checked"<% } %> /> ����
			</td>
		</tr>			
		<% } %>
		<% if ( propBean.getUseMovie().equals("1")) { %>
		<tr>
			<th scope="row" class="th1"><label for="url">������ URL</label></th>
			<td class="td1" colspan="5">
				<input type="text" value="<%=article.getUrl() %>" name="url" id="url" class="input" style="width:430px;" maxlength="200" />
			</td>
		</tr>			
		<% } %>		
		<tr>
			<th scope="row" class="th1">÷������</th>
			<td class="td1" colspan="5">
				<div class="filedv1">
<%
AttachFiles attachFiles = article.getFiles();
for( int i = 1 ; i <= propBean.getMaxFileAttach(); i++) {
%>

<%
	if(attachFiles != null && i <= attachFiles.size() )  {
%>		               		
						<input type="file" name="file<%=i%>" id="file<%=i%>" value="" class="input" style="width:330px;" title="÷������<%=i%>" onchange="filterExtension(this);" disabled /><span class="f_pad"> <%=propBean.getMaxUploadLimit("MB")%></span><br />						
<%	} else { %>						
						<input type="file" name="file<%=i%>" id="file<%=i%>" value="" class="input" style="width:330px;" title="÷������<%=i%>" onchange="filterExtension(this);" /><span class="f_pad"> <%=propBean.getMaxUploadLimit("MB")%></span><br />						
<%	} 	
	if(attachFiles != null && i <= attachFiles.size() )  {
		AttachFile f = attachFiles.getAttachFile(i-1);
%>
									<div style="height:24px;">
										<a tabindex="0"><font style='font-size:8pt;color=gray'>÷������: <b><%=f.getFileName()%></font></a>
										<input title="���ϻ���" type="checkbox" name="fileupdate" id="fileupdate" value="<%=f.getNo()%>" onclick="checkFile(this,<%=i%>);" onkeypress="checkFile(this,<%=i%>);">
									<span style="padding-top:3px"><a tabindex="0"><font style='font-size:8pt;color=gray'>���� üũ�ڽ��� �����Ͻø� �̹� ÷�ε� ȭ���� �����˴ϴ�.</font></a></span>
									</div>
<%
	}
}	
%>						
				</div>				
			</td>
		</tr>
	</table>
</form>			
	<div class="boardbtm">
		<div class="btnsec">
			<a href="#" onclick="do_submit(document.writeform);"><img src="<%=skinRoot %>/images/btn_ok.gif" alt="Ȯ��" /></a>		
			<a href="<%=pageBean.getPageUrl()%><%=pageBean.makeQueryString("list",true)%><%=schBean.makeQueryString("","bid=" + propBean.getBoardID()+"&amp;ses="+sessionName+"&amp;pass="+request.getParameter("passwd")+"&amp;name="+article.getName()+"&amp;bno="+article.getNo(),false)%>"><img src="<%=skinRoot %>/images/btn_cancel.gif" alt="���" /></a>			
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