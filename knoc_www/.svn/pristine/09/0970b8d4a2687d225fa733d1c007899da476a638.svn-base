<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.mgr.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MgrH" scope="page" class="kr.co.knoc.mgr.MgrHelper" />
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "회원관리";  		// 서브 Depth 제목
    String gNavSubName = "member";				// 서브 Depth 이름
    String gNavDepthTitle1 = "02"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

	application.setAttribute("gNavMenuDepth1","02");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "회원현황";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");
	String choice = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("choice")),"8859_1");
	String yearsh = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("yearsh")),"8859_1");
	String monthsh = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("monthsh")),"8859_1");
	String st_date = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("st_date")),"8859_1");
	String ed_date = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("ed_date")),"8859_1");
	String page_option = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page_option")),"8859_1");	
%>
<%@ include file="../inc/top.jsp" %>
<script language="javascript">
	function goFind(){
		if(document.form1.choice.value == "" || document.form1.choice.value == null)
		{
			alert("검색조건을 선택하여 주십시요");
		}	
		else if(document.form1.st_date.value == "" || document.form1.st_date.value == null)
		{
			alert("기간을 선택하여 주십시요");
		}			
		else if(document.form1.choice.value == "1")
		{
			document.form1.page_option.value ="YearList";
			document.form1.submit();
		
		}		
		else if(document.form1.choice.value == "2") {
			document.form1.page_option.value ="MonthList";
			document.form1.submit();			
		}
		else if(document.form1.choice.value == "3") {
			document.form1.page_option.value ="WeekList";
			document.form1.submit();
		}	
		else if(document.form1.choice.value == "4") {
			document.form1.page_option.value ="DayList";
			document.form1.submit();
		}
	}

	function onSelectYear(obj)  {
	  	var frm = document.form1;
	  	
	    var dt_datetime = new Date();
	
	    if(obj.value != "00") {
	      	dt_datetime.setYear(obj.value, dt_datetime.getFullYear());
	    	
	    	if(frm.monthsh.value != "") {
		    	var sMonth = frm.monthsh.value -1;		
		    	dt_datetime.setMonth(sMonth);
		    } 
	
	      	var dt_next_month = new Date(dt_datetime);
	      	dt_next_month.setMonth(dt_datetime.getMonth()+1);
	
	      	var dt_lastday  = new Date(dt_next_month);
	      	dt_lastday.setDate(0);
	      	var dt_month = (dt_datetime.getMonth()-10).toString().length==1?"0"+(dt_datetime.getMonth()-10):""+(dt_datetime.getMonth()-10);
	
	      
	      	frm.st_date.value = dt_datetime.getFullYear() + "-01" + "-01";
	      	frm.ed_date.value = dt_datetime.getFullYear() + "-12" + "-" + dt_lastday.getDate();
	
	    } else {
	    	frm.st_date.value = "";
	      	frm.ed_date.value = "";
	
		}
	}

   function onSelectMonth(obj)  {
  		var frm = document.form1;
  	
    	var dt_datetime = new Date();

    	if(obj.value != "") {
    		var sMonth = obj.value - 1;
    	
    		if(frm.yearsh.value != "00") {
	    		dt_datetime.setYear(frm.yearsh.value);
	    	}
	    
      		dt_datetime.setMonth(sMonth, '1');

      		var dt_next_month = new Date(dt_datetime);
      		dt_next_month.setMonth(dt_datetime.getMonth()+1);

      		var dt_lastday  = new Date(dt_next_month);
      		dt_lastday.setDate(0);
      		var dt_month = (dt_datetime.getMonth()+1).toString().length==1?"0"+(dt_datetime.getMonth()+1):""+(dt_datetime.getMonth()+1);
      
      		frm.st_date.value = dt_datetime.getFullYear() + "-" + dt_month + "-01";
      		frm.ed_date.value = dt_datetime.getFullYear() + "-" + dt_month + "-" + dt_lastday.getDate();

    	} else {
      		frm.st_date.value = "";
      		frm.ed_date.value = "";
    	}
  	}
