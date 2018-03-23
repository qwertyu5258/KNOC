<%@page import="kr.co.knoc.gov_public.GovPublicFileBean"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<jsp:useBean id="govPublicManager" scope="page" class="kr.co.knoc.gov_public.GovPublicManager" />

<%
	int gov_public_file_seq = Integer.parseInt(request.getParameter("gov_public_file_seq"));

	File downLoadFile;
	BufferedInputStream buffIn = null;
	OutputStream os = null;
	
	try{
		GovPublicFileBean gfb = govPublicManager.getGovPublicFileView(gov_public_file_seq);
		
		ServletContext context = request.getSession().getServletContext();		
		
		String save_file_nm = gfb.getSave_file_nm();
		String org_file_nm = gfb.getOrg_file_nm();
		
		downLoadFile = new File(context.getRealPath("upload") + File.separator + "BOARD_05" + File.separator + save_file_nm);
		
		byte[] b = new byte[2048];
		
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + org_file_nm + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
	
		if(downLoadFile.isFile()){
			
			out.clear(); //out--> jsp자체 객체
        	out = pageContext.pushBody(); //out--> jsp자체 객체
        
			buffIn = new BufferedInputStream(new FileInputStream(downLoadFile));
			os = response.getOutputStream();
			
	        int read = 0;
			while((read = buffIn.read(b)) != -1){
				os.write(b,0,read );
           	}                
		}
		
	}catch(FileNotFoundException e){ // 보안약점 조치 2016.03.21 ECJ
		e.printStackTrace();	
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(buffIn != null){ buffIn.close(); }  // 보안약점 조치 2016.03.21 ECJ
		if(os != null){ os.close(); }  // 보안약점 조치 2016.03.21 ECJ
	}

%>