package kr.co.knoc.etc;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.knoc.util.EtcUtil;

public class Download extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	{
	    doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException 
	{
	    String boardID; // 게시판 아이디
	    String callback; // 콜백 페이지
	    String num; // 게시물 번호
	    String bun; // 첨부파일번호
	    boardID = request.getParameter("bid");
	    boardID = boardID.replaceAll("../", "");
	    boardID = boardID.replaceAll("/", "");
	    callback = request.getParameter("callback");
	    num = request.getParameter("num");
	    bun = request.getParameter("bun");	    
        
        /* 다운로드 */
        BoardManager manager = new BoardManager();
        AttachFile file = manager.getAttachFile(boardID,Integer.parseInt(num));
        if(file == null) {
        	response.setContentType("text/html;charset=euc-kr");
    		PrintWriter out = new PrintWriter(new
    			OutputStreamWriter(response.getOutputStream(), "KSC5601"));
    		out.println("<script language='javaScript'>");
    		out.println("    alert('죄송합니다. 해당 파일이 삭제되었거나 존재하지 않습니다.')  ");
    		out.println("    history.back();           ");
    		out.println("</script>                     ");
    		out.close();
        }
        String filename = "";
        String new_filename = "";
        if (bun == null || bun.equals("")) {
        	filename = file.getFileName();
        	new_filename = file.getNewFilename();
        } else {
        	if (bun.equals("1")) {
        		filename = file.getFileName();
        	} else if (bun.equals("2")) {
        		filename = file.getFileName2();
        	} else if (bun.equals("3")) {
        		filename = file.getFileName3();
        	}
        }
                
        String filePath = EtcUtil.ETC_UPLOAD_ROOT + "/" + EtcUtil.strBlockSpecialTags(boardID) + "/" + new_filename.replaceAll("\\†","");
        //System.out.println(filePath);
        File f = new File(filePath);
        long fileSize = f.length();
        
        if(fileSize > 0 && f.isFile()) {
            byte[] buf = new byte[4096];
            /* 클라이언트 확인 */
            String strClient = request.getHeader("User-Agent");
            if(strClient.indexOf("MSIE 5.5")>-1) {
                response.setHeader("Content-Disposition", "filename=" +
                	filename + ";");
                    //new String(file.getFileName().getBytes(),"ISO8859_1") + ";");              
            } 
            else {
                response.setHeader("Content-Disposition", "attachment;filename=" +
                		filename + ";");
                    //new String(file.getFileName().getBytes(),"ISO8859_1") + ";");
            }

            response.setContentType(AttachFile.getMime(file.getMimeType()));
            response.setHeader ("Content-Length", "" + fileSize );
            /* 다운로드 카운트 증가 */
            //manager.increaseDownCount(boardID,Integer.parseInt(num),bun);
            
            BufferedInputStream fin   = 
                new BufferedInputStream(new java.io.FileInputStream(f));
            BufferedOutputStream outs = 
                new BufferedOutputStream(response.getOutputStream());
            int read = 0;
            
            try{
                while((read = fin.read(buf)) != -1) {
                    outs.write(buf,0,read);
                }
            } 
            catch (Exception e) {
                System.out.println(e.getMessage());
            } 
            finally {
                outs.flush();
                outs.close();
                fin.close();
            }
        }
        else {
        	response.setContentType("text/html;charset=euc-kr");
    		PrintWriter out = new PrintWriter(new
    			OutputStreamWriter(response.getOutputStream(), "KSC5601"));
    		out.println("<script language='javaScript'>");
    		out.println("    alert('죄송합니다. 해당 파일이 삭제되었거나 존재하지 않습니다.')  ");
    		out.println("    history.back();           ");
    		out.println("</script>                     ");
    		out.close();
        }
        
        
        
	}	
}