</script>
<script type="text/javascript" src="/share/js/calendar.js"></script>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="195" valign="top">  
<%@ include file = "left.jsp" %>  
</td>  
<td valign=top>
	<table width="100%" height="200"  border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td valign="top">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr>
		<td valign="top">			
			<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 회원관리 > 회원현황</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">회원관리 > 회원현황</span></td>
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
			<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
<form name="form1" method="post" aciont="memberStaticList.jsp">
<input type="hidden" name="page_option">		
			<tr height="25">
			<td bgcolor="E7E7E7" align="center">	
			검색조건		
			</td>
			<td bgcolor="#FFFFFF" style="padding-left:10px">
		      	<select name="choice" class="formNo">
				<option value="" >선택</option>
	            <option value="1" <% if (choice.equals("1")) { %>selected<% } %>>년간접속통계</option>
				<option value="2" <% if (choice.equals("2")) { %>selected<% } %>>월간접속통계</option>
				<option value="3" <% if (choice.equals("3")) { %>selected<% } %>>주간접속통계</option>
				<option value="4" <% if (choice.equals("4")) { %>selected<% } %>>일간접속통계</option>
				</select>
			</td>		
			</tr>
			<tr height="25">
			<td bgcolor="E7E7E7" align="center">	
			년간검색	
			</td>
			<td bgcolor="#FFFFFF" style="padding-left:10px">
		      	<select name="yearsh" class="formNo" onChange="onSelectYear(this)";>
		        <option value="00" >선택</option>
	            <option value="2007" <% if (yearsh.equals("2007")) { %>selected<% } %>>2007</option>
	            <option value="2008" <% if (yearsh.equals("2008")) { %>selected<% } %>>2008</option>
				<option value="2009" <% if (yearsh.equals("2009")) { %>selected<% } %>>2009</option>
				</select>		    
			</td>		
			</tr>
			<tr height="25">
			<td bgcolor="E7E7E7" align="center">	
			월간검색	
			</td>
			<td bgcolor="#FFFFFF" style="padding-left:10px">
		      	<select name="monthsh" class="formNo" onChange="onSelectMonth(this);">
				<option value="" >선택</option>
		        <option value="01" <% if (monthsh.equals("01")) { %>selected<% } %>>01</option>
	            <option value="02" <% if (monthsh.equals("02")) { %>selected<% } %>>02</option>
				<option value="03" <% if (monthsh.equals("03")) { %>selected<% } %>>03</option>
				<option value="04" <% if (monthsh.equals("04")) { %>selected<% } %>>04</option>
	            <option value="05" <% if (monthsh.equals("05")) { %>selected<% } %>>05</option>
				<option value="06" <% if (monthsh.equals("06")) { %>selected<% } %>>06</option>
				<option value="07" <% if (monthsh.equals("07")) { %>selected<% } %>>07</option>
	            <option value="08" <% if (monthsh.equals("08")) { %>selected<% } %>>08</option>
				<option value="09" <% if (monthsh.equals("09")) { %>selected<% } %>>09</option>
				<option value="10" <% if (monthsh.equals("10")) { %>selected<% } %>>10</option>
	            <option value="11" <% if (monthsh.equals("11")) { %>selected<% } %>>11</option>
				<option value="12" <% if (monthsh.equals("12")) { %>selected<% } %>>12</option>			
				</select>	    
			</td>		
			</tr>
			<tr height="25">
			<td bgcolor="E7E7E7" align="center">	
			일간검색	
			</td>
			<td bgcolor="#FFFFFF" style="padding-left:10px">
		      	<input name="st_date" type="text" size=15 value="<%=st_date %>" readonly onclick="showCalendar(this, st_date, 'yyyy-mm-dd')" class=input>
				~ <input name="ed_date" type="text" size=15 value="<%=ed_date %>" readonly onclick="showCalendar(this, ed_date, 'yyyy-mm-dd')" class=input>
			</td>		
			</tr>
			<tr height="25">
			<td colspan=2  bgcolor="#FFFFFF" align="center"><input type=button value=' 검색 ' class='button' onClick="javascript:goFind();"></td>
			</tr>
