package com.neoboard.tags;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

import com.neoboard.AuthorityManager;
import com.neoboard.NeoBoardManager;
import com.neoboard.PropertyManager;
import com.neoboard.common.StringFormat;
import com.neoboard.data.Article;
import com.neoboard.data.Authority;
import com.neoboard.data.PageAttribute;
import com.neoboard.data.Property;
import com.neoboard.data.Search;
import com.neoboard.session.GuestSession;
import com.neoboard.session.UserSession;
import com.neoboard.util.EtcUtil;
import com.neoboard.common.CommonConstants;

import kr.co.knoc.util.HTMLFilter;




public class NeoBoardFacade extends TagSupport {
    /** 호출자 페이지 */
    private String parentUri;
    /** 게시판 호출 모드 */
    private String mode;
    /** 게시판 아이디 */
    private String bid;
    /** Session name string */
    private String sessionName = "";
    /** 관리자 경로 */
    private String adminURL;
       
    public void setSessionName(String sesName) {
        this.sessionName = sesName;
    }
    public String getBid() {
        return bid;
    }
    public void setBid(String bid) {
        this.bid = bid;
    }
    public String getMode() {
        return mode;
    }
    public void setMode(String mode) {
        this.mode = mode;
    }
    public String getParentUri() {
        return parentUri;
    }
    public void setParentUri(String parentUri) {
    	
        this.parentUri = parentUri;
    }
    public String getAdminURL() {
        return adminURL;
    }
    public void setAdminURL(String adminURL) {    	
        this.adminURL = adminURL;
    }
    public int doEndTag() throws JspException {
        
        
       
    	
        HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();

    	
        /**
         * 2016.3.21 JSM
         * 보안약점 조치
         */
        EtcUtil etc = new EtcUtil();
        String reqMode = new HTMLFilter().filter(EtcUtil.checkNull(request.getParameter("mode")));
        if(reqMode == null) {
            if(this.mode != null) 
                reqMode = this.mode;
            else 
                reqMode = "list";
        }
        reqMode = checkMode(reqMode);
        
        String reqBoardID = new HTMLFilter().filter(EtcUtil.checkNull(request.getParameter("bid")));
              
        
        if(reqBoardID != null && !reqBoardID.trim().equals("")) {
            this.bid = reqBoardID.trim();            
        }                      
        
        /* make page bean Property */
        PageAttribute page = new PageAttribute();
        
        
        
        if(!CommonConstants.IS_DEV){ //실모드
        	page.setPageUrl("http://" + request.getServerName() + "" + this.parentUri); 
        }else{	//개발모드
        	System.out.println("request.getServerName():"+request.getServerName());
        	page.setPageUrl(this.parentUri); 
        }
        
        page.setNum(new HTMLFilter().filter(EtcUtil.checkNull(request.getParameter("num"))));
        page.setPage(new HTMLFilter().filter(EtcUtil.checkNull(request.getParameter("page"))));
        page.setPageMode(reqMode);
        
        /* make Search bean Property */
        Search search = new Search();
        String[] fields = request.getParameterValues("field");
        String[] texts = request.getParameterValues("text");
        if(fields != null && texts != null) {
	        for(int i = 0 ; i < fields.length && i < texts.length; i++) {
	            search.setSearchParam(new HTMLFilter().filter(EtcUtil.checkNull(fields[i])),new HTMLFilter().filter(texts[i]));
	        }
        }
        
        
        
        search.setDir(new HTMLFilter().filter(EtcUtil.checkNull(request.getParameter("dir"))));
        search.setOrder(new HTMLFilter().filter(EtcUtil.checkNull(request.getParameter("order"))));
        search.setGroup(new HTMLFilter().filter(EtcUtil.checkNull(request.getParameter("grp"))));
        search.setPassword(EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(new HTMLFilter().filter(request.getParameter("pass")))));
        search.setName(EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(new HTMLFilter().filter(request.getParameter("name")))));
        search.setBno(EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(new HTMLFilter().filter(request.getParameter("bno")))));
        
        /* query board property */
        Property p = (new PropertyManager()).getProperty(this.bid);
        if(p == null) throw new JspException("Board Property does not allowed null!!");
        
        /* 게시판 사용여부 */
        if(p !=null) {
	        if(p.getStatus().equals("0")) {
	            msgBack("폐쇄된 게시판 입니다.");
	            return SKIP_PAGE;
	        }
        }
        /* 사용자, 관리자 스킨 URL */
        String skinURL = "";        
        if(this.adminURL != null && !this.adminURL.equals("")) {
        	skinURL = this.adminURL + "" + Property.SKIN_URL;
		} else {
			skinURL = Property.SKIN_URL;
		}
        
        /* page list count setting */ 
        page.setPageSize(StringFormat.numberFormat(p.getListPerPage(),"###"));
        /* query board authority */
        Authority auth = (new AuthorityManager()).getAuthority(this.bid);
        if(auth == null) throw new JspException("Board Authority does not allowed null!!");
        
        /* 설정 체크 */
        HttpSession ses = pageContext.getSession();
        UserSession userSession = null;
        if(ses != null){
            // 세션 이름이 설정된 경우        	
            if(this.sessionName == null || this.sessionName.equals("")) 
            	userSession = (UserSession)ses.getAttribute("USERSESSION");
            else 
                userSession = (UserSession)ses.getAttribute(this.sessionName);
        }
        if(userSession == null) {
	        GuestSession info = new GuestSession();
		    info.setUserLevel("9");
		    request.setAttribute("GUESSTSESSION",info);
		    ses.setAttribute("GUESSTSESSION",request.getAttribute("GUESSTSESSION"));	
		    userSession = (UserSession)ses.getAttribute("GUESSTSESSION");		    
        }
        
        if(p.getUseAuth().equals("1") && !reqMode.equals("edit")) {
            if(userSession == null) {
            	msgBack("접근 권한이 없습니다.");
                return SKIP_PAGE;                
            }
        }
        String u = "";
        String gets = "";
    	if(request.getQueryString() != null){
     		gets = "?"+request.getQueryString();
    	}
    	String currentPage = request.getRequestURL()+gets; 
    	if (currentPage == null || currentPage.equals("")) {
    		currentPage = "/";
    	}
        //u = request.getHeader("referer");
    	u = currentPage;
	    if (u == null || u.equals("")) {
	    	u = "/";
	    }
        
        /* 권한 체크 */
        if(userSession != null) {
            if(!checkAuthority(auth, p , userSession,reqMode,page.getNNum()) && !reqMode.equals("edit")) {
            	//if(Integer.parseInt(userSession.getUserLevel()) > 9) {
                if(!p.getUseRegistration().equals("1")  && !checkManager(auth,p,userSession,"write")) { // 2016.04.12 ECJ
            		msgBack("접근 권한이 없습니다.");
                    return SKIP_PAGE;            		               
                } else {
                	//아이핀 로그인 체크 추가 20130528 kgs
                	if(!(userSession.getUserID() != null && userSession.getUserID().length() > 0 && "guest".equals(userSession.getUserID()))){ 
                		loginBack("아이핀(인터넷주민번호대체수단) 또는 회원ID로 로그인 후 이용해 주십시오.", u);
                        return SKIP_PAGE;
                	}
                }
            }
        }

        /* 조회수 증가 , 게시물 request 에 셋팅*/
        Article article = null;
        if(reqMode.equals("view")) {        	
            NeoBoardManager bm = new NeoBoardManager();
            article = bm.getArticle(page.getNNum(),p,search);
	        if(!article.getSecret().equals("1")) bm.increaseHitCount(p,page.getNNum());
	        pageContext.setAttribute("NB_ARTICLE",article,PageContext.REQUEST_SCOPE);
            
        }
        else if(reqMode.equals("edit") || reqMode.equals("reply") ) {
            NeoBoardManager bm = new NeoBoardManager();
            article = bm.getArticle(page.getNNum(),p,search);
            // Set Article
            pageContext.setAttribute("NB_ARTICLE",article,PageContext.REQUEST_SCOPE);
        }
        /* set attribute to request scope */
        
        System.out.println(skinURL + "/" +  p.getSkinID() + "/" + reqMode + ".jsp");
        
        // Setting up SessionName
        pageContext.setAttribute("NB_SESNAME",this.sessionName,PageContext.REQUEST_SCOPE);
        // Setting up PageAttribute
        pageContext.setAttribute("NB_PAGE",page,PageContext.REQUEST_SCOPE);
        // Setting up Search 
        pageContext.setAttribute("NB_SEARCH",search,PageContext.REQUEST_SCOPE);
        // Setting up Property
        pageContext.setAttribute("NB_PROPERTY",p,PageContext.REQUEST_SCOPE);
        // Setting up Authority
        pageContext.setAttribute("NB_AUTHORITY",auth,PageContext.REQUEST_SCOPE);
        
        try{
            if(!p.getUseAuth().equals("1")) {
	            if(article!= null && reqMode.equals("view")
	                    && article.getSecret().equals("1") 
	                    && !checkManager(auth,p,userSession,"view")) {
	                String passwd = EtcUtil.checkNull(request.getParameter("passwd"));
	                NeoBoardManager bm = new NeoBoardManager();
	                
	                if(passwd == null || passwd.equals("")) {
		                pageContext.include(skinURL + "/" + 
		    	                p.getSkinID() + "/inputpwd.jsp");
	                }
	                else {
	                	if (article.getSecret().equals("1") && article.getRefLevel() > 0) {
	                		int no = bm.checkNo(this.bid, Integer.toString(page.getNNum()));	                		
	                		if (bm.checkPasswd(this.bid, passwd, page.getNNum())) {
		                        // 비번이 일치할 경우 내용 보여줌
		                        pageContext.include(skinURL + "/" + 
		            	                p.getSkinID() + "/" + reqMode + ".jsp");	                			
	                		} else {
	                			 // 비번이 틀렸을 경우
		                        msgBack("비밀번호가 일치하지 않습니다.");
		                        return SKIP_PAGE;
	                		}
	                	} else {
		                    //if(article.getPasswd().equals(passwd)){
	                		if((article.getPasswd()!=null?article.getPasswd().trim():"").equals(bm.getMd5Passwd(passwd))){
		                        // 비번이 일치할 경우 내용 보여줌
		                        pageContext.include(skinURL + "/" + 
		            	                p.getSkinID() + "/" + reqMode + ".jsp");
		                    }
		                    else {
		                        // 비번이 틀렸을 경우
		                        msgBack("비밀번호가 일치하지 않습니다.");
		                        return SKIP_PAGE;
		                    }
	                	}
	                }
	            }
	            else {
		            pageContext.include(skinURL + "/" + 
		                p.getSkinID() + "/" + reqMode + ".jsp");
	            }
            }
            else {
                // 비밀글인데 자기글이 아니고 , 관리자도 아닐 경우 에러
            	// 비밀 답변글이 참고하는 비밀글 작성자 확인	: 비밀글 작성자가 자신의 답변글에 대한 권한 허용 - checkReplyAuth(article, p, userSession, "view")
            	if(article!= null && (reqMode.equals("view") || reqMode.equals("edit"))
 	                    && article.getSecret().equals("1") 
 	                    && !checkManager(auth,p,userSession,"view")
 	                    && !checkReplyAuth(article, p, userSession, "view")) {
           		 		NeoBoardManager bm = new NeoBoardManager();
            		 
	            		 if (userSession != null && 
	            				(
	            					 ("guest".equals(article.getId()) && article.getVirtualno().equals(userSession.getUserVirtualno()))
	            					 || (!"guest".equals(article.getId()) && article.getId().equals(userSession.getUserID()))
	            				)){
	            			 // ID가 guest일경우 virtualno도 체크 아닐경우 아이디만 체크
	            				 
	            			 pageContext.include(skinURL + "/" + 
	          		                p.getSkinID() + "/" + reqMode + ".jsp");
	            		 } else {
		 	                String passwd = etc.strBlockSpecialTags(etc.checkNull(request.getParameter("passwd")));                
		 	                System.out.println("passwd =========== " + passwd);
		 	                if(passwd == null || passwd.equals("")) {
		 	                	msgBack("이 글은 비공개 글입니다. 타인이 열람하실 수는 없습니다.");
		 	                    return SKIP_PAGE;
		 	                }
		 	                else {
		 	                	System.out.println("############## article.getSecret() ::: " + article.getSecret());
		 	                	System.out.println("############## article.getRefLevel() ::: " + article.getRefLevel());
		 	                	if (article.getSecret().equals("1") && article.getRefLevel() > 0) {
			                		int no = bm.checkNo(this.bid, Integer.toString(page.getNNum()));
			                		if (bm.checkPasswd(this.bid, passwd, no)) {
				                        // 비번이 일치할 경우 내용 보여줌
				                        pageContext.include(skinURL + "/" + 
				            	                p.getSkinID() + "/" + reqMode + ".jsp");	                			
			                		} else {
			                			 // 비번이 틀렸을 경우
				                        msgBack("비밀번호가 일치하지 않습니다.");
				                        return SKIP_PAGE;
			                		}
			                	} else {
			                		
				                    if((article.getPasswd()!=null?article.getPasswd().trim():"").equals(bm.getMd5Passwd(passwd))){
				                        // 비번이 일치할 경우 내용 보여줌
				                        pageContext.include(skinURL + "/" + 
				            	                p.getSkinID() + "/" + reqMode + ".jsp");
				                    }
				                    else {
				                        // 비번이 틀렸을 경우
				                        msgBack("비밀번호가 일치하지 않습니다.");
				                        return SKIP_PAGE;
				                    }
			                	}
		 	                }
	            		 }
 	            }
 	            else {
 		            pageContext.include(skinURL + "/" + 
 		                p.getSkinID() + "/" + reqMode + ".jsp");
 	            }
            	
                /**if(article!=null && reqMode.equals("view")
                        && article.getSecret().equals("1") 
                        && !article.getId().equals(userSession.getUserID())
                        && !checkManager(auth,p,userSession,"view")
						&& !checkReplyAuth(article, p, userSession, "view")
                        ) {
                    msgBack("이 글은 비공개 글입니다. 타인이 열람하실 수는 없습니다.");
                    return SKIP_PAGE;	
                }
                else {                	
		            pageContext.include(skinURL + "/" + 
		                p.getSkinID() + "/" + reqMode + ".jsp");
	            }**/
            }
        }catch(IOException e){
            throw new JspException(e);
        }catch(ServletException e) {
        	System.out.println(e.getMessage());
        	System.out.println(e.getStackTrace());
            throw new JspException(e);
        }
        return EVAL_PAGE;
    }
    /**
     * 접근 권한 검사
     * @param a
     * @param p
     * @param ses
     * @param m
     * @param no
     * @return
     */
    private boolean checkAuthority(Authority a, Property p, final UserSession ses, String m, int no) {
    	if(p.getUseAuth().equals("1")){
            if(ses == null) return false;
	        /* 총괄 게시판 관리자인지 검사 */
            if (a.getMaster() != null && !a.getMaster().equals("") && ses.getUserID() != null && !ses.getUserID().equals("")) {
		        if(a.getMaster().indexOf(ses.getUserID()) > -1) {
		            return true;
		        }
            }
	        /* 전체 관리자 */
	        if(ses.getUserLevel().equals("1")) return true;
	        
	        /* 목록에 대한 권한 검사 */
	        if(m.equals("list")) {
	            // 레벨 검사
	            if(a.getLevelList() >= Integer.parseInt(ses.getUserLevel())) {
	                return true;
	            }
	            // 아이디 검사
	            if (a.getListAllowedUser() != null && !a.getListAllowedUser().equals("")) {
		            if(a.getListAllowedUser().indexOf(ses.getUserID()) > -1) {
		                return true;
		            }
	            }
	        }
	        else if(m.equals("view")) {
	//          레벨 검사
	            if(a.getLevelView() >= Integer.parseInt(ses.getUserLevel())) {
	                return true;
	            }
	            // 아이디 검사
	            if (a.getViewAllowedUser() != null && !a.getViewAllowedUser().equals("")) {
		            if(a.getViewAllowedUser().indexOf(ses.getUserID()) > -1) {
		                return true;
		            }
	            }
	        }
	        else if(m.equals("write")) {
	//          레벨 검사
	            if(a.getLevelRegistration() >= Integer.parseInt(ses.getUserLevel())) {
	                return true;
	            }
	            // 아이디 검사
	            if (a.getRegistrationAllowedUser() != null && !a.getRegistrationAllowedUser().equals("")) {
		            if(a.getRegistrationAllowedUser().indexOf(ses.getUserID()) > -1) {
		                return true;
		            }
	            }
	        }
	        else if(m.equals("edit")) {
	            // 레벨 검사
	            if(a.getLevelEdit() >= Integer.parseInt(ses.getUserLevel())) {
	                return true;
	            }
	            // 아이디 검사
	            if (a.getEditAllowedUser() != null && !a.getEditAllowedUser().equals("")) {
		            if(a.getEditAllowedUser().indexOf(ses.getUserID()) > -1) {
		                return true;
		            }
	            }
	            // 자기글
	            NeoBoardManager neoManager = new NeoBoardManager();
	            if(neoManager.checkMyArticle(p.getBoardID(),Integer.toString(no),ses.getUserID())){
	                return true;
	            }
	        }
	        else if(m.equals("reply")) {
	            // 레벨 검사
	            if(a.getLevelReply() >= Integer.parseInt(ses.getUserLevel())) {
	                return true;
	            }
	            // 아이디 검사
	            if (a.getReplyAllowedUser() != null && !a.getReplyAllowedUser().equals("")) {
		            if(a.getReplyAllowedUser().indexOf(ses.getUserID()) > -1) {
		                return true;
		            }
	            }
	        }
    	}
	    else {
	        return true;
	    }
       
        return false;
    }
    /**
     * 자신의 비밀 글에 대한 답글인지 확인
     * @param a	: 자신의 글
     * @param p
     * @param m	: 모드 (view:읽기 모드)
     * @return	true: 자신의 글 맞음
     */
    private boolean checkReplyAuth(Article a, Property p, final UserSession ses, String m){
    	boolean result = false;
    	/*
    	 * 답변 글인지 검사 
    	 * 답변 글이 아닌 경우는 글 번호와 참고번호가 같다.
    	 */
    	if (a.getNo() == a.getRef()) return result;
    	
    	if(m.equals("view")){
    		NeoBoardManager manager = new NeoBoardManager();
			String ref_id	= manager.getArticleIdOfRef(p, a.getRef());

			/* Fail to Execute Query */
			if(ref_id == null) return result;
			/* 자기 글에 대한 답글인지 검사 */
			if(ses.getUserID().equals(ref_id) ) result = true;
    	}
    	
    	return result;
    }
    private boolean checkManager(Authority a, Property p, final UserSession ses, String m) {
        if(ses == null) return false;
        /* 총괄 게시판 관리자인지 검사 */
        if (a.getMaster() != null && !a.getMaster().equals("")) {
	        if(Property.findAllowedID(a.getMaster(),ses.getUserID())) {
	            return true;
	        }
        }
        /* 전체 관리자 */
        if(ses.getUserLevel().equals("1")) return true;
        
        /* 목록에 대한 권한 검사 */
        if(m.equals("list")) {
            // 아이디 검사
        	if (a.getListAllowedUser() != null && !a.getListAllowedUser().equals("")) {
	            if(Property.findAllowedID(a.getListAllowedUser(),ses.getUserID())) {
	                return true;
	            }
        	}
        }
        else if(m.equals("view")) {
            // 아이디 검사
        	if (a.getViewAllowedUser() != null && !a.getViewAllowedUser().equals("")) {
	            if(Property.findAllowedID(a.getViewAllowedUser(),ses.getUserID())) {
	                return true;
	            }
        	}
        }
        else if(m.equals("write")) {
            // 아이디 검사
        	if (a.getRegistrationAllowedUser() != null && !a.getRegistrationAllowedUser().equals("")) {
	            if(Property.findAllowedID(a.getRegistrationAllowedUser(),ses.getUserID())) {
	                return true;
	            }
        	}
        }
        else if(m.equals("edit")) {
            // 아이디 검사
        	if (a.getEditAllowedUser() != null && !a.getEditAllowedUser().equals("")) {
	            if(Property.findAllowedID(a.getEditAllowedUser(),ses.getUserID())) {
	                return true;
	            }
        	}
        }
        else if(m.equals("reply")) {
           // 아이디 검사
        	if (a.getReplyAllowedUser() != null && !a.getReplyAllowedUser().equals("")) {
	            if(Property.findAllowedID(a.getReplyAllowedUser(),ses.getUserID())) {
	                return true;
	            }
        	}
        }
       
        return false;
    }
    private void msgBack(String msg) throws JspException {
        JspWriter writer = (JspWriter)pageContext.getOut();
		try {
			writer.println("<script type=\"text/javascript\">\n" +
						"alert(\"" + msg + "\");\n" + 
						"history.back()\n" +
						"</script>");
		}catch(IOException ie) {
			throw new JspException("Response writing error: " + ie.getMessage());
		}
    }
    private void loginBack(String msg, String u) throws JspException {
        JspWriter writer = (JspWriter)pageContext.getOut();
		try {
			
			int chkXSS = u.indexOf("<script");
			if(chkXSS > -1) { u = "/"; }			
			
			writer.println("<script type=\"text/javascript\">\n" +
						"alert(\"" + msg + "\");\n" + 
						"location.href=\"/member/login.jsp?returnURL="+u+"\";\n" +
						"</script>");
		}catch(IOException ie) {
			throw new JspException("Response writing error: " + ie.getMessage());
		}
    }
    private static HashMap MODE = null;
    private String checkMode(String m){
        if(NeoBoardFacade.MODE == null) {
            NeoBoardFacade.MODE = new HashMap(10);
            synchronized(NeoBoardFacade.MODE) {
                MODE.put("list","list");
	            MODE.put("view","view");
	            MODE.put("write","write");
	            MODE.put("edit","edit");
	            MODE.put("reply","reply");
	            MODE.put("photo","photo");
            }
        }
        if(NeoBoardFacade.MODE.get(m) == null) {
            m = "list";
        }
        return m;
    }
    public void release() {
        this.parentUri = null;
        this.mode = null;
        this.bid = null;
    }
    
}