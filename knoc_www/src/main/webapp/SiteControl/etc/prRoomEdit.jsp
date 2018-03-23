<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@page import="kr.co.knoc.prroom.PrRoomBean"%>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="prma" scope="page" class="kr.co.knoc.prroom.PrRoomManager" />
<% request.setCharacterEncoding("euc-kr"); %>
<%	
	int nid = Integer.parseInt(request.getParameter("nid"));
	String url = request.getParameter("url_"+nid);	
	
	PrRoomBean prm = new PrRoomBean();
	
	try{	
		prm.setNid(nid);
		prm.setUrl(url);
		
	}catch(Exception e){
		out.println(e.toString());
	}
	
	boolean result = prma.updatePrRoom(prm);
	
	if(!result){
%>
	<script type="text/javascript">
		alert("적용 중 오류가 발생되었습니다.");
		history.back();
	</script>
<%		
	}else{
%>
	<script type="text/javascript">
		alert("적용 되었습니다.");
	    location.href = "engMainAdministration.jsp";
	</script>
<%} %>
