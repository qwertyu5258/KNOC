<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*"%>    
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.banner.*"%>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="BannerMa" scope="page" class="kr.co.knoc.banner.BannerManager" />		
<% request.setCharacterEncoding("euc-kr"); %>
<%   
	String filename = "";
	String encoding = "EUC-KR";
	String path = etcutil.ETC_UPLOAD_ROOT + "/BANNER/";	    

	File upFile = new File(path);
	if(!upFile.exists()) {
    	upFile.mkdirs();
	}

	int maxUploadSize = 10 * 1024 *1024; 
	MultipartRequest mrequest = null;
	
	BannerBean pb = new BannerBean();

	try{
		mrequest = new MultipartRequest(request, 
									 path,
									 maxUploadSize, 
									 encoding,
									 new DefaultFileRenamePolicy()
									 );
		
		java.util.Random oRandom = new java.util.Random();
		boolean extensionSuccess = true;
	    if(mrequest.getFile("filename") != null && mrequest.getFile("filename").exists()){
			String today=StringUtil.getCurrentDate("yyyyMMddHHmmssSSS");
			File savedFile = mrequest.getFile("filename");
			String fileName = savedFile.getName();		    
		    String fileIndex = fileName.replace("file", ""); // input file name = file1,file2...여러개 파일업로드시 몇번째 파일첨부인가? 
		    String savedName = mrequest.getFilesystemName("filename");
		    
		    if(savedName != null && !savedName.equals("")) {		    			    	
		        /* 파일 확장자 검사 */
		    	if(!etcutil.checkAllowedExtension("BANNER",savedFile.getName())){
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
	    
	    String pageLang = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("pageLang")));
		String StartDate = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("StartDate")).replace("-",""));
		String EndDate = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("EndDate")).replace("-",""));
		String visibility = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("visibility")));
		int shownum =  (mrequest.getParameter("shownum")==null)?0:Integer.parseInt(mrequest.getParameter("shownum"));
		String title = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("title")));
		String linkurl = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("linkurl")));
		String linktype = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("linkType")));
		String alttext = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("alttext")));
		String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("page")));		
	
		pb.setPageLang(pageLang);
		pb.setStartDate(StartDate);
		pb.setEndDate(EndDate);
		pb.setVisibility(visibility);
		pb.setShownum(shownum);
		pb.setTitle(title);
		pb.setLinkUrl(linkurl);
		pb.setLinkType(linktype);
		pb.setAlttext(alttext);
	
	}catch(IOException e){
		out.println(e.toString());
	}catch(Exception e){
		out.println(e.toString());
	}

	boolean result = BannerMa.insertBanner(pb);

	String search_pageLang = etcutil.strBlockSpecialTags(etcutil.checkNull(mrequest.getParameter("search_pageLang")));
	
	if (!result) {
%>
<script type="text/javascript">
	alert("배너등록이 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("배너등록이 완료되었습니다.");
    location.href = "bannerList.jsp?search_pageLang=<%=search_pageLang %>";
</script>
<% 	
  	}
%>  
