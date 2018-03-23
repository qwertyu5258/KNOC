<%@page import="kr.co.knoc.division.DivisionListManager"%>
<%@ page contentType="application/vnd.ms-excel;charset=euc-kr" %>

<%@page import="kr.co.knoc.jdbc.DBUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>

<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />

<%
response.setHeader("Content-Disposition", "attachment; filename=admin.xls");
response.setHeader("Content-Description", "JSP Generated Data");
%>

<%
	Connection con = null;
	ResultSet rs = null;
	PreparedStatement prestmt = null;

	ArrayList adminList = new ArrayList();
	HashMap hashMap = new HashMap();

	StringBuffer query1 = new StringBuffer();
	StringBuffer query2 = new StringBuffer();
	StringBuffer query3 = new StringBuffer();

	query1.append(" SELECT ");
	query1.append(" 		NO, D_CODE, NAME, ID, PASSWD, PHONE, MOBILE, FAX, EMAIL, ETC, JOINDATE, IP, USERLEVEL, ");
	query1.append("		DECODE(USERLEVEL, 1, '총괄관리자', 5, '부서관리자') AS USERLEVEL_STR, TO_CHAR(JOINDATE, 'YYYY-MM-DD') AS JOINDATE_STR");
	query1.append(" FROM ");
	query1.append(" 	ADMINTABLE ");
	query1.append(" ORDER BY NO ASC ");

	try{
		con = DBUtil.getConnection();

		prestmt = con.prepareStatement(query1.toString());
		rs = prestmt.executeQuery();

		while(rs.next()){
			hashMap = new HashMap();
			hashMap.put("NO", rs.getString("NO"));
			hashMap.put("ID", rs.getString("ID"));
			hashMap.put("NAME", etcutil.checkNull(rs.getString("NAME")));
			hashMap.put("PASSWD", etcutil.checkNull(rs.getString("PASSWD")));
			hashMap.put("D_CODE", DivisionListManager.getDName(rs.getString("D_CODE")));
			hashMap.put("PHONE", etcutil.checkNull(rs.getString("PHONE")));
			hashMap.put("MOBILE", etcutil.checkNull(rs.getString("MOBILE")));
			hashMap.put("FAX", etcutil.checkNull(rs.getString("FAX")));
			hashMap.put("EMAIL", etcutil.checkNull(rs.getString("EMAIL")));
			hashMap.put("ETC", etcutil.checkNull(rs.getString("ETC")));
			hashMap.put("USERLEVEL", etcutil.checkNull(rs.getString("USERLEVEL_STR")));
			hashMap.put("JOINDATE", rs.getString("JOINDATE_STR"));
			hashMap.put("IP", rs.getString("IP"));

			adminList.add(hashMap);
		}

		rs.close(); rs = null;
		prestmt.close(); prestmt = null;

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{ if(rs != null) rs.close();	}catch(Exception e){}
		try{ if(prestmt != null) prestmt.close();	}catch(Exception e){}
		try{ if(con != null) con.close(); }catch(Exception e){}
	}
%>

<html>
<head>
<title>석유공사 관리자리스트</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<style>
table { font-size: 12px; }
table tbody tr th { height:40; background:#E7E7E7; color:#000; }
br { mso-data-placement:same-cell; }
</style>
</head>
<body>

<table cellSpacing="0" cellPadding="0" border="1" borderColor="#B5B5B5" width="100%" style="margin-top:20; text-align:center; color:#5c5c5c;">
	<colgroup>
		<col width="150"></col>
		<col width="120"></col>
		<col width="120"></col>
		<col width="120"></col>
		<col width="100"></col>
		<col width="100"></col>
		<col width="100"></col>
		<col width="120"></col>
		<col width="200"></col>
		<col width="100"></col>
		<col width="100"></col>
		<col width="100"></col>
	</colgroup>

	<tbody>
		<tr>
			<th align="center"><strong>부서</strong></th>
			<th align="center"><strong>아이디</strong></th>
			<th align="center"><strong>이름</strong></th>
			<th align="center"><strong>패스워드</strong></th>
			<th align="center"><strong>전화번호</strong></th>
			<th align="center"><strong>휴대폰</strong></th>
			<th align="center"><strong>팩스</strong></th>
			<th align="center"><strong>이메일</strong></th>
			<th align="center"><strong>기타</strong></th>
			<th align="center"><strong>관리자레벨</strong></th>
			<th align="center"><strong>가입일</strong></th>
			<th align="center"><strong>IP</strong></th>
		</tr>
	<%
		for(int i=0; i<adminList.size(); i++){
			hashMap = (HashMap)adminList.get(i);
	%>
		<tr>
			<td align="center"><%=hashMap.get("D_CODE") %></td>
			<td align="center"><%=hashMap.get("ID") %></td>
			<td align="center"><%=hashMap.get("NAME") %></td>
			<td align="center" style='mso-number-format:"\@";'><%=hashMap.get("PASSWD") %></td>
			<td align="center"><%=hashMap.get("PHONE") %></td>
			<td align="center"><%=hashMap.get("MOBILE") %></td>
			<td align="center"><%=hashMap.get("FAX") %></td>
			<td align="center"><%=hashMap.get("EMAIL") %></td>
			<td align="left"><%=hashMap.get("ETC") %></td>
			<td align="center"><%=hashMap.get("USERLEVEL") %></td>
			<td align="center"><%=hashMap.get("JOINDATE") %></td>
			<td align="center"><%=hashMap.get("IP") %></td>
		</tr>
	<%} %>
	</tbody>
</table>

</body>
</html>