package com.neoboard.servlet;

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
import com.neoboard.TopViewer;
import com.neoboard.data.Article;
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
public class DeleteArticle extends HttpServlet {
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
	    String grp; 		// 카테고리
	    
	    boardID = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("bid")));
	    callback = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("callback")));
	    num = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("num")));
	    
	    page = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("page")));
        
	    mode = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("mode")));
        if(mode == null) mode = "list";
        
        String mmcode_url = request.getParameter("mcode");        
        
        fields = request.getParameterValues("field");
        texts = request.getParameterValues("text");
        dir = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("dir")));
        order = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("order")));
        grp = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("grp")));

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
        
        NeoBoardManager manager = new NeoBoardManager();
        
        /* 설정 검사 */
        if(manager.checkID(boardID, num)) {
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
            else {
            	if(Integer.parseInt(userSession.getUserLevel()) <= auth.getLevelDelete()) {
                }
                else {
	                // 자기글인지 검사 
                	if("SANGDAM".equals(boardID) || "SUGEST".equals(boardID) || "BUDGET".equals(boardID) || "INFOOPEN".equals(boardID) || "CLEAR2".equals(boardID)){
                		//virtualno로 검사하는 로직 추가(상담게시판) 20130528 kgs
                		if(!checkManager(auth, userSession) && !manager.checkMyArticleNew(boardID,num,userSession.getUserID(), userSession.getUserVirtualno())){
    	                    request.setAttribute("ERRORDETAIL",
    			                    		new NeoBoardError(userSession, 
    			                    		        p, 
    			                    		        pageBean, 
    			                    		        request.getRequestURI(), 
    			                    				"자기 글이 아닙니다."));
    			            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
    			            RequestDispatcher dispatcher =
    							getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
    						dispatcher.forward(request, response);		
    			            return;
    	                }
                		
                	}else{
                		if(!checkManager(auth, userSession) && !manager.checkMyArticle(boardID,num,userSession.getUserID())){
    	                    request.setAttribute("ERRORDETAIL",
    			                    		new NeoBoardError(userSession, 
    			                    		        p, 
    			                    		        pageBean, 
    			                    		        request.getRequestURI(), 
    			                    				"자기 글이 아닙니다."));
    			            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
    			            RequestDispatcher dispatcher =
    							getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
    						dispatcher.forward(request, response);		
    			            return;
    	                }
                	}
	                
                }
            }
        }

        if(!p.getUseDelete().equals("1") 
                && !checkManager(auth,userSession) ) {
            /* 삭제 사용하지 않음 */
            request.setAttribute("ERRORDETAIL",
            		new NeoBoardError(userSession, 
            		        p, 
            		        pageBean, 
            		        request.getRequestURI(), 
            				"사용자 삭제 불가능한 게시판입니다."));
		    String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
		    RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);		
		    return;
        }
        
        String name = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("name")));
		String passwd = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("passwd")));
		if(passwd == null) passwd = "";
		String qUserID;
		String qPasswd;
		if(!p.getUseAuth().equals("1")) {
		    qUserID = "";
		    qPasswd = passwd;
		    
		}
		else {
			if(userSession != null) {
				qUserID = userSession.getUserID();
				qPasswd = "";
			} else {
				qUserID = "";
			    qPasswd = passwd;
			}
		}
		
		String ip = request.getRemoteAddr();
		/* DB 입력 */
		/* 입력 실행 */
		
		/* 권한확인 */
		boolean checkPasswd = false;
		if (checkManager(auth,userSession) || (userSession != null && manager.checkMyArticle(boardID,num,userSession.getUserID()))) {
			checkPasswd = true;
		} else {
			if(!manager.checkPasswd(boardID, passwd, Integer.parseInt(num))){
				/* 비밀번호확인 */
			    request.setAttribute("ERRORDETAIL",
	            		new NeoBoardError("비밀번호가 일치하지 않습니다.",false));
	            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
	            RequestDispatcher dispatcher =
					getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
				dispatcher.forward(request, response);
				return;
			} else {
				checkPasswd = true;
			}
		}
		
		if (p.getSkinID().equals("skin02") || p.getSkinID().equals("skin04") || p.getSkinID().equals("skin05")) {
			if(!checkManager(auth,userSession) && !manager.checkPasswd(boardID, passwd, Integer.parseInt(num))){
				/* 비밀번호확인 */
			    request.setAttribute("ERRORDETAIL",
	            		new NeoBoardError("비밀번호가 일치하지 않습니다.",false));
	            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
	            RequestDispatcher dispatcher =
					getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
				dispatcher.forward(request, response);
				return;
			} else {
				checkPasswd = true;
			}
		}
        
        if(manager.deleteArticle(p,Integer.parseInt(num),qUserID,qPasswd,
        		checkPasswd,ip )) {
        	/* Expose update*/
        	//kr.go.wbgn.expose.ExposeHelper.makeBoardExpose(this.getServletContext().getRealPath("/"));
            /* redirect callback url */
            StringBuffer urlBuf = new StringBuffer();
            urlBuf.append(callback);
            urlBuf.append("?page=");
            urlBuf.append(page);
            urlBuf.append("&bid=");
            urlBuf.append(boardID);
            urlBuf.append("&mode=");
            urlBuf.append("list");
            urlBuf.append(search.makeQueryString(false));
            
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
                    	        "자기 자신의 글이 아닙니다."));
            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
            RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);		
            return; 
        }
	}
	/** 
	 * 관리자 아이디 검사
	 * @param a
	 * @param ses
	 * @return
	 */
	private boolean checkManager(Authority a, UserSession ses) {
	    if(ses == null) return false;
	    if(ses.getUserLevel().equals("1")) return true;
	    if (a.getMaster() != null && !a.getMaster().equals("")) {
		    if(Property.findAllowedID(a.getMaster(),ses.getUserID())){
		        return true;
		    }
	    }
	    if (a.getDeleteAllowedUser() != null && !a.getDeleteAllowedUser().equals("")) {
		    if(Property.findAllowedID(a.getDeleteAllowedUser(),ses.getUserID())) {
		        return true;
		    }
	    }
	    if(Integer.parseInt(ses.getUserLevel()) <= a.getLevelDelete()) {
            return true;
        }
	    return false;
	}
}
