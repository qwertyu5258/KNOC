<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*"%>
<%@ page import = "java.util.*"%>        
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.ebook.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="EbookMa" scope="page" class="kr.co.knoc.ebook.EbookManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	String filename = "";
	String encoding = "EUC-KR";
	String path = etcutil.ETC_UPLOAD_ROOT + "/EBOOK/";	    

	File upFile = new File(path);
	if(!upFile.exists()) {
    	upFile.mkdirs();
	}

	int maxUploadSize = 10 * 1024 *1024; 
	MultipartRequest mrequest = null; 
	EbookBean eb = new EbookBean();

	try{
		mrequest = new MultipartRequest(request, 
									 path,
									 maxUploadSize, 
									 encoding,
									 new DefaultFileRenamePolicy()
									 );
		
		java.util.Random oRandom = new java.util.Random();
		boolean extensionSuccess = true;	    
	    for(Enumeration e = mrequest.getFileNames(); e.hasMoreElements();) {
	    	String today=StringUtil.getCurrentDate("yyyyMMddHHmmssSSS");
			
			String fileName = (String)e.nextElement();		    
			String fileIndex = fileName.replace("file", ""); // input file name = file1,file2...여러개 파일업로드시 몇번째 파일첨부인가? 
		    String savedName = mrequest.getFilesystemName(fileName);
		    File savedFile = mrequest.getFile(fileName);
		    if(savedName != null && !savedName.equals("")) {		    			    	
		        /* 파일 확장자 검사 */
		    	if(!etcutil.checkAllowedExtension("EBOOK",savedFile.getName())){
		        	extensionSuccess = false;	
		        }
		    	String ext = "";
		 	    ext = savedName.toLowerCase().substring(savedName.lastIndexOf(".")+1);
		 	   	File tmpFile = mrequest.getFile(fileName);
		 	   	if (fileIndex.equals("1")) { 
			 	    if (!ext.equals("jpg") && !ext.equals("jpeg") && !ext.equals("gif")) {
			 	    	extensionSuccess = false;	
			 	    }

			 	   	eb.setImage(savedName);		        
	        		if(tmpFile != null)
	        			eb.setImageSize((int)tmpFile.length());		        	
	            
	        		eb.setNewImagename(today + "1" + oRandom.nextInt(1000) + "."  + ext);
	        		File newFile = new File(path + "" + eb.getNewImagename());
			        savedFile.renameTo(newFile);
		 	   	} else {
			 	   	eb.setFilename(savedName);		        
		        	if(tmpFile != null)
		        		eb.setFilesize((int)tmpFile.length());		        	
		            
		        	eb.setNewFilename(today + "1" + oRandom.nextInt(1000) + "."  + ext);
		        	File newFile = new File(path + "" + eb.getNewFilename());
			        savedFile.renameTo(newFile);
		 	   	}		        		        		     
		        
		        if(savedFile != null && savedFile.exists()){
			        savedFile.delete();
			    }
		    }
	    }

	    if(!extensionSuccess){
			/* Delete uploaded files */
			for(Enumeration e = mrequest.getFileNames(); e.hasMoreElements();) {		    	
			    String fileName = (String)e.nextElement();
			    
			    File savedFile = mrequest.getFile(fileName);
			    if(savedFile != null && savedFile.exists()){
			        savedFile.delete();
			    }
		    }
		    %><stl:msgBack msg="선택하신 화일은 업로드 하실 수 없습니다."/><%
		    return;
	    }
	    
		String title = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("title")));
		String link = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("link")));
		String menu = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("menu")));
		String key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("key_gbn")));
		String key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("key_word")));
		String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("page")));		
	
		eb.setTitle(title);
		eb.setLink(link);
		eb.setMenu(menu);
		eb.setIp(request.getRemoteAddr());
		
	}catch(IOException e){
		out.println(e.toString());
	}catch(Exception e){
		out.println(e.toString());
	}

	boolean result = EbookMa.insertEbook(eb);

	if (!result) {
%>
<script language="javascript">
	alert("EBOOK등록이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("EBOOK등록이 완료되었습니다.");
    location.href = "ebookList.jsp";
</script>
<% 	
  	}
%>  
