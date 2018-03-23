<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.etc.*"%>    
<%@ page import="java.util.*"%>      
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="ZipcodeMa" scope="page" class="kr.co.knoc.etc.ZipcodeManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%  
	String addr =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("addr")),"8859_1");	
%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<link rel="stylesheet" type="text/css" href="/include/css/sub.css" />
<link rel="stylesheet" type="text/css" href="/include/css/board.css" />
<link rel="stylesheet" type="text/css" href="/include/css/common.css" />
<link rel="stylesheet" type="text/css" href="/include/css/subpage.css" />
<script type="text/javascript">
	function searchZipcode() {
		if (document.wForm.addr.value == "") {
			alert("주소를 입력하여 주세요.");
			document.wForm.addr.focus();			
			return false;
		} else {
			document.wForm.submit();
		}
	}
	
	function setZipcode(zipcode1,zipcode2,addr1) {
		opener.setZipcode(zipcode1,zipcode2,addr1);
		self.close();
	}
</script><noscript>자바스크립트를 사용하고 있습니다.</noscript>
<body>
<form name="wForm" method="post" action="pop_post.jsp" onsubmit="searchZipcode();return false;">    
<div id="pop_wrap_2">
    <img src="../images/member/pop_post_01.gif" alt="" />
    <div id="post_body">
        <dl>
            <dt style="text-align:center" class="pl15"><label for="addr">동/읍/면을 입력하세요 (예. 구로동)</label></dt>
            <dd style="text-align:center">
				<input type="text" id="addr" name="addr" maxlength="50" value="<%=addr%>" class="login" style="width:200px; vertical-align:middle" /> <input type="image" src="../images/member/btn_sumbit_01.gif" style="vertical-align:middle" alt="확인" /></dd>
        </dl>
        <div class="pt05" id="post_title">
        <table cellspacing="0" cellpadding="0" border="0" class="post_table">
        <colgroup><col width="61px" /><col width="230px" /></colgroup>
            <tr>
                <th align="center" style="border-right:#d8d8d8 1px solid;" scope="col"><img src="../images/member/pop_post_02.gif" class="pt03" alt="우편번호"></th>
                <th align="center"  scope="col"><img src="../images/member/pop_post_03.gif" class="pt03" alt="주소"></th>
            </tr>
         </table>
        </div>
        <div id="post_body_1">
        	<div id="post_con">
                <table cellspacing="0" cellpadding="0" border="0" class="post_table_1">
                <colgroup><col width="66px" /><col width="230px" /></colgroup>
<%    
if (addr != null && !addr.equals("")) {
	ArrayList addrL = ZipcodeMa.searchZipcode(addr);	
	if (addrL.size() == 0) {                
%>
                    <tr>
                        <td align="center" colspan="2">등록된 자료가 없습니다.</td>
                    </tr>
<%
	} else {
		Iterator iter = addrL.iterator();
		while(iter.hasNext()){
			ZipcodeBean zipb = (ZipcodeBean)iter.next();
%>
                    <tr>
                      <td align="center" style="border-right:#d8d8d8 1px solid;"><%=zipb.getZipcode()%></td>
                        <td class="pl05"><a href="joinEdit.jsp" onclick="setZipcode('<%=zipb.getZipcode().substring(0,3)%>','<%=zipb.getZipcode().substring(4,7)%>','<%=zipb.getSido().trim()%> <%=zipb.getGugun().trim()%> <%=zipb.getDong().trim()%>');return false;"><%=zipb.getSido()%> <%=zipb.getGugun()%> <%=zipb.getDong()%> <%=etcutil.checkNull(zipb.getBunji())%></a></td>
                    </tr>
<%
		}
	}
} else {
%>       
                    <tr>
                        <td align="center" colspan="2">등록된 자료가 없습니다.</td>
                    </tr>   
<%
}
%>	   	          

                    
                 </table>
            </div>
        </div>
    </div>
</div>
</form>
</body>
</html>
