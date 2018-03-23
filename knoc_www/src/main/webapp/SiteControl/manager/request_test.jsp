<%@ page language="java" contentType="text/html; charset=8859_1"
    pageEncoding="8859_1"%>
<% request.setCharacterEncoding("8859_1"); %>
<%
String name = "";
String strName = "";

/**
* 2016. 03. 21 / MYM
* 보안약점 조치
*/
name = strName =  request.getParameter("name");
if(strName == null) { strName = ""; }
name = new String(strName.getBytes("8859_1"),"EUC-KR");
String test2 = request.getParameter("name");
if(test2 == null){test2="";}
out.println(name);
out.println(test2);
%>
<html>
<head>
<title></title>
</head>
<body>
<form name="wform" method="post" action="request_test.jsp">
<input type="text" name="name" value="" size="30">
<input type="image" src="/image/test.gif">
</form>