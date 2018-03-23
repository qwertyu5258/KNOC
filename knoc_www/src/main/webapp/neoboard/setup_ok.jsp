<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*" %>
<%@ page import = "com.neoboard.util.*" %>
<%@ page import = "com.neoboard.*" %>
<jsp:useBean id="sm" class="com.neoboard.SetupManager" scope="page" />
<%
	EtcUtil etc = new EtcUtil();

	String DBPool = etc.strBlockSpecialTags(request.getParameter("DBPool"));
	String DBName = etc.strBlockSpecialTags(request.getParameter("DBName"));
	String DBIp = etc.strBlockSpecialTags(request.getParameter("DBIp"));
	String DBUser = etc.strBlockSpecialTags(request.getParameter("DBUser"));
	String DBPasswd = etc.strBlockSpecialTags(request.getParameter("DBPasswd"));

	String path = "/";
	ServletContext context = getServletContext();
	String absFolder = context.getRealPath(path);
	
	FileWriter fw = new FileWriter(absFolder + "WEB-INF\\classes\\DB.properties");			
	DBPool = "DBPool=" + DBPool;		
	DBName = "DBName=" + DBName;	
	DBIp = "DBIp=" + DBIp;	
	DBUser = "DBUser=" + DBUser;	
	DBPasswd = "DBPasswd=" + DBPasswd;	
	
	BufferedWriter bw = new BufferedWriter(fw);
	
	bw.write(DBPool,0,DBPool.length());		
	bw.newLine();
	bw.write(DBName,0,DBName.length());		
	bw.newLine();
	bw.write(DBIp,0,DBIp.length());		
	bw.newLine();
	bw.write(DBUser,0,DBUser.length());		
	bw.newLine();
	bw.write(DBPasswd,0,DBPasswd.length());		
	
	bw.close();
	fw.close();
	
	boolean result = sm.createTable();
	if (result) {
%>
<script type="text/javascript">
	alert("통합게시판 스키마 생성이 완료되었습니다.");
	location.href = "/";
</script>
<%
	} else {
%>		
<script type="text/javascript">
	alert("통합게시판 세팅 중 오류가 발생되었습니다. 이미 테이블이 생성이 되었거나 DB 정보 오류 입니다.");
	history.back();
</script>
<%
	}
%>	