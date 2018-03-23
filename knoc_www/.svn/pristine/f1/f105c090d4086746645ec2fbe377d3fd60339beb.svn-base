<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.term.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.content.*"%>
<%@ page import = "java.util.*"%>
<jsp:useBean id="mainMana" class="kr.co.knoc.etc.MainCountManager" scope="request"/>
<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.MenuManager" />

<% request.setCharacterEncoding("euc-kr"); %>
<%
	Calendar cal = GregorianCalendar.getInstance();
	String rank_year = request.getParameter("rank_year");
	String rank_month = request.getParameter("rank_month");
	String sdate = request.getParameter("sdate");
	String edate = request.getParameter("edate");
	String period = request.getParameter("period");
	
	System.out.println("rank_year : "+rank_year+", rank_month : "+rank_month+", sdate : "+sdate+", edate : "+edate+", period : "+period);

	response.setHeader("Content-Disposition", "attachment; filename=menuAccessRankList.xls");
	response.setHeader("Content-Description", "JSP Generated Data");

	ArrayList al02 = MenuMa.getMenuAccessRankList(rank_year, rank_month, sdate, edate, period);
	
	HashMap hash = new HashMap();
%>
<%if("".equals(period)){ %>
<div style="margin-bottom: 10px" align="right"><%=rank_year %>년 <%=rank_month %>월</div>
<%}else{ %>
<div style="margin-bottom: 10px" align="right"><%=sdate %> ~ <%=edate %></div>
<%} %>
<!-- ROW 시작 -->	
<table width="40%" border="1" cellspacing="1" cellpadding="1" bgcolor="B5B5B5">
	<tr height="25"  bgcolor="E7E7E7">
	<td align="center" width="20%">Rank</td>
	<td align="center" width="50%">메뉴명</td>			
	<td align="center" width="30%">접속COUNT</td>
	</tr>
	<%
		Iterator iter2 = al02.iterator();
		int i = 1;
		while(iter2.hasNext()){		
			MenuBean mb = (MenuBean)iter2.next();
	%>
	    
	<tr height="25"  bgcolor="#FFFFFF">
	<td align=center><%=i %></td>						
	<td align=center><%=mb.getName() %></td>			
	<td align=center><%=mb.getAccessCnt() %></td>			
	</tr>			
	<%				
			i = i + 1;
		}
	%>			
</table>
		