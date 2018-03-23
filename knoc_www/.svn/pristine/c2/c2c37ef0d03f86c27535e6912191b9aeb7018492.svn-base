<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.term.*"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
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

	application.setAttribute("gNavMenuDepth1", "05");
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
	
	//int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">
	function goFind()
	{
		var t = document.schform;
		t.submit();
	}	
	function edit(no) {
         	document.bForm.action = 'termEdit.jsp';
         	document.bForm.no.value = no;
           	document.bForm.submit();
	}
	function jsWrite() {
		location.href = "termWrite.jsp";
	}
	
	
	function searchList(){
		document.getElementById("form01").submit();
	}
	
	function goExcel(){
		location.href = "accessListExcel.jsp";
	}
</script>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="195" valign="top">
<%@ include file = "left.jsp" %> 
</td>  
<td valign=top>
<form action="/SiteControl/mobile/event_access.jsp" id="form01" name=""form01"">
	<table width="100%" height="200"  border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top">
				<table width="100%"  border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td valign="top">			
							<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 모바일관리 > 이벤트접속통계</td>
									<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6"> 모바일관리 > 이벤트접속통계</span></td>
								</tr>
								<tr>
									<td height="2" colspan="2" bgcolor="EAEAEC"></td>
								</tr>
							</table>
						<table width="100%" height="15"  border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td></td>
							</tr>
						</table>
						<table align=center class=tableBorder border="0" cellpadding="0" cellspacing="0" width="100%">			
							<tr>
								<td class=descBorder_r>
									<span>
									<select name="year" id="year" onchange="searchList();">
									<%
									
										
										
										HashMap hash = new HashMap();
										for(int i=0; i<list.size(); i++){
											hash = (HashMap)list.get(i);
									%>
										<option value="<%=hash.get("year") %>"  <%if(year.equals(hash.get("year"))){out.print("selected");} %>><%=hash.get("year") %></option>
										
									<%
										}
									%>	
									
									<%
										ArrayList monthList = new ArrayList();
										monthList = mainMana.getMonthList(year);
									
									%>
									</select> 년
									</span>
									<span style="margin-left: 10px">
									<select name="month" id="month" onchange="searchList();">
									<%
										for(int i=0; i<monthList.size(); i++){
											hash = (HashMap)monthList.get(i);
									%>
										<option value="<%=hash.get("month") %>" <%if(month.equals(hash.get("month"))){out.print("selected");} %>><%=hash.get("month") %></option>
									<%
										}
									%>											
									</select> 월
									</span>
									<span style="margin-left: 10px">
										
									</span>									
								</td>
							</tr>        
						</table>	
						<br>	
<%

	int totalCount = mainMana.getTotalAccessCount();
%>							 
						
<!-- ROW 시작 -->	
<div align="right">
	<h5>더 큰 대한민국 퀴즈 이벤트</h5>
</div>
			<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<%
	ArrayList accList = new ArrayList();


	accList =  mainMana.getAccessList(year, month, "/mobile/event/201107/event.do");
	
	if(accList.size() == 0){
		
	
		if(DateUtil.getMonth() < 10){
			month = "0"+DateUtil.getMonth();
			accList = mainMana.getAccessList(year, month, "/mobile/event/201107/event.do");
		
		}else{
			month = ""+DateUtil.getMonth();
			accList = mainMana.getAccessList(year, month, "/mobile/event/201107/event.do");
		}
%>
		<script>
		
			//document.getElementById("month").value = "<%=month %>"			
		</script>
	<%			
		
	}
%>
<input type=hidden name=page value="<%//=nowpage%>">	
<input type="hidden" name="no" value="">	
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
					if(sumCount < 0){ sumCount = 1;} // 보안약점 조치 2016.03.21 ECJ
			%>
				<td align=center><%=hash.get("acc_count") %></td>
			<%
				}
			%>	
				<td align=center width="<%=accList.size()+1*100/100 %>%"><%=sumCount %></td>
			</tr>
			
			</table>
		</td>
		</tr>
	
		</table>
		<div style="margin-top: 10px" align="right">
			<input type="button" value="엑셀다운로드" onclick="goExcel();"/>
		</div>
		<br>		

<%
	//if(){
%>		

<%
	//}
%>
	</td>
	</tr>
	</table>
	
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
</form>
<%@ include file="../inc/bottom.jsp" %>	