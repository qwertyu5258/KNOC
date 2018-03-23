<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*"%>    
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.mobile.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="EventMa" scope="page" class="kr.co.knoc.mobile.EventManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   	
	String filename = "";
	String encoding = "EUC-KR";
	String path = EtcUtil.ETC_UPLOAD_ROOT + "/MOBILE/";
	String nowpage = "";

	File upFile = new File(path);
	if(!upFile.exists()) {
    	upFile.mkdirs();
	}

	int maxUploadSize = 10 * 1024 *1024; 
	MultipartRequest mrequest = null; 
	EventBean pb = new EventBean();

	try{
		mrequest = new MultipartRequest(request, 
									 path,
									 maxUploadSize, 
									 encoding,
									 new DefaultFileRenamePolicy()
									 );
		
		int	no	= (mrequest.getParameter("no")==null)?0:Integer.parseInt(mrequest.getParameter("no"));
				
		java.util.Random oRandom = new java.util.Random();
		boolean extensionSuccess = true;
		int fileupdate = (mrequest.getParameter("fileupdate")==null)?0:Integer.parseInt(mrequest.getParameter("fileupdate"));
		String oldFilename = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("oldFilename")));
	    if(mrequest.getFile("filename") != null && mrequest.getFile("filename").exists()){
			String today=StringUtil.getCurrentDate("yyyyMMddHHmmssSSS");
			File savedFile = mrequest.getFile("filename");
			String fileName = savedFile.getName();		    
		    String fileIndex = fileName.replace("file", ""); // input file name = file1,file2...여러개 파일업로드시 몇번째 파일첨부인가? 
		    String savedName = mrequest.getFilesystemName("filename");
		    
		    if(savedName != null && !savedName.equals("")) {		    			    	
		        /* 파일 확장자 검사 */
		    	if(!EtcUtil.checkAllowedExtension("BANNER",savedFile.getName())){
		        	extensionSuccess = false;	
		        }
		    	String ext = "";
		 	    ext = savedName.toLowerCase().substring(savedName.lastIndexOf(".")+1);
		 	    if (!ext.equals("jpg") && !ext.equals("jpeg") && !ext.equals("gif")) {
		 	    	extensionSuccess = false;	
		 	    }

		        pb.setFilename(savedName);
		        File tmpFile = mrequest.getFile(fileName);
		        if(tmpFile != null)
		        	pb.setFilesize((int)tmpFile.length());
		            
		        pb.setNewFilename(today + "1" + oRandom.nextInt(1000) + "."  + ext);		        
		        File newFile = new File(path + "" + pb.getNewFilename());
		        savedFile.renameTo(newFile);		        		      
		        
		        if(savedFile != null && savedFile.exists()){
			        savedFile.delete();
			    }
		        
		        if (fileupdate > 0) {
			        File oldFile = new File(path + "" + oldFilename);	        		      		        
			        if(oldFile != null && oldFile.exists()){
			        	oldFile.delete();
				    }
		        }
		    }		    
	    } else {
	    	if (fileupdate > 0) {
		        File oldFile = new File(path + "" + oldFilename);	        		      		        
		        if(oldFile != null && oldFile.exists()){
		        	oldFile.delete();
			    }
		        pb.setFilename("");
		        pb.setFilesize(0);
		        pb.setNewFilename("");
	        } else {
	        	pb = EventMa.getEvent();	        	
	        }
	    }

	    if(!extensionSuccess){
			/* Delete uploaded files */
		    if(mrequest.getFile("filename") != null && mrequest.getFile("filename").exists()){		    				    
			    File savedFile = mrequest.getFile("filename");
			    if(savedFile != null && savedFile.exists()){
			        savedFile.delete();
			    }
		    }
		    %><stl:msgBack msg="선택하신 화일은 업로드 하실 수 없습니다."/><%
		    return;
	    }
	    
		String visibility = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("visibility")));
		String linkurl = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("linkurl")));
		String linktype = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("linkType")));

	
	
		
		pb.setVisibility(visibility);		
		pb.setLinkUrl(linkurl);
		pb.setLinkType(linktype);		
		pb.setNo(no);
	
	}catch(IOException e){
		out.println(e.toString());
	}catch(Exception e){
		out.println(e.toString());
	}

	boolean result = EventMa.updateEvent(pb);


	if (!result) {
%>
<script type="text/javascript">
	alert("이벤트수정이 실패하였습니다.");
	history.back();
</script>
<%
	} else {		
%>
<script type="text/javascript">
	alert("이벤트수정이 완료되었습니다.");
    location.href = "event_manager.jsp";
</script>
<% 	
  	}
%>
