<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*"%>
<%@ page import = "java.util.*"%>      
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.hongbo.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="HongboMa" scope="page" class="kr.co.knoc.hongbo.HongboManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   	
	String filename = "";
	String encoding = "EUC-KR";
	String path = EtcUtil.ETC_UPLOAD_ROOT + "/HONGBO/";
	String key_gbn = "";
	String key_word = "";
	String menu = "";
	String nowpage = "";

	File upFile = new File(path);
	if(!upFile.exists()) {
    	upFile.mkdirs();
	}

	int maxUploadSize = 10 * 1024 *1024; 
	MultipartRequest mrequest = null; 
	HongboBean hb = new HongboBean();

	try{
		mrequest = new MultipartRequest(request, 
									 path,
									 maxUploadSize, 
									 encoding,
									 new DefaultFileRenamePolicy()
									 );
		
		int	no	= (mrequest.getParameter("no")==null)?0:Integer.parseInt(mrequest.getParameter("no"));
		if(no <= 0) {
	%>		
		<stl:msgBack msg="존재하지 않는 게시물입니다."/>
	<%	
			return;
		}
		
		hb = HongboMa.getHongbo(no);	    
		String filename2 = hb.getFilename();
		int filesize = hb.getFilesize();
		String new_filename = hb.getNewFilename();
		
		java.util.Random oRandom = new java.util.Random();
		boolean extensionSuccess = true;
		int fileupdate = (mrequest.getParameter("fileupdate")==null)?0:Integer.parseInt(mrequest.getParameter("fileupdate"));
		String oldFilename = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("oldFilename")));
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
		 	    if (!ext.equals("jpg") && !ext.equals("jpeg") && !ext.equals("gif")) {
		 	    	extensionSuccess = false;	
		 	    }

		 	    hb.setFilename(savedName);        
        		if(tmpFile != null)
        			hb.setFilesize((int)tmpFile.length());		        	
            
        		hb.setNewFilename(today + "1" + oRandom.nextInt(1000) + "."  + ext);			 	    
        		File newFile = new File(path + "" + hb.getNewFilename());
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
		    } else {
		    	if (fileupdate > 0) {
			        File oldFile = new File(path + "" + oldFilename);	        		      		        
			        if(oldFile != null && oldFile.exists()){
			        	oldFile.delete();
				    }
			        hb.setFilename("");
			        hb.setFilesize(0);
			        hb.setNewFilename("");
		    	} else {
		    		hb.setFilename(filename2);
		    		hb.setFilesize(filesize);
		    		hb.setNewFilename(new_filename);
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
		key_gbn = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("key_gbn")));
		key_word = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("key_word")));
		nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("page")));		
	
		hb.setTitle(title);
		hb.setNo(no);
	
	}catch(IOException e){
		out.println(e.toString());
	}catch(Exception e){
		out.println(e.toString());
	}

	boolean result = HongboMa.updateHongbo(hb);


	if (!result) {
%>
<script language="javascript">
	alert("홍보사진수정이 실패하였습니다.");
	history.back();
</script>
<%
	} else {		
%>
<script type="text/javascript">
	alert("홍보사진수정이 완료되었습니다.");
    location.href = "hongboList.jsp?page=<%=nowpage%>&key_gbn=<%=key_gbn%>&key_word=<%=key_word%>";
</script>
<% 	
  	}
%>
