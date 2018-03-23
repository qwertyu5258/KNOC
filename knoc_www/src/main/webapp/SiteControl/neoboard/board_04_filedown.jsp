<%@page import="kr.co.knoc.sague.SagueFileBean"%>
<%@page import="kr.co.knoc.sague.SagueManager"%>
<%@ page import="kr.co.knoc.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.io.*"%>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />

<%
	int sague_nid = Integer.parseInt(request.getParameter("sague_nid"));

	File downLoadFile;
	BufferedInputStream buffIn = null;
	OutputStream os = null;
	
	try{
		SagueManager sm = new SagueManager();
		SagueFileBean sugar = (SagueFileBean)sm.getsagueFileBean(sague_nid);
		
		ServletContext context = request.getSession().getServletContext();   
		
		String save_file_nm = sugar.getSave_filenm();
		String org_file_nm = sugar.getOrg_filenm();
		
		downLoadFile = new File(context.getRealPath("upload") + "/BOARD_04/" + save_file_nm);
		
		byte[] b = new byte[2048];
		
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-Disposition:", "attachment; filename=" + new String(etcutil.checkNull(org_file_nm).getBytes("euc-kr"), "iso-8859-1"));  // 보안약점 조치 2016.03.21 ECJ
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
	
		if(downLoadFile.isFile()){
			
			out.clear(); //out--> jsp자체 객체
        	out=pageContext.pushBody(); //out--> jsp자체 객체
        
			buffIn = new BufferedInputStream(new FileInputStream(downLoadFile));
			os = response.getOutputStream();
			
	        int read = 0;
			while((read = buffIn.read(b)) != -1){
				os.write(b,0,read );
           	}                
		}
		
	}catch(FileNotFoundException e){  // 보안약점 조치 2016.03.21 ECJ
		e.printStackTrace();
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(buffIn != null){ buffIn.close(); }  // 보안약점 조치 2016.03.21 ECJ
		if(os != null){ os.close(); }  // 보안약점 조치 2016.03.21 ECJ
	}

%>