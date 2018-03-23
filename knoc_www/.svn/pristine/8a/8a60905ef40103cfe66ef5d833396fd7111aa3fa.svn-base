package com.neoboard.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neoboard.AuthorityManager;
import com.neoboard.NeoBoardError;
import com.neoboard.NeoBoardManager;
import com.neoboard.PropertyManager;
import com.neoboard.data.AttachFile;
import com.neoboard.data.Authority;
import com.neoboard.data.PageAttribute;
import com.neoboard.data.Property;
import com.neoboard.session.GuestSession;
import com.neoboard.session.UserSession;
import com.neoboard.util.EtcUtil;

/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
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
	    String fno; // 화일 번호
	    boardID = request.getParameter("bid");
	    boardID = boardID.replaceAll("../", "");
	    boardID = boardID.replaceAll("/", "");
	    callback = request.getParameter("callback");
	    num = request.getParameter("num");
	    fno = request.getParameter("fno");
	    
	    /* 세션 참조 */
	    UserSession userSession = null;
        HttpSession ses = request.getSession();
        String sesName = request.getParameter("ses");
        if(ses != null){
            if(sesName == null || sesName.equals("")) {
                userSession = (UserSession)ses.getAttribute("USERSESSION");
            }
            else {
                userSession = (UserSession)ses.getAttribute(sesName);
            }
        }
        if(userSession == null) {
        	GuestSession info = new GuestSession();
		    info.setUserLevel("9");
		    info.setUserID("");
		    userSession = info;
        }
        PageAttribute pageBean = new PageAttribute();
        pageBean.setPageUrl(callback);
        pageBean.setNum("0");
        pageBean.setPage("1");
        pageBean.setPageMode("list");
        
        /* query board property */
        Property p = (new PropertyManager()).getProperty(boardID);
        if(p == null) throw new ServletException("Board Property does not allowed null!!");
        /* query board authority */
        Authority auth = (new AuthorityManager()).getAuthority(boardID);
        if(auth == null) throw new ServletException("Board Authority does not allowed null!!");
        
        /* 설정 검사 */

        if(p.getUseAuth().equals("1")) {
            if(userSession == null) {
                request.setAttribute("ERRORDETAIL",
                        		new NeoBoardError(userSession, 
                        		        p, 
                        		        pageBean, 
                        		        request.getRequestURI(), 
                        				"로그인을 하셔야만 접근할 수 있습니다."));
                String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
                RequestDispatcher dispatcher =
    				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
    			dispatcher.forward(request, response);		
                return;
            }
        }
        /* 권한 검사 */
        if(userSession != null) {
            if(!checkAuthority(auth,userSession) && !checkManager(auth,userSession) ) {
                request.setAttribute("ERRORDETAIL",
                		new NeoBoardError(userSession, 
                		        p, 
                		        pageBean, 
                		        request.getRequestURI(), 
                				"접근 권한이 없습니다."));
                String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
                RequestDispatcher dispatcher =
    				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
    			dispatcher.forward(request, response);		
                return; 
            }
        }
        
        /* 다운로드 */
        NeoBoardManager manager = new NeoBoardManager();
        AttachFile file = manager.getAttachFile(p,Integer.parseInt(num),Integer.parseInt(fno));
        if(file == null) {
            request.setAttribute("ERRORDETAIL",
            		new NeoBoardError(userSession, 
            		        p, 
            		        pageBean, 
            		        request.getRequestURI(), 
            				"파일이 존재하지 않습니다."));
            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
            RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);		
            return; 
        }
        String filePath = Property.UPLOAD_ROOT + "/" + file.getFolder() + "/" + EtcUtil.checkNull(file.getNewFileName()).replaceAll("\\†","");  // 보안약점 조치 2016.03.21 ECJ
        
        File f = new File(filePath);
        long fileSize = f.length();
        
        if(fileSize > 0 && f.isFile()) {
            byte[] buf = new byte[4096];
            /* 클라이언트 확인 */
            String strClient = request.getHeader("User-Agent");
            if(strClient.indexOf("MSIE 5.5")>-1) {
                response.setHeader("Content-Disposition", "filename=" +
                	//file.getFileName() + ";");
                    //new String(file.getFileName().getBytes("UTF-8"),"euc-kr") + ";");
                	//new String(EtcUtil.checkNull(file.getFileName()).getBytes("euc-kr"),"8859_1") + ";");  // 보안약점 조치 2016.03.21 ECJ
                    java.net.URLEncoder.encode(file.getFileName(), "utf-8") + ";");
            } 
            else {
                response.setHeader("Content-Disposition", "attachment;filename=" +
                	//file.getFileName() + ";");
                	//new String(file.getFileName().getBytes("UTF-8"),"euc-kr") + ";");
                	//new String(EtcUtil.checkNull(file.getFileName()).getBytes("euc-kr"),"8859_1") + ";");  // 보안약점 조치 2016.03.21 ECJ               
                    java.net.URLEncoder.encode(file.getFileName(), "utf-8") + ";");                                                 
            }

            response.setContentType(AttachFile.getMime(file.getMimeType()));
            response.setHeader ("Content-Length", "" + fileSize );
            /* 다운로드 카운트 증가 */
            manager.increaseDownCount(p,Integer.parseInt(num),Integer.parseInt(fno));
            
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
            request.setAttribute("ERRORDETAIL",
            		new NeoBoardError(userSession, 
            		        p, 
            		        pageBean, 
            		        request.getRequestURI(), 
            				"파일이 존재하지 않습니다."));
            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
            RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);		
            return; 
        }
        
        
        
	}
	/**
	 * 게시물 레벨 검사
	 * @param a
	 * @param ses
	 * @return
	 */
	private boolean checkAuthority(Authority a, UserSession ses) {
	    if(ses == null) return true;
	    try {
	    	if(Integer.parseInt(ses.getUserLevel()) < 2) return true;
	    }catch(Exception ex){
	        System.out.print (ex.getMessage());
	    }
	    if(a.getLevelDown() >= Integer.parseInt(ses.getUserLevel())){
	        return true;
	    }
	    return false;
	}
	/** 
	 * 관리자 아이디 검사
	 * @param a
	 * @param ses
	 * @return
	 */
	private boolean checkManager(Authority a, UserSession ses) {
	    if(ses == null) return false;
	    if (Integer.parseInt(ses.getUserLevel()) <= 1) return true;
	    if (a.getMaster() != null && !a.getMaster().equals("")) {
		    if(Property.findAllowedID(a.getMaster(),ses.getUserID())){
		        return true;
		    }
	    }
	    if (a.getDownAllowedUser() != null && !a.getDownAllowedUser().equals("")) {
		    if(Property.findAllowedID(a.getDownAllowedUser(),ses.getUserID())) {
		        return true;
		    }
	    }
	    return false;
	}

}
