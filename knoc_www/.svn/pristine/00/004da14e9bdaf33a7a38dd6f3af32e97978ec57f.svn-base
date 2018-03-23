<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.content.*"%>    
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.EngMenuManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	String depth1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth1")),"8859_1");
    String depth2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth2")),"8859_1");
   	String depth3 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth3")),"8859_1");
   	String name =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("name")),"8859_1");
   	String url =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("url")),"8859_1");
   	String status =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("status")),"8859_1");
   	int listnum1 = 0;
   	int listnum2 = 0;
   	int listnum3 = 0;
   	
   	String mcode = "";
   	if (depth2.equals("00")) {
   		mcode = MenuMa.getMCodeMax(depth1,10000);
   		listnum1 = MenuMa.getListNumMax(depth1,"1");
   		listnum2 = MenuMa.getListNumMax(depth1+depth2,"2");
   		listnum3 = MenuMa.getListNumMax(depth1+depth2+depth3,"3");
   	} else if (depth3.equals("00")) {
   		mcode = MenuMa.getMCodeMax(depth1+depth2,100);
   		listnum1 = MenuMa.getListNum(depth1+depth2,"1");
   		listnum2 = MenuMa.getListNumMax(depth1+depth2,"2");
   		listnum3 = MenuMa.getListNum(depth1+depth2+depth3,"3");
   	} else {
   		mcode = MenuMa.getMCodeMax(depth1+depth2+depth3,1);
   		listnum1 = MenuMa.getListNum(depth1+depth2,"1");
   		listnum2 = MenuMa.getListNum(depth1+depth2+depth3,"2");
   		listnum3 = MenuMa.getListNumMax(depth1+depth2+depth3,"3");
   	}
   	out.println(listnum3);
   	
	EngMenuBean mb = new EngMenuBean();
	mb.setMCode(mcode);
	mb.setName(name);
	mb.setUrl(url);
	mb.setStatus(status);
	mb.setListnum1(listnum1);
	mb.setListnum2(listnum2);
	mb.setListnum3(listnum3);
	boolean result = MenuMa.insertMenu(mb);
	
	if (!result) {
%>
<script language="javascript">
	alert("메등록이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("메뉴등록이 완료되었습니다.");
    location.href = "engMenuList.jsp?depth1=<%=depth1%>";
</script>
<% 	
  	}
%>