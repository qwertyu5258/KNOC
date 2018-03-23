<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.term.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<jsp:useBean id="mainMana" class="kr.co.knoc.etc.MainCountManager" scope="request"/>

<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "기타 관리";  		// 서브 Depth 제목
    String gNavSubName = "etc";				// 서브 Depth 이름
    String gNavDepthTitle1 = "05"; 			// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 			// 홈 > 서브 > 뎁스1 > 뎁스2 제목

	application.setAttribute("gNavMenuDepth1", "12");
	application.setAttribute("gNavMenuDepth2", "01");
        
	String gNavPage = "용어사전 관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
		

	ArrayList list = mainMana.getYearList();

	String year = "";
	String month = "";
	if(request.getParameter("year") == null){
		year = DateUtil.getYear()+"";
	}else{
		year = request.getParameter("year");
	}
	
	if(request.getParameter("month") == null){
		month = DateUtil.getMonth()+""; 
	}else{
		month = request.getParameter("month");
	}
	
	System.out.println("month.length() :" +month.length());
	
	if(month.length() < 2){
		month = "0"+month;
	}
	
	
%>

<%
       response.setHeader("Content-Disposition", "attachment; filename=accessCount.xls");
       response.setHeader("Content-Description", "JSP Generated Data");
%>
				
					
<%

	int totalCount = mainMana.getTotalAccessCount();
%>							 
<div style="margin-bottom: 10px" align="right">TOTAL : <%=totalCount %></div>			
<!-- ROW 시작 -->	
<table width="100%"  border="1" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<%
	ArrayList accList = new ArrayList();

	HashMap hash = new HashMap();
	accList =  mainMana.getAccessList(year, month, "/index.jsp");
	
	if(accList.size() == 0){
		
	
		if(DateUtil.getMonth() < 10){
			month = "0"+DateUtil.getMonth();
			accList = mainMana.getAccessList(year, month, "/index.jsp");
		
		}else{
			month = ""+DateUtil.getMonth();
			accList = mainMana.getAccessList(year, month, "/index.jsp");
		}
%>
		
	<%			
		
	}
%>

			<tr height="25"  bgcolor="E7E7E7">
			<%
				
				for(int i=0; i<accList.size(); i++){
					hash = (HashMap)accList.get(i);
			%>
				<td align=center width="<%=100/(accList.size()+1) %>%"><%=hash.get("day") %>일</td>
			<%
				}
			%>	
			
				<td width="<%=100/(accList.size()+1) %>%" align=center>합계</td>
				
			</tr>    
			
			<tr bgcolor="#FFFFFF"> 
			<%
				int sumCount = 0;
				for(int i=0; i<accList.size(); i++){
					hash = (HashMap)accList.get(i);
					sumCount = sumCount+Integer.parseInt(hash.get("acc_count").toString());
					if(sumCount < 0){ sumCount = 1;}  // 보안약점 조치 2016.03.21 ECJ
			%>
				<td align=center><%=hash.get("acc_count") %></td>
			<%
				}
			%>	
				<td align=center width="<%=accList.size()+1*100/100 %>%"><%=sumCount %></td>
			</tr>
			
			</table>
		