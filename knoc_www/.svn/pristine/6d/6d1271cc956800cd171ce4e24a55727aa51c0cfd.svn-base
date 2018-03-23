<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*"%>        
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.ebook.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="EbookMa" scope="page" class="kr.co.knoc.ebook.EbookManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   	
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	String key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_gbn")));
	String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("key_word")));
	String menu = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("menu")));
	int	no	= (request.getParameter("no")==null)?0:Integer.parseInt(request.getParameter("no"));
	if(no <= 0) {
	%>		
		<stl:msgBack msg="존재하지 않는 게시물입니다."/>
	<%	
		return;
	}
	
	String path = etcutil.ETC_UPLOAD_ROOT + "/EBOOK/";	
	EbookBean eb = EbookMa.getEbook(no);
	if (eb.getNewFilename() != null && !eb.getNewFilename().equals("")) {
		File oldFile = new File(path + "" + eb.getNewFilename());	        		      		        
        if(oldFile != null && oldFile.exists()){
        	oldFile.delete();
	    }
	}
	if (eb.getNewImagename() != null && !eb.getNewImagename().equals("")) {
		File oldFile = new File(path + "" + eb.getNewImagename());	        		      		        
        if(oldFile != null && oldFile.exists()){
        	oldFile.delete();
	    }
	}
	boolean result = EbookMa.deleteEbook(no);
	
	if (!result) {
%>
<script language="javascript">
	alert("EBOOK삭제가 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("EBOOK삭제가 완료되었습니다.");
    location.href = "ebookList.jsp?page=<%=nowpage%>&key_gbn=<%=key_gbn%>&key_word=<%=key_word%>&menu=<%=menu%>";
</script>
<% 	
  	}
%>