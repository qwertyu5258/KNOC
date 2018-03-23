<%@page import="kr.co.knoc.gov_public_test.GovPublicFileBean"%>
<%@page import="kr.co.knoc.util.StringUtil"%>
<%@page import="java.util.Random"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="kr.co.knoc.util.EtcUtil"%>
<%@page import="kr.co.knoc.gov_public_test.GovPublicBean"%>
<%@page import="kr.co.knoc.sitectrl.mgr.MgrSession"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>

<sctrl:auth loginPage="../login.jsp" sessionName="ADMINSESSION"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="govPublicManager" scope="page" class="kr.co.knoc.gov_public_test.GovPublicManager" />
	
<% request.setCharacterEncoding("euc-kr"); %>

<%
	MgrSession ms = (MgrSession)request.getSession().getAttribute("ADMINSESSION");
	if(ms == null || (ms != null && (Integer.parseInt(ms.getUserLevel()) > 5))){
		out.print("<script>alert('접근권한이 없습니다.');history.back();</script>");
	}
%>

<%
	MgrSession mgrSession = (MgrSession)session.getAttribute("ADMINSESSION");

	GovPublicBean gb = new GovPublicBean();
	GovPublicFileBean gfb = new GovPublicFileBean();
	
	boolean result = false;
	String mode = "INSERT";
	String params = "?";
	
	String gpk = "";
	try{
		String file_path = EtcUtil.ETC_UPLOAD_ROOT + File.separator + "BOARD_05" + File.separator;
		File file = new File(file_path);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		MultipartRequest mReq = new MultipartRequest(request, file_path, 20*1024*1024, "EUC-KR", new DefaultFileRenamePolicy());
		
		gpk = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mReq.getParameter("gpk")));
		params += "gpk=" + gpk;
		params += "&page=" + EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mReq.getParameter("page")));
		params += "&search_type=" + EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mReq.getParameter("search_type")));
		params += "&search_keyword=" + EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mReq.getParameter("search_keyword")));
		params += "&gov_public_nid=" + EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mReq.getParameter("gov_public_nid")));
		
		//파일첨부 start
		String gov_public_file_seq = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mReq.getParameter("gov_public_file_seq")));
		String file_title = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mReq.getParameter("file_title")));
		String gov_public_nid = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mReq.getParameter("gov_public_nid")));
		gfb.setGov_public_file_seq(gov_public_file_seq.length()>0?Integer.parseInt(gov_public_file_seq):0);
		
		Random random = new Random();
		boolean extensionSuccess = true;
		
		if(mReq.getFile("gov_public_file") != null && mReq.getFile("gov_public_file").exists()){
	    	
			String today = StringUtil.getCurrentDate("yyyyMMddHHmmssSSS");
			File savedFile = mReq.getFile("gov_public_file");
			String savedName = mReq.getFilesystemName("gov_public_file");
		    
			if(savedName != null && !"".equals(savedName)) {		    			    	
				/* 파일 확장자 검사 */
				if(!EtcUtil.checkAllowedExtension("BOARD_05", savedFile.getName())){
					extensionSuccess = false;	
				}

				String ext = savedName.toLowerCase().substring(savedName.lastIndexOf(".")+1);
				gfb.setGov_public_nid(Integer.parseInt(gov_public_nid));
				gfb.setFile_title(file_title);
				gfb.setOrg_file_nm(savedName);
		        gfb.setSave_file_nm(today + "1" + random.nextInt(1000) + "."  + ext);
		        gfb.setFile_path(file_path);
		        File newFile = new File(file_path + gfb.getSave_file_nm());
		        savedFile.renameTo(newFile);		        		      
		        
		        if(savedFile != null && savedFile.exists()){
			        savedFile.delete();
			    }
		    }
	    }	   

	    if(!extensionSuccess){
			/* Delete uploaded files */
		    if(mReq.getFile("gov_public_file") != null && mReq.getFile("gov_public_file").exists()){		    				    
			    File savedFile = mReq.getFile("gov_public_file");
			    if(savedFile != null && savedFile.exists()){
			        savedFile.delete();
			    }
		    }
%>
			<stl:msgBack msg="선택하신 파일은 업로드 하실 수 없습니다."/>
<%
			return;
		}
		//파일첨부 end
		
				
		
		if(gov_public_file_seq.length() > 0){
			mode = "UPDATE";
			gb.setGov_public_nid(Integer.parseInt(gov_public_nid));	
			gfb.setGov_public_file_seq(Integer.parseInt(gov_public_file_seq));
			gfb.setFile_title(file_title);
		}
		
				
		if(gov_public_nid.length() == 0){
			result = govPublicManager.insertGovPublicFile(gb, gfb);
		}else{
			gfb.setGov_public_nid(Integer.parseInt(gov_public_nid));			
			result = govPublicManager.updateGovPublicFile(gb, gfb);
		}
		
	}catch(Exception e){
		e.printStackTrace();
		throw e;
	}
%>

<%if(!result){ %>
<script type="text/javascript">
	alert("<%="INSERT".equals(mode)?"등록":"UPDATE".equals(mode)?"수정":"저장" %>에 실패하였습니다.");
	history.back();
</script>
<%
		return;
	} else {		
%>
<script type="text/javascript">
	alert("<%="INSERT".equals(mode)?"등록":"UPDATE".equals(mode)?"수정":"저장" %> 되었습니다.");
    location.href = "board_06_filelist.jsp<%=params %>";
</script>
<% 	
  	}
%> 



