<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.popup.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="PopupMa" scope="page" class="kr.co.knoc.popup.PopupNewManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	String StartDate = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("StartDate")).replace("-",""),"8859_1");
	String EndDate = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("EndDate")).replace("-",""),"8859_1");
	String visibility = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("visibility")),"8859_1");
	String title = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("title")),"8859_1");
	String content = request.getParameter("content");
	//try{ content = new String(content.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }	
	
	int width =  (request.getParameter("width")==null)?0:Integer.parseInt(request.getParameter("width"));
	int height =  (request.getParameter("height")==null)?0:Integer.parseInt(request.getParameter("height"));
	String scroll = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("scroll")),"8859_1");
	String cookie = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("cookie")),"8859_1");
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");		
	
	PopupNewBean pnb = new PopupNewBean(); 
	pnb.setStartDate(StartDate);
	pnb.setEndDate(EndDate);
	pnb.setVisibility(visibility);
	pnb.setTitle(title);
	pnb.setContent(content);
	pnb.setWidth(width);
	pnb.setHeight(height);
	pnb.setScroll(scroll);
	pnb.setCookie(cookie);	

	boolean result = PopupMa.insertPopupNew(pnb);

	if (!result) {
%>
<script language="javascript">
	alert("팝업등록이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("팝업등록이 완료되었습니다.");
    location.href = "popupNewList.jsp";
</script>
<% 	
  	}
%>  
