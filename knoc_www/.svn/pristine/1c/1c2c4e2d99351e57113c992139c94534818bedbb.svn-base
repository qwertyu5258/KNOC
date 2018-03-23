<%@page import="java.util.Random"%>
<%@page import="kr.co.knoc.sitectrl.mgr.MgrSession"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*"%>    
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.sague.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="sagueManager" scope="page" class="kr.co.knoc.sague.SagueManager" />	
<% request.setCharacterEncoding("euc-kr"); %>

<%
	
	MgrSession mgrSession = (MgrSession)session.getAttribute("ADMINSESSION");

	String file1 = "";
	String encoding = "EUC-KR";
	String path = etcutil.ETC_UPLOAD_ROOT + "/BOARD_04/";	
	String nowpage = "";
	
	File upFile = new File(path);
	if(!upFile.exists()) {
		upFile.mkdirs();
	}
	
	int maxUploadSize = 10 * 1024 *1024; 

	MultipartRequest agrequest = null;
	SagueBean sb = new SagueBean();
	SagueFileBean sf = new SagueFileBean();
	
	try{
		
		agrequest = new MultipartRequest(request, 
				 path,
				 maxUploadSize, 
				 encoding,
				 new DefaultFileRenamePolicy()
				 );
		
		int	sague_nid	= (agrequest.getParameter("sague_nid")==null)?0:Integer.parseInt(agrequest.getParameter("sague_nid"));
		
		//파일수정
		Random oRandom = new Random();
		boolean extensionSuccess = true;
	    if(agrequest.getFile("file1") != null && agrequest.getFile("file1").exists()){
	    	
			String today = StringUtil.getCurrentDate("yyyyMMddHHmmssSSS");
			File savedFile = agrequest.getFile("file1");
			String fileName = savedFile.getName();		    
		    //String fileIndex = fileName.replace("file", ""); // input file name = file1,file2...여러개 파일업로드시 몇번째 파일첨부인가? 
		    String savedName = agrequest.getFilesystemName("file1");
		    
		    if(savedName != null && !savedName.equals("")) {		    			    	
		        /* 파일 확장자 검사 */
		    	if(!etcutil.checkAllowedExtension("BOARD_04",savedFile.getName())){
		        	extensionSuccess = false;	
		        }

		    	String ext = "";
		 	    ext = savedName.toLowerCase().substring(savedName.lastIndexOf(".")+1);
		    	sf.setOrg_filenm(savedName);
		    	
		        File tmpFile = agrequest.getFile(fileName);
		        if(tmpFile != null)
		        	sf.setFile_size((int)tmpFile.length());
		            
		        sf.setSave_filenm(today + "1" + oRandom.nextInt(1000) + "."  + ext);		        
		        File newFile = new File(path + "" + sf.getSave_filenm());
		        savedFile.renameTo(newFile);		        		      
		        
		        if(savedFile != null && savedFile.exists()){
			        savedFile.delete();
			    }
		    }
		    
	    }	   

	    if(!extensionSuccess){
			/* Delete uploaded files */
		    if(agrequest.getFile("filename") != null && agrequest.getFile("filename").exists()){		    				    
			    File savedFile = agrequest.getFile("filename");
			    if(savedFile != null && savedFile.exists()){
			        savedFile.delete();
			    }
		    }
		    %><stl:msgBack msg="선택하신 화일은 업로드 하실 수 없습니다."/><%
		    return;
	    }
		
	    String subject = etcutil.strBlockSpecialTags(etcutil.checkNull(agrequest.getParameter("subject")));
		String reason = etcutil.strBlockSpecialTags(etcutil.checkNull(agrequest.getParameter("reason")));
		String contents = etcutil.checkNull(agrequest.getParameter("HTML_BODY"));
		String opinion = etcutil.strBlockSpecialTags(etcutil.checkNull(agrequest.getParameter("opinion")));
		String opinion_term = etcutil.strBlockSpecialTags(etcutil.checkNull(agrequest.getParameter("opinion_term")));
		String department = etcutil.strBlockSpecialTags(etcutil.checkNull(agrequest.getParameter("department")));
		String representatives = etcutil.strBlockSpecialTags(etcutil.checkNull(agrequest.getParameter("representatives")));
		String tel_no = etcutil.strBlockSpecialTags(etcutil.checkNull(agrequest.getParameter("tel_no")));
		String fax_no = etcutil.strBlockSpecialTags(etcutil.checkNull(agrequest.getParameter("fax_no")));
		String email = etcutil.strBlockSpecialTags(etcutil.checkNull(agrequest.getParameter("email")));
		String mod_id = mgrSession.getUserID();
		nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(agrequest.getParameter("page")));
		
		sb.setSubject(subject);
		sb.setReason(reason);
		sb.setContents(contents);
		sb.setOpinion(opinion);
		sb.setOpinion_term(opinion_term);
		sb.setDepartment(department);
		sb.setRepresentatives(representatives);
		sb.setTel_no(tel_no);
		sb.setFax_no(fax_no);
		sb.setEmail(email);
		sb.setMod_id(mod_id);
		sb.setSague_nid(sague_nid);
		
		//파일빈 셋팅
		sf.setLast_modifier(mod_id);
		sf.setFile_path(path);
		//sf.setFile_nid(file_nid);
		
	}catch(FileNotFoundException e){ // 보안약점 조치 2016.03.21 ECJ
		e.printStackTrace();
		throw e;
		
	}catch(Exception e){
		e.printStackTrace();
		throw e;
	}
		
	boolean result = sagueManager.updateSague(sb, sf);
	
%>

<%if (!result) { %>
<script type="text/javascript">
	alert("수정 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("수정 되었습니다.");
    location.href = "board_04.jsp?page=<%=nowpage%>";
</script>
<% 	
  	}
%> 



