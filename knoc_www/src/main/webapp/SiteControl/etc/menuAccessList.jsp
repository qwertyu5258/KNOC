<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.content.*"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.MenuManager" />
<jsp:useBean id="mainMana" class="kr.co.knoc.etc.MainCountManager" scope="request"/>
<% request.setCharacterEncoding("euc-kr"); %>
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section ( 공백이 아니??Display )
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	String gNavSubTitle = "메뉴 및 페이지 관리";  		// 서브 Depth 제목
    String gNavSubName = "content";				// 서브 Depth 이름
    String gNavDepthTitle1 = "03"; 		// 홈 > 서브 > 뎁스1 제목
    String gNavDepthName1 = "";				// 홈 > 서브 > 뎁스1 이미지 태깅 이름
    String gNavDepthTitle2 = ""; 				// 홈 > 서브 > 뎁스1 > 뎁스2 제목

	application.setAttribute("gNavMenuDepth1","16");
	application.setAttribute("gNavMenuDepth2","01");
        
	String gNavPage = "메뉴관리";  					// 현제 페이지 제목
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>
<%
	ArrayList list = mainMana.getYearList();
	
	Calendar cal = GregorianCalendar.getInstance();
	String rank_year = request.getParameter("rank_year")!=null?request.getParameter("rank_year"):Integer.toString(cal.get(Calendar.YEAR));
	String rank_month = request.getParameter("rank_month")!=null?request.getParameter("rank_month"):String.format("%02d", cal.get(Calendar.MONTH)+1);
	String sdate = request.getParameter("sdate")!=null?request.getParameter("sdate"):"";
	String edate = request.getParameter("edate")!=null?request.getParameter("edate"):"";
	String period = request.getParameter("period")!=null?request.getParameter("period"):"";

	String depth1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth1")),"8859_1");
	if (depth1 == null || depth1.equals("")) {
		depth1 = "01";
	}
	String menu_name1 = "";
	if (depth1.equals("01")) {
		menu_name1 = "공사소개";
	} else if (depth1.equals("02")) {
		menu_name1 = "열린경영";
	} else if (depth1.equals("03")) {
		menu_name1 = "사업소개";
	} else if (depth1.equals("04")) {
		menu_name1 = "고객참여";
	} else if (depth1.equals("11")) {
		menu_name1 = "사이버홍보실";
	} else if (depth1.equals("05")) {
		menu_name1 = "정보마당";
	} else if (depth1.equals("06")) {
		menu_name1 = "석유기술연구";
	} else if (depth1.equals("07")) {
		menu_name1 = "어린이";
	} else if (depth1.equals("08")) {
		menu_name1 = "이사회";
	} else if (depth1.equals("09")) {
		menu_name1 = "기타서비스";
	} else if (depth1.equals("10")) {
		menu_name1 = "사이트검색";
	} else if (depth1.equals("12")) {
		menu_name1 = "인재개발센터";
	}  
%>
<%@ include file="../inc/top.jsp" %>

<link type="text/css" href="/include/js/jquery-ui-1.9.2.custom/css/jquery-ui-1.9.2.custom.css" rel="stylesheet" />
<script class="include" type="text/javascript" src="/include/js/jquery_plugin/dist/jquery.min.js"></script>
<script class="include" type="text/javascript" src="/include/js/bmt_jquery/bmt_util_jquery.js"></script>
<script class="include" type="text/javascript" src="/include/js/jquery-ui-1.9.2.custom/js/jquery-ui-1.9.2.custom.min.js"></script>

<script language="javascript">
	$(document).ready(function(){
		$("#sdate").bmt_datepicker("yy-mm-dd");
		$("#edate").bmt_datepicker("yy-mm-dd");
	});

	function searchMenuLang(){
		if($('#page_lang').val()=="KOR"){
			location.href="menuAccessList.jsp";
		}else{
			location.href="engMenuAccessList.jsp";
		}
	}
	
	function goSearchFn(){
		$('#fm01').append('<input type="hidden" name="period" value="true" />');		
		$('#fm01').submit();
	}
	
	function goExcel(rank_year, rank_month, sdate, edate, period){
		location.href="menuAccessExcelList.jsp?rank_year="+rank_year+"&rank_month="+rank_month+"&sdate="+sdate+"&edate="+edate+"&period="+period;
	}
	
</script>
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
			<td><img src="/SiteControl/images/admin_left_03.gif" width="11" height="11"> 메뉴 관리 > 메뉴관리</td>
			<td width="500" align="right" style="padding-right:20;">HOME > <span class="style6">메뉴 관리 > 메뉴관리</span></td>
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
			<form method="post" id="fm01" name="fm01" action="menuAccessList.jsp">
				<table align=center class=tableBorder border="0" cellpadding="0" cellspacing="0" width="100%">			
					<tr>
						<td class=descBorder_r width="240px;">
							<span>
								<select name="page_lang" id="page_lang" onchange="searchMenuLang();">
									<option value="KOR" selected="selected">국문</option>
									<option value="ENG">영문</option>
								</select>
							</span>						
							<span style="margin-left: 10px">
							<select name="rank_year" id="rank_year" onchange="$('#sdate').val(''); $('#edate').val(''); $('#fm01').submit();">
							<%
								HashMap hash = new HashMap();
								for(int i=0; i<list.size(); i++){
									hash = (HashMap)list.get(i);
							%>
								<option value="<%=hash.get("year") %>" <%=rank_year.equals(hash.get("year"))?"selected":"" %>><%=hash.get("year") %></option>
								
							<%
								}
							%>	
							
							<%
								ArrayList monthList = new ArrayList();
								monthList = mainMana.getMonthList(rank_year);
							%>
							</select> 년
							</span>
							<span style="margin-left: 5px">
							<select name="rank_month" id="rank_month" onchange="$('#sdate').val(''); $('#edate').val(''); $('#fm01').submit();">
							<%
								for(int i=0; i<monthList.size(); i++){
									hash = (HashMap)monthList.get(i);
							%>
								<option value="<%=hash.get("month") %>" <%=rank_month.equals(hash.get("month"))?"selected":"" %>><%=hash.get("month") %></option>
							<%
								}
							%>											
							</select> 월
							</span>
							<span style="margin-left: 10px">
								
							</span>						
						</td>
						<td>
							<input type="text" style="width: 70px;" id="sdate" name="sdate" value="<%=sdate %>" readonly /> ~ <input type="text" style="width: 70px;" id="edate" name="edate" value="<%=edate %>" readonly />
							<input type="button" value=" 검색" class="button" onclick="goSearchFn(); return false;"> 
						</td>
					</tr>        
				</table>	
			</form>
			<br>
		<%			
			ArrayList al02 = MenuMa.getMenuAccessRankList(rank_year, rank_month, sdate, edate, period);
		%>
			<table width="440" border="0" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
			<tr height="25"  bgcolor="000000">
			<td align=center width="60"><font color=ffffff>Rank</font></td>
			<td align=center width="100"><font color=ffffff>메뉴명</font></td>			
			<td align=center width="75"><font color=ffffff>접속COUNT</font></td>
			</tr>
			
			<%
				Iterator iter2 = al02.iterator();
				int i = 1;
				String bgcolor = "";	
				String delMcode = "";
				while(iter2.hasNext()){		
					MenuBean mb = (MenuBean)iter2.next();
					if (mb.getMCode().substring(4,8).equals("0000")) {
						bgcolor = "#8FA4BB";
						delMcode = mb.getMCode().substring(0,4);
					} else if (mb.getMCode().substring(6,8).equals("00")) {
						bgcolor = "#BBD5F0";
						delMcode = mb.getMCode().substring(0,6);
					} else {
						bgcolor = "#ECF4FC";			
						delMcode = mb.getMCode();
					}
			%>
			    
			<tr height="25"  bgcolor="<%=bgcolor %>">
			<td align=center><%=i %></td>						
			<td align=center><%=mb.getName() %></td>			
			<td align=center><%=mb.getAccessCnt() %></td>			
			</tr>			
			<%				
					i = i + 1;
				}
			%>			
			</table>
			<div style="margin-top: 10px; margin-left:359px;" align="left">
				<input type="button" value="엑셀다운로드" onclick="goExcel('<%=rank_year %>', '<%=rank_month %>', '<%=sdate %>', '<%=edate %>', '<%=period %>');"/>
			</div>
					
			<br />
			<table align=center class=tableBorder border="0" cellpadding="0" cellspacing="0" width="100%">		
			<tr>
			<td class=descBorder_r>
			<a href="menuAccessList.jsp?depth1=01">공사소개</a> 
			 | <a href="menuAccessList.jsp?depth1=02">열린경영</a>
			 | <a href="menuAccessList.jsp?depth1=03">사업소개</a>
			 | <a href="menuAccessList.jsp?depth1=04">고객참여</a>
			 | <a href="menuAccessList.jsp?depth1=11">사이버홍보실</a>
			 | <a href="menuAccessList.jsp?depth1=05">정보마당</a>
			 | <a href="menuAccessList.jsp?depth1=06">석유기술연구</a>
			 | <a href="menuAccessList.jsp?depth1=12">인재개발센터</a>
			 <!-- | <a href="menuAccessList.jsp?depth1=07">어린이</a> -->
			 | <a href="menuAccessList.jsp?depth1=08">이사회</a>
			 | <a href="menuAccessList.jsp?depth1=09">기타서비스</a>
			 | <a href="menuAccessList.jsp?depth1=10">사이트검색</a>
			</td>
			</tr>        
			</table>				
<!-- ROW 시작 -->	
<form name="bForm" method="post" action="menuList.jsp">
<input type="hidden" name="no" value="">
<input type="hidden" name="mcode" value="">
<input type="hidden" name="depth1" value="<%=depth1 %>">	
</form>
<% 
	ArrayList al01 = MenuMa.getMenuAccessList(depth1);	
%>
			<table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#CCCCCC">
			<tr height="25"  bgcolor="000000">
			<td align=center width="60"><font color=ffffff>no.</font></td>
			<td align=center width="100"><font color=ffffff>메뉴코드</font></td>
			<td align=center width="100"><font color=ffffff>메뉴명</font></td>			
			<td align=center><font color=ffffff>경로</font></td>			
			<td align=center width="75"><font color=ffffff>사용여부</font></td>						
			<td align=center width="75"><font color=ffffff>접속COUNT</font></td>
			</tr>    
<%
	Iterator iter = al01.iterator();
	i = 1;
	bgcolor = "";	
	delMcode = "";
	while(iter.hasNext()){		
		MenuBean mb = (MenuBean)iter.next();
		if (mb.getMCode().substring(4,8).equals("0000")) {
			bgcolor = "#8FA4BB";
			delMcode = mb.getMCode().substring(0,4);
		} else if (mb.getMCode().substring(6,8).equals("00")) {
			bgcolor = "#BBD5F0";
			delMcode = mb.getMCode().substring(0,6);
		} else {
			bgcolor = "#ECF4FC";			
			delMcode = mb.getMCode();
		}
		String status_str = "";
		if("Y".equals(mb.getStatus())){
			status_str = "사용";
		}else{
			status_str = "미사용";
		}
%>																																	
			<tr height="25"  bgcolor="<%=bgcolor %>">
			<td align=center><%=i %></td>						
			<td align=center><%=mb.getMCode() %></td>			
			<td align=center><%=mb.getName() %></td>			
			<td align=center><a href="<%=mb.getUrl()%>" target="_blank"><%=menu_name1 %> <%=MenuMa.getMenuName(mb.getMCode()) %></a></td>						
			<td align=center><%=status_str %></td>
			<td align=center><%=mb.getAccessCnt() %></td>
			</tr>
<%
		i = i + 1;
	}
%>				
			</table>
		</td>
		</tr>
		</table>		
		<br>					
	</td>
	</tr>
	</table>
</td>
</tr>
</table>
<%@ include file="../inc/bottom.jsp" %>	