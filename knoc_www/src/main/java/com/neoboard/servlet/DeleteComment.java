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
import com.neoboard.data.PageAttribute;
import com.neoboard.data.Property;
import com.neoboard.data.Search;
import com.neoboard.session.UserSession;
import com.neoboard.util.EtcUtil;



/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class DeleteComment extends HttpServlet {
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
	    
	    String cno; // 덧글 번호
	    String passwd; // 덧글 비밀번호
	    
	    
	    boardID = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("bid")));
	    callback = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("callback")));
	    num = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("num")));
	    page = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("page")));
        
	    mode = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("mode")));
        if(mode == null) mode = "view";
        
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
        /* page list count setting */ 
        pageBean.setPageSize(StringFormat.numberFormat(p.getListPerPage(),"###"));
        /* query board authority */
        Authority auth = (new AuthorityManager()).getAuthority(boardID);
        if(auth == null) throw new ServletException("Board Authority does not allowed null!!");
        
        /* 파라미터 검사 ( 세션이 있다면 패스워드,이름 입력 체크 )*/
        cno = request.getParameter("cno");
        passwd = request.getParameter("passwd");
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
        //}
        /* 코멘트 번호 검사 */
        if(cno == null || cno.trim().equals("")) {
            request.setAttribute("ERRORDETAIL",
            		new NeoBoardError("덧글 번호가 없습니다.",false));
            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
            RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);		
            return; 
        }
        NeoBoardManager manager = new NeoBoardManager();
        
        /* 삭제 실행 */
        
        String qPasswd = "";
        String qUserID = "";
        
        qPasswd = (passwd == null) ? "":passwd;
		qUserID = "";
		boolean isCheckMyId = false;		
		if (userSession != null) {
			isCheckMyId = manager.checkMyComment(boardID,num,cno,userSession.getUserID());
		}	
        if(manager.deleteComment(p, Integer.parseInt(cno), qUserID, qPasswd, 
                checkManager(auth,userSession),isCheckMyId)) {
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
            response.sendRedirect(urlBuf.toString().replaceAll("\r", "").replaceAll("\n", ""));  // 보안약점 조치 2016.03.21 ECJ
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
                    	        "댓글 삭제가 실패하였습니다. 비밀번호 불일치 또는 자기 자신의 글이 아닙니다."));
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
	    // 전체 관리자 검사
	    if (a.getMaster() != null && !a.getMaster().equals("")) {
		    if(Property.findAllowedID(a.getMaster(),ses.getUserID())){
		        return true;
		    }
	    }
	    // 개별 관리자 검사
	    if (a.getCommentDeleteAllowedUser() != null && !a.getCommentDeleteAllowedUser().equals("")) {
		    if(Property.findAllowedID(a.getCommentDeleteAllowedUser(),ses.getUserID())) {
		        return true;
		    }
	    }
	    return false;
	}
}
