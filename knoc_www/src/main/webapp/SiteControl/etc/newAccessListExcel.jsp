<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.term.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<jsp:useBean id="mainMana" class="kr.co.knoc.etc.MainCountManager" scope="request"/>

<% request.setCharacterEncoding("euc-kr"); %>
<%
	ArrayList list = mainMana.getYearList();

	String year = "";
	String month = "";
	if(request.getParameter("year") == null){
		year = DateUtil.getYear()+"";
	}else{
		year = request.getParameter("year");
	}
%>

<%
       response.setHeader("Content-Disposition", "attachment; filename=newAccessCount.xls");
       response.setHeader("Content-Description", "JSP Generated Data");
%>
				
					
<%
	ArrayList accList = new ArrayList();
	
	HashMap hash = new HashMap();
	accList =  mainMana.getNewAccessList(year);
	int totalCount=0;
	for(int i=0; i<accList.size(); i++){
		hash = (HashMap)accList.get(i);
		/**
		 * 2016.3.21 JSM
		 * 보안약점 조치
		 */		
		if(hash != null){
			totalCount += Integer.parseInt(hash.get("acc_count").toString());
		}
	}
%>
<div style="margin-bottom: 10px" align="right">TOTAL : <%=totalCount %></div>
<!-- ROW 시작 -->	
<table width="80%"  border="1" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
	<tr height="25"  bgcolor="E7E7E7">
		<td align="center" width="6%"><%=year %>년</td>
	<%
		for(int i=0; i<accList.size(); i++){
			hash = (HashMap)accList.get(i);
	%>
		<td align=center width="6%"><%=hash.get("month") %>월</td>
	<%
		}
	%>	
	</tr>    
	
	<tr bgcolor="#FFFFFF">
		<td align="center">전체접속자</td>
	<%
		for(int i=0; i<accList.size(); i++){
			hash = (HashMap)accList.get(i);
	%>
		<td align="center"><%=hash.get("acc_count") %></td>
	<%
		}
	%>	
	</tr>
	
	<tr bgcolor="#FFFFFF">
		<td align="center">평균접속자</td>
	<%
		for(int i=0; i<accList.size(); i++){
			hash = (HashMap)accList.get(i);
	%>
		<td align=center><%=hash.get("avg_count") %></td>
	<%
		}
	%>	
	</tr>
</table>
		