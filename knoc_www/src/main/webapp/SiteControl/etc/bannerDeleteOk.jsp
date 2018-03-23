<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*"%>        
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.banner.*"%> 
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="BannerMa" scope="page" class="kr.co.knoc.banner.BannerManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   	
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));

	int	no	= (request.getParameter("no")==null)?0:Integer.parseInt(request.getParameter("no"));
	if(no <= 0) {
	%>		
		<stl:msgBack msg="존재하지 않는 게시물입니다."/>
	<%	
		return;
	}
	
	String path = etcutil.ETC_UPLOAD_ROOT + "/BANNER/";	
	BannerBean pb = BannerMa.getBanner(no);
	if (pb.getNewFilename() != null && !pb.getNewFilename().equals("")) {
		File oldFile = new File(path + "" + pb.getNewFilename());	        		      		        
        if(oldFile != null && oldFile.exists()){
        	oldFile.delete();
	    }
	}
	boolean result = BannerMa.deleteBanner(no);
	
	String search_pageLang = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("search_pageLang")));
	
	if (!result) {
%>
<script type="text/javascript">
	alert("배너삭제가 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("배너삭제가 완료되었습니다.");
    location.href = "bannerList.jsp?page=<%=nowpage%>&search_pageLang=<%=search_pageLang %>";
</script>
<% 	
  	}
%>