<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.sitectrl.mgr.*"%>
<jsp:useBean id="MgrMa" class="kr.co.knoc.sitectrl.mgr.MgrHelper" />  
<% request.setCharacterEncoding("MS949"); %>
<%
	EtcUtil etc = new EtcUtil();
	String userid = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("userid")),"8859_1");	
	
	boolean result = MgrMa.checkID(userid);
%>
</script>

<html>
<head>
<title>아이디 중복체크</title>
</head>
<script language=javascript>
function closeWin(userid) {
   window.opener.document.f_regi.userid.value=userid;
   self.close();
}
function checkid() 
{
   var comp="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_";
   var comp2="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
   var string=document.f_search.userid.value;
   var len=string.length;
        if(len > 0)
        {
      		if(comp2.indexOf(string.substring(0,1))<0)
      		{
   	   		alert("첫자는  영문으로 시작해야 합니다.");
   		   	document.f_search.userid.focus();
   			   return false;
   		   }
	   
        	for(i=0;i<len;i++) 
        	{
                	if(comp.indexOf(string.substring(i,i+1))<0)
                	{
                        	alert("허용된 문자가 아닙니다. 다시 입력해 주십시오");
                        	document.f_search.userid.value="";
                        	document.f_search.userid.focus();
                        	return false;
                	}
        	}
        	if(len <4)
        	{
                	alert("아이디는 4자이상입니다.");
                	document.f_search.userid.focus();
                	return false;
        	}
        	if(len >10)
        	{
                	alert("아이디는 10자 이하입니다.");
                	document.f_search.userid.focus();
                	return false;
        	}
        }
        if(len==0)
        {
        	alert("아이디를 입력해주세요.");
        	document.f_search.userid.focus();
         	return false;
        }
}

</script>
<body>
<table border=0 width=320 cellpadding=0 cellspacing=0>
   <tr>
      <td>
         <table border=0 width=320 cellpadding=2 cellspacing=1>
            <form name=f_search method=post action=./checkID.jsp onsubmit="return checkid()">
<% 
//메일 아이디도 없고, 포탈 아이디도 없을경우 출력한다.
   if (!result) {
%>
            <tr>
               <td width=320 align=center><br><%= userid %>는 사용 가능한 ID입니다.<input type=button value=적용 onClick="closeWin('<%= userid %>');"><br><br></td>
            </tr>
<%
   } else {
%>
            <tr>
               <td width=320 align=center><br><%= userid %>는 이미 사용중인 ID입니다.<br><br></td>
            </tr>
<%
   }
   
%>
            <tr bgcolor=white>
               <td width=320 align=center><br>
                  <input type=text size=15 maxlenght=12 name=userid>
                  <input type=submit value=ID중복확인><br><br>
               </td>
            </tr>
            </form>
         </table>
      </td>
   </tr>
</table>
</body>
</html>