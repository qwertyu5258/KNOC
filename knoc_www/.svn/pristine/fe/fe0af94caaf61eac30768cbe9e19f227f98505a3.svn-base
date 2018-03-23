<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.content.*"%>    
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="MenuMa" scope="page" class="kr.co.knoc.content.MenuManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	int mno = request.getParameter("mno") == null ? 0 : Integer.parseInt(request.getParameter("mno"));
	int mno2 = request.getParameter("mno2") == null ? 0 : Integer.parseInt(request.getParameter("mno2"));
	String mcode =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("mcode")),"8859_1");
	String depth1 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth1")),"8859_1");
	String depth2 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth2")),"8859_1");
	String depth3 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth3")),"8859_1");
	String depth4 =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("depth4")),"8859_1");
	if (mno <=0 || mno2 <= 0 || mcode == null || mcode.equals("")) {
%>
<script language="javascript">
	alert("잘못된 호출입니다.");
	history.back();
</script>
<%	
		return;
	}
	
	MenuBean mb = new MenuBean();
	int listnum1 = 0;
	int listnum2 = 0;	
	boolean result = false;
	if (depth2.equals("00")) {
		mb = MenuMa.getMenu(mno2);
		listnum1 = mb.getListnum1();
		mb = MenuMa.getMenu(mno);
		listnum2 = mb.getListnum1();
		result = MenuMa.updateListnum(mno, listnum1, listnum2, mcode, "UP");	
   	} else if (depth3.equals("00")) {
   		mb = MenuMa.getMenu(mno2);
		listnum1 = mb.getListnum2();
		mb = MenuMa.getMenu(mno);
		listnum2 = mb.getListnum2();
		result = MenuMa.updateListnum2(mno, listnum1, listnum2, mcode, "UP");
   	} else {
   		mb = MenuMa.getMenu(mno2);
		listnum1 = mb.getListnum3();
		mb = MenuMa.getMenu(mno);
		listnum2 = mb.getListnum3();
		result = MenuMa.updateListnum3(mno, listnum1, listnum2, mcode, "UP");
   	}
		
	if (!result) {
%>
<script language="javascript">
	alert("메뉴수정이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("메뉴수정이 완료되었습니다.");
    location.href = "menuListEdit.jsp?depth1=<%=depth1%>&depth2=<%=depth2%>&depth3=<%=depth3%>&depth4=<%=depth4%>";
</script>
<% 	
  	}
%>