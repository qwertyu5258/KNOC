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
import com.neoboard.common.StringFormat;
import com.neoboard.data.Authority;
import com.neoboard.data.Comment;
import com.neoboard.data.PageAttribute;
import com.neoboard.data.Property;
import com.neoboard.data.Search;
import com.neoboard.mailing.MailBean;
import com.neoboard.session.UserSession;
import com.neoboard.util.EtcUtil;



/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class AddComment extends HttpServlet {
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
	    String num; // 게시물 No
	    String page; // 게시물 페이지 번호
	    String mode; // 게시판 뷰 모드
	    String fields[]; // 검색할 컬럼
	    String texts[]; // 검색할 텍스트
	    String dir;  // 정렬할 필드
	    String order; // 정렬 방향
	    String grp; 		// 카테고리
	    
	    String comment;  //덧글
	    String passwd;  //덧글 비밀번호
	    String cname; // 덧글 작성자 이름 (인증 사용하지 않을 씨 입력요)
	    
	    request.setCharacterEncoding("euc-kr");
	    
	    boardID = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("bid")));
	    callback = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("callback")));
	    num = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("num")));
	    page = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("page")));
        
	    mode = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("mode")));
        if(mode == null) mode = "view";
       
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
        /* page list count setting */ 
        pageBean.setPageSize(StringFormat.numberFormat(p.getListPerPage(),"###"));
        /* query board authority */
        Authority auth = (new AuthorityManager()).getAuthority(boardID);
        if(auth == null) throw new ServletException("Board Authority does not allowed null!!");
        
        /* 파라미터 검사 ( 세션이 없다면 패스워드 입력 체크 )*/
        comment = request.getParameter("comment");
        passwd = request.getParameter("passwd");
        cname = request.getParameter("cname");
        //if(!p.getUseAuth().equals("1")) {
        	if (userSession != null && !userSession.getUserID().equals("") && !userSession.getUserID().equals("guest")) {
        	} else if(passwd == null || passwd.equals("")) {
                request.setAttribute("ERRORDETAIL",
                		new NeoBoardError("비밀번호를 입력하셔야만 합니다.",false));
                String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
                RequestDispatcher dispatcher =
    				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
    			dispatcher.forward(request, response);
    			return;
            }
            if(cname == null || cname.equals("")) {
                request.setAttribute("ERRORDETAIL",
                		new NeoBoardError("이름을 입력하셔야만 합니다.",false));
                String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
                RequestDispatcher dispatcher =
    				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
    			dispatcher.forward(request, response);
    			return;
            }
        //}
        /* 코멘트 입력 검사 */
        if(comment == null || comment.trim().equals("")) {
            request.setAttribute("ERRORDETAIL",
            		new NeoBoardError("댓글 내용을 입력하셔야만 합니다.",false));
            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
            RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);		
            return; 
        }
        
        /* 설정 체크 */
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

        /* 권한 체크 */
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
        
        /* Make Data bean */
        Comment cmt = new Comment();
        cmt.setBno(Integer.parseInt(num));
        //if(p.getUseAuth().equals("1")) {
        if(userSession != null) {
            cmt.setId(EtcUtil.checkNull(userSession.getUserID()));  // 보안약점 조치 2016.03.21 ECJ
            if(p.getUseAuth().equals("1"))
            	cmt.setName(EtcUtil.checkNull(userSession.getUserName()));  // 보안약점 조치 2016.03.21 ECJ
            else
            	cmt.setName(cname);
        }
        else {
            cmt.setName(cname);
        }
        cmt.setComment(comment);
        cmt.setPasswd(passwd);
        cmt.setIp(request.getRemoteAddr());
        cmt.setRegDate(new java.util.Date());
        
        /* 입력 실행 */
        NeoBoardManager manager = new NeoBoardManager();
        if(manager.addComment(p,cmt)) {
            /* 코멘트 숫자 설정 */
            manager.adjustCommentCount(p,cmt.getBno());
            /* redirect callback url */
            StringBuffer urlBuf = new StringBuffer();
            if (p.getSkinID().equals("skin02")) {
            	if(callback.indexOf("sub04_3") > 0){ // 고객국민제안
                	urlBuf.append("/sub04/sub04_3.jsp");
            	} else if(callback.indexOf("sub04_2") > 0){ // 고객상담실
            		urlBuf.append("/sub04/sub04_2.jsp");
            	} else if(callback.indexOf("sub04_8_2") > 0){
            		urlBuf.append("/sub04/sub04_8_2.jsp"); // 알뜰주유소>자유게시판
            	}
            } else {            
	            urlBuf.append(callback);
	            urlBuf.append("?num=");
	            urlBuf.append(num);
	            urlBuf.append("&page=");
	            urlBuf.append(page);
	            urlBuf.append("&bid=");
	            urlBuf.append(boardID);
	            urlBuf.append("&mode=");
	            urlBuf.append("view");
	            urlBuf.append(search.makeQueryString(false));            
            }
            response.sendRedirect(urlBuf.toString().replaceAll("\r", "").replaceAll("\n", "")); // 보안약점 조치 2016.03.21 ECJ
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
                    	        "덧글 입력이 실패하였습니다."));
            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
            RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);		
            return; 
        }
        
	}
	/**
	 * 댓글 입력 가능 레벨 검사
	 * @param a
	 * @param ses
	 * @return
	 */
	private boolean checkAuthority(Authority a, UserSession ses) {
	    if(ses == null) return true;
	    if(Integer.parseInt(ses.getUserLevel()) < 2) return true;
	    if(a.getLevelCommentWrite() >= Integer.parseInt(ses.getUserLevel())){
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
	    if(ses.getUserLevel().equals("1")) return true;
	    if (a.getMaster() != null && !a.getMaster().equals("")) {
		    if(Property.findAllowedID(a.getMaster(),ses.getUserID())){
		        return true;
		    }
	    }
	    if (a.getCommentWriteAllowedUser() != null && !a.getCommentWriteAllowedUser().equals("")) {
		    if(Property.findAllowedID(a.getCommentWriteAllowedUser(),ses.getUserID())) {
		        return true;
		    }
	    }
	    return false;
	}
	
}