</form>		
			</table>
			<br>	
<!-- ROW 시작 -->
<%
if(page_option != null && page_option.equals("YearList") ){
	Vector vSelect = MgrH.selectYearList(st_date, ed_date);
%>	
			<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
			<tr height="25"  bgcolor="E7E7E7">
			<td align=center>년도</td>
			<td align=center>가입 회원수</td>
			</tr>    
<%  if(vSelect.isEmpty()) { %>				
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center colspan=2>등록된 회원이 없습니다.</td>
			</tr>
<% 
	} else {
		for(int i = 0; i < vSelect.size(); i++) {
			MgrDO data = (MgrDO)vSelect.elementAt(i);
%>																																	
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center><%=data.getDate() %></td>
			<td align=center><%=data.getCount()%>명</td>
			</tr>
<%				
		}
	}
%>				
			</table>
<%
} else if(page_option != null && page_option.equals("MonthList")) {
	Vector vSelect = MgrH.selectMonthList(st_date, ed_date);
%>	
			<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
			<tr height="25"  bgcolor="E7E7E7">
			<td align=center>년.월</td>
			<td align=center>가입 회원수</td>
			</tr>    
<%  if(vSelect.isEmpty()) { %>				
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center colspan=2>등록된 회원이 없습니다.</td>
			</tr>
<% 
	} else {
		for(int i = 0; i < vSelect.size(); i++) {
			MgrDO data = (MgrDO)vSelect.elementAt(i);
%>																																	
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center><%=data.getDate() %></td>
			<td align=center><%=data.getCount()%>명</td>
			</tr>
<%				
		}
	}
%>				
			</table>
<%
} else if(page_option != null && page_option.equals("DayList")) {
	Vector vSelect = MgrH.selectDayList(st_date, ed_date);
%>	
			<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
			<tr height="25"  bgcolor="E7E7E7">
			<td align=center>년.월.일</td>
			<td align=center>가입 회원수</td>
			</tr>    
<%  if(vSelect.isEmpty()) { %>				
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center colspan=2>등록된 회원이 없습니다.</td>
			</tr>
<% 
	} else {
		for(int i = 0; i < vSelect.size(); i++) {
			MgrDO data = (MgrDO)vSelect.elementAt(i);
%>																																	
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center><%=data.getDate() %></td>
			<td align=center><%=data.getCount()%>명</td>
			</tr>
<%				
		}
	}
%>				
			</table>			
<%
} else if(page_option != null && page_option.equals("WeekList")) {
	Vector vSelect = MgrH.selectWeekList(st_date, ed_date);
%>	
			<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="B5B5B5">
			<tr height="25"  bgcolor="E7E7E7">
			<td align=center>요일</td>
			<td align=center>가입 회원수</td>
			</tr>    
<%  if(vSelect.isEmpty()) { %>				
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center colspan=2>등록된 회원이 없습니다.</td>
			</tr>
<% 
	} else {
		String week = "";
		for(int i = 0; i < vSelect.size(); i++) {
			MgrDO data = (MgrDO)vSelect.elementAt(i);
			if (data.getDate().equals("2")) {
				week = "월";
			} else if (data.getDate().equals("3")) {
				week = "화";
			} else if (data.getDate().equals("4")) {
				week = "수";
			} else if (data.getDate().equals("5")) {
				week = "목";
			} else if (data.getDate().equals("6")) {
				week = "금";
			} else if (data.getDate().equals("7")) {
				week = "토";
			} else if (data.getDate().equals("1")) {
				week = "일";
			}
%>																																	
			<tr height="25"  bgcolor="#FFFFFF">
			<td align=center><%=week %></td>
			<td align=center><%=data.getCount()%>명</td>
			</tr>
<%				
		}
	}
%>				
			</table>					
<%
}
%>			
		</td>
		</tr>
</form>		
		</table>
		<br>
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
<%@ include file="../inc/bottom.jsp" %>	