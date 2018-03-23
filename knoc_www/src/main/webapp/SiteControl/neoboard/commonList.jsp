<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,com.neoboard.*,com.neoboard.data.*, com.neoboard.util.EtcUtil" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<%
	String comGubun = EtcUtil.strBlockSpecialTags(request.getParameter("comGubun"));
	PropertyManager pm = new PropertyManager();
	ArrayList commList = pm.getCommonList(comGubun);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="../share/css/admin.css" rel="stylesheet" type="text/css">
<title>게시판 설정관리</title>
</head>
<body leftmargin=0 topmargin=0>
<script language=javascript>
function deleteCommon(no, comID) {
	if(confirm("삭제하시겠습니까?")){
		var f = document.dform;
		f.no.value = no;
		f.comID.value = comID;
		f.submit();
	}
	
}
</script>
<form name=dform style="display:none" method=post action="commonDeleteOk.jsp">
<input type=hidden name=no>
<input type=hidden name=comID>
<input type=hidden name=comGubun value="<%=comGubun%>">
</form>
<table cellpadding=1 cellspacing=1 border=0 width=100% bgcolor=#EFEFEF>
<TR bgcolor=#A1A1A1>
<TD style="font-weight:bold;color:white;text-align:center">ID</TD>
<TD style="font-weight:bold;color:white;text-align:center">이름</TD>
<TD width="20"  style="font-weight:bold;color:white;text-align:center">&nbsp;</TD>
</TR>
<%
	Iterator itr = commList.iterator();
	while(itr.hasNext()) {
		Common comm = (Common)itr.next();
%>
	<TR bgcolor=white>
	<TD><%=comm.getComID() %></TD>
	<TD ><%=comm.getComName() %></TD>
	<TD width="20" align=center><a title="삭제" href="javascript:deleteCommon('<%=comm.getNo()%>','<%=comm.getComID()%>');"><B>x</B></a></TD>
	</TR>
<%
	}
%>
</table>

<script language=javascript>
function chkCommonId(str) {
	var reg = new RegExp("^[a-zA-Z0-9]{1,12}$");
	return reg.test(str);
}
function doReg(f){
	if(!chkCommonId(f.comID.value)) {
		alert("설정 ID 는 영문, 숫자 1~12자입니다.");
		f.comID.focus();
	}
	else if(f.comName.value =="") {
		alert("설정 이름을 입력해 주세요.");
		f.comName.focus();
	}
	else {
		if(confirm("설정을 입력하시겠습니까?")) {
			f.submit();
		}
	}
}
</script>
<form name=regform method=post action="commonWriteOk.jsp">
<input type=hidden name="comGubun" value="<%=comGubun%>">
<table cellpadding=0 cellspacing=0 border=0 width=100%>
<TR>
<TD>ID:<input type=text name=comID value="" size=10 maxlength=50></TD>
<TD>이름:<input type=text name=comName value="" size=10 maxlength=100></TD>
<TD align=right><input type=button name=regbtn value="설정등록" onclick="doReg(document.regform);"></TD>
</TR>
</table>
</form>

</body>
</html>