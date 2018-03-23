package com.neoboard.servlet;

import java.io.File;

import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;
import java.util.Vector;
import java.sql.*;

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
import com.neoboard.data.Article;
import com.neoboard.data.AttachFile;
import com.neoboard.data.Authority;
import com.neoboard.data.PageAttribute;
import com.neoboard.data.Property;
import com.neoboard.data.Search;
import com.neoboard.session.UserSession;
import com.neoboard.util.EtcUtil;



/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class MoveArticle extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	{
	    doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException 
	{
		request.setCharacterEncoding("euc-kr");
		
	    String boardID; // 게시판 아이디
	    String callback; // 콜백 페이지
	    String num; // 게시물 번호
	    String page; // 게시물 페이지 번호
	    String mode; // 게시판 뷰 모드
	    String fields[]; // 검색할 컬럼
	    String texts[]; // 검색할 텍스트
	    String dir;  // 정렬할 필드
	    String order; // 정렬 방향
	    
	    String grp; // 그룹
	    
	    String movebid;	// 등록할 게시판 아이디
	    
	    boardID = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("bid")));
	    callback = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("callback")));
	    num = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("num")));
	    
	    page = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("page")));
        
	    mode = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("mode")));
        if(mode == null) mode = "list";
        
        fields = request.getParameterValues("field");
        texts = request.getParameterValues("text");
        dir = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("dir")));
        order = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("order")));

        grp = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("grp")));
        
        movebid = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("movebid")));

        /* make page bean Property */
        PageAttribute pageBean = new PageAttribute();
        pageBean.setPageUrl(callback);
        pageBean.setNum(num);
        pageBean.setPage(page);
        pageBean.setPageMode(mode);
        
        /* make Search bean Property */
        Search search = new Search();
        if(fields != null && texts != null) {
	        for(int i = 0 ; i < fields.length && i < texts.length; i++) {
	            search.setSearchParam(fields[i],texts[i]);
	        }
        }
        
        search.setDir(dir);
        search.setOrder(order);
	    search.setGroup(grp);
	    /* 세션 참조 */
	    UserSession userSession = null;
        HttpSession ses = request.getSession();
        String sesName = request.getParameter("ses");
        /**
         * 2016.3.21 JSM
         * 보안약점 조치
         */
        if(sesName == null){sesName = "";}
        if(ses != null){
            if(sesName == null || sesName.equals("")) {
                userSession = (UserSession)ses.getAttribute("USERSESSION");
            }
            else {
                userSession = (UserSession)ses.getAttribute(sesName);
            }
        }
        
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
        
        if(movebid == null || movebid.equals("")) {
            request.setAttribute("ERRORDETAIL",
            		new NeoBoardError("등록할 게시판을 선택하셔야만 합니다.",false));
            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
            RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);
			return;
        }
        
        /* 권한 검사 */
        if(userSession != null) {
            if(!checkAuthority(auth,userSession) && !checkManager(auth,userSession)) {
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
        
		/* Create Article */
		Article article = new Article();
		article.setNo(Integer.parseInt(num));
		article.setCallback(callback);
		
		/* DB 입력 */
		/* 입력 실행 */
        NeoBoardManager manager = new NeoBoardManager();
        if(manager.addMoveArticle(p,article,movebid)) {        	
            /* redirect callback url */
            StringBuffer urlBuf = new StringBuffer();
            urlBuf.append(callback);
            urlBuf.append("?bid=");
            urlBuf.append(boardID);
            urlBuf.append("&mode=");
            urlBuf.append("list");

            response.sendRedirect(urlBuf.toString());
            response.flushBuffer();
            return;
        }
        else {
            request.setAttribute("ERRORDETAIL",
                    	new NeoBoardError(
                    	        userSession ,
                    	        p,
                    	        pageBean,
                    	        request.getRequestURI(), 
                    	        "게시물 입력이 실패하였습니다."));
            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
            RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);		
            return; 
        }
		
	}
	/**
	 * 게시물 입력 가능 레벨 검사
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
	    if(a.getLevelRegistration() >= Integer.parseInt(ses.getUserLevel())){
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
	    if (a.getRegistrationAllowedUser() != null && !a.getRegistrationAllowedUser().equals("")) {
		    if(Property.findAllowedID(a.getRegistrationAllowedUser(),ses.getUserID())) {
		        return true;
		    }
	    }
	    return false;
	}
}

