<%@ page contentType= "text/html;charset=euc-kr"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.knoc.util.FileManager"%>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />

<%

request.setCharacterEncoding("euc-kr");
ServletContext context = getServletContext();
BufferedInputStream fin = null;
BufferedOutputStream outs = null;

try{
	FileManager fileManager = new FileManager();
	HashMap fileMap = fileManager.getFileInfo(etcutil.checkNullInt(request.getParameter("file_nid").toString(), 0));
	
	/**
	 * 2016.3.21 JSM
	 * 보안약점 조치
	 */	
	if(fileMap!=null){
		String orgFileNm = new String(fileMap.get("ORG_FILENM").toString().getBytes("euc-kr"),"8859_1");
		String saveFileNm = fileMap.get("SAVE_FILENM").toString();
		String filePath = fileMap.get("FILE_PATH").toString();
		String realFolder = "";
		
		File file = new File(filePath + "/" + saveFileNm);
		
		
		byte b[] = new byte[4096];
		response.setHeader("Content-Disposition", "attachment;filename=" + orgFileNm + ";");
		
		out.clear();
		out = pageContext.pushBody();
		
		if (file.isFile()){
			fin = new BufferedInputStream(new FileInputStream(file));
		  	outs = new BufferedOutputStream(response.getOutputStream());
		  	int read = 0;
		  	while ((read = fin.read(b)) != -1){  		
		   		outs.write(b,0,read);
		  	}//while		  	
		}
	}
}catch (Exception e){

}finally{

	if(outs != null){
		outs.close();
	}
	if(fin != null){
		fin.close();
	}

}
%>


