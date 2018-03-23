package com.neoboard.servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Vector;

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
import com.neoboard.data.AttachFiles;
import com.neoboard.data.Authority;
import com.neoboard.data.PageAttribute;
import com.neoboard.data.Property;
import com.neoboard.data.Search;
import com.neoboard.mailing.MailBean;
import com.neoboard.session.UserSession;
import com.neoboard.util.EtcUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class ReplyArticle extends HttpServlet {
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
	    String grp;

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
        	/**
        	 * 2016. 03. 21 / MYM
        	 * 보안약점 조치
        	 */
        	if(sesName == null) { sesName = ""; }

            if(sesName != null && sesName.equals("")) {
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
                        				"로그인 또는 실명인11증을 하셔야만 접근할 수 있습니다."));
                String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
                RequestDispatcher dispatcher =
    				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
    			dispatcher.forward(request, response);
                return;
            }
        }
        if(!p.getUseReply().equals("1")
                && !checkManager(auth,userSession)) {
            /* 엽력 사용하지 않음 */
            request.setAttribute("ERRORDETAIL",
            		new NeoBoardError(userSession,
            		        p,
            		        pageBean,
            		        request.getRequestURI(),
            				"사용자 답변 불가능한 게시판입니다."));
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

        /* 게시글 등록금지IP 체킹 */
		if(p.getBanIp() != null && !p.getBanIp().equals("") && com.neoboard.PropertyManager.getBanIp(p.getBanIp(), request.getRemoteAddr())){
		    request.setAttribute("ERRORDETAIL",
            		new NeoBoardError("등록 불가능한 IP 입니다..",false));
            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
            RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);
			return;
		}

        /* 업로드 시작 */
        String encoding = "EUC-KR";
	    String path = Property.UPLOAD_ROOT + "/" + boardID + "/";
	    File upFile = new File(path);
	    if(!upFile.exists()) {
	        upFile.mkdirs();
	        //wasadmin 계정으로 생성 된 폴더의 권한 변경 (05112401)
	        Runtime.getRuntime().exec("chmod -R 775 " + path);
	    }

	    /**
	     * 2016. 03. 21 / MYM
	     * 보안약점 조치
	     */
	    int maxUploadSize = p.getMaxUpload() * 1024 * 1024;
	    if(maxUploadSize < 0) { maxUploadSize = 1; }
	    MultipartRequest mrequest = null;
        try{
			mrequest = new MultipartRequest(request,
										 path,
										 maxUploadSize,
										 encoding,
										 new DefaultFileRenamePolicy()
										 );
		}catch(IOException e){
			// 용량 초과
		    request.setAttribute("ERRORDETAIL",
            		new NeoBoardError("업로드 화일 용량 초과입니다.",false));
            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
            RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);
			return;
		}
		/* 업로드 성공 */

		String subject = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("subject")));
		String name = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("name")));
		String passwd = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("passwd")));
		String email = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("email")));
		String html = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("html")));
		String content = "";
		if (html.equals("")) {
			html = "1";
			content = mrequest.getParameter("HTML_BODY");
		} else {
			content = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("HTML_BODY")));
		}
		String secret = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("secret")));
		if (secret.equals("")) {
			secret = "0";
		}

		String id = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("id")));
		String tel1 = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("tel1")));
		String tel2 = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("tel2")));
		String tel3 = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("tel3")));
		String zipno1 = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("zipno1")));
		String addr1 = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("addr1")));
		String addr2 = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("addr2")));
		String url = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("url")));
		String virtualno = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(mrequest.getParameter("virtualno")));

		/* Create Article */
		Article article = new Article();
		//article.setNo(0);
		//article.setRef(0);
		//article.setRefLevel(0);
		//article.setRefStep(0);
		if(!p.getUseAuth().equals("1")) {
		    article.setId("");
		    article.setName(name);
		    article.setPasswd(passwd);
		}
		else {
		   // article.setId(userSession.getUserID());
		   // article.setName(userSession.getUserName());
			article.setId(id);
			article.setName(name);
		    article.setPasswd(passwd);
		}
		article.setSubject(subject);
		article.setEmail(email);
		article.setContent(content);
		article.setIp(request.getRemoteAddr());
		article.setRegDate(new Date());
		article.setHitcnt(0);
		article.setCmtcnt(0);
		//article.setFilecnt(0);
		article.setDowncnt(0);
		article.setHtml(html);
		article.setSecret(secret);
		article.setGrp(grp);
		article.setPhone(tel1 + "-" + tel2 + "-" + tel3);
		article.setZipcode(zipno1);
		article.setAddr1(addr1);
		article.setAddr2(addr2);
		article.setUrl(url);
		article.setCallback(callback);
		article.setVirtualno(virtualno);

		/* upload another server */
		boolean uploadSuccess = true;
		boolean extensionSuccess = true;
		int dotIndex;
    	String fileExe = "";				//원래 확장자
		String tmpStr = "";

		for(Enumeration e = mrequest.getFileNames(); e.hasMoreElements();) {
		    String fileName = (String)e.nextElement();
		    String savedName = mrequest.getFilesystemName(fileName);
		    File savedFile = mrequest.getFile(fileName);
		    if(savedFile != null && savedFile.exists()){
		    	/* 파일 확장자 검사 */
		        if(!checkAllowedExtension(p,savedFile.getName())){
		        	extensionSuccess = false;
		        	continue;
		        }
		    }
		}
		if(!extensionSuccess){
			// 업로드 실패(확장자 업로드 불가)
		    request.setAttribute("ERRORDETAIL",
            		new NeoBoardError("선택하신 화일은 업로드 하실 수 없습니다.",false));
            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
            RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);
			return;
		}

		if(!uploadSuccess) {
		    /* Delete uploaded files */
		    for(Enumeration e = mrequest.getFileNames(); e.hasMoreElements();) {
			    String fileName = (String)e.nextElement();
			    File savedFile = mrequest.getFile(fileName);
			    if(savedFile != null && savedFile.exists()){
			        savedFile.delete();
			    }
		    }
		    // 업로드 실패
		    request.setAttribute("ERRORDETAIL",
            		new NeoBoardError("화일 업로드 실패입니다.",false));
            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
            RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);
			return;
		}
		/* Create AttachFiles */
		String newfileName = "";

		int i = 1;
		java.util.Random oRandom = new java.util.Random();
		for(Enumeration e = mrequest.getFileNames(); e.hasMoreElements();) {
			Date date = new Date();
	        SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String today=simpleDate.format(date);

		    String fileName = (String)e.nextElement();
		    String fileIndex = fileName.replace("file", ""); // input file name = file1,file2...여러개 파일업로드시 몇번째 파일첨부인가?
		    String savedName = mrequest.getFilesystemName(fileName);
		    File savedFile = mrequest.getFile(fileName);
		    if(savedName != null && !savedName.equals("")) {
		    	/* 파일 확장자 검사 */
		        if(!checkAllowedExtension(p,savedName)){
		        	extensionSuccess = false;
		        	continue;
		        }
		        String ext = "";
		 	    ext = savedName.toLowerCase().substring(savedName.lastIndexOf(".")+1);
		        AttachFile attachFile = new AttachFile();
		        //attachFile.setNo(0);
		        //attachFile.setBno(0);
		        attachFile.setFileName(savedName);
		        File tmpFile = mrequest.getFile(fileName);
		        if(tmpFile != null)
		            attachFile.setFileSize(tmpFile.length());
		        attachFile.setRegDate(new Date());
		        attachFile.setDowncnt(0);
		        attachFile.setBun(fileIndex);

		        attachFile.setNewFileName(today + "" + i + "" + oRandom.nextInt(1000) + "."  + ext);
		        File newFile = new File(path + "" + attachFile.getNewFileName());
		        savedFile.renameTo(newFile);

		        article.addFile(attachFile);
		        article.setFilecnt(article.getFilecnt()+1);

		        if(savedFile != null && savedFile.exists()){
			        savedFile.delete();
			    }
		       i++;
		    }
		}

		if(!extensionSuccess){
			// 업로드 실패(확장자 업로드 불가)
		    request.setAttribute("ERRORDETAIL",
            		new NeoBoardError("선택하신 화일은 업로드 하실 수 없습니다.",false));
            String skinRoot = Property.SKIN_URL + "/" + p.getSkinID();
            RequestDispatcher dispatcher =
				getServletContext().getRequestDispatcher(skinRoot + "/errorRedirect.jsp");
			dispatcher.forward(request, response);
			return;
		}

		/* DB 입력 */
		/* 입력 실행 */
        NeoBoardManager manager = new NeoBoardManager();
        int reno = 0;
        if( (reno = manager.replyArticle(p,Integer.parseInt(num),article)) > 0) {
        	/* Expose update*/
        	//kr.go.wbgn.expose.ExposeHelper.makeBoardExpose(this.getServletContext().getRealPath("/"));
        	//이미지 파일썸네일 생성
        	AttachFiles files = article.getFiles();
        	for(int k = 0 ; k < files.size(); k++) {
        		AttachFile af = files.getAttachFile(k);
        		if(".jpg".equals(af.getFileNameType().toLowerCase())
        				||".gif".equals(af.getFileNameType().toLowerCase())
        				||".jpeg".equals(af.getFileNameType().toLowerCase())) {
        			String thumbFileName = "T" + af.getNewFileName();
	        		try {
		        		com.neoboard.common.ImgUtils.createThumbnail(
		        				Property.UPLOAD_ROOT + File.separator + p.getBoardID() + File.separator + af.getNewFileName(),
		        				Property.UPLOAD_ROOT + File.separator + p.getBoardID() + File.separator + thumbFileName, 160, true);
	        		} catch (InterruptedException e) {
	        			e.printStackTrace();
	        		}
        		}
        	}
            /* redirect callback url */
            StringBuffer urlBuf = new StringBuffer();
            urlBuf.append(callback);
            urlBuf.append("?num=");
            urlBuf.append(Integer.toString(reno));
            urlBuf.append("&page=");
            urlBuf.append(page);
            urlBuf.append("&bid=");
            urlBuf.append(boardID);
            urlBuf.append("&mode=");
            if (secret.equals("1")) {
            	urlBuf.append("list");
            } else {
            	urlBuf.append("view");
            }
            urlBuf.append("&grp=");
            urlBuf.append(grp);

            /* 메일기능 사용 */
        	/* 답글등록시 사용 */
        	if (p.getUseMailing().equals("R") || p.getUseMailing().equals("WR") || p.getUseMailing().equals("EWR") || p.getUseMailing().equals("ER")) {
        		try {
        			String mailTemplate = p.getMailTemplate();
        			String mailTo = p.getMailTo();
        			String mailFrom = p.getMailFrom();

        			mailTemplate = mailTemplate.replace("[##이름##]", article.getName());
        			mailTemplate = mailTemplate.replace("[##등록일##]", article.getRegDateString("yyyy-MM-dd"));
        			mailTemplate = mailTemplate.replace("[##제목##]", article.getSubject());
        			mailTemplate = mailTemplate.replace("[##글종류##]", "답변글");
        			mailTemplate = mailTemplate.replace("[##내용##]", article.getContent());
        			mailTemplate = mailTemplate.replace("[##게시물URL##]", callback + "?bid=" + boardID + "&mode=view&num=" + article.getNo());

        			if (p.getMailTo() == null || p.getMailTo().equals("")) {
        				mailTo = article.getEmail();
        			}
        			if (p.getMailFrom() == null || p.getMailFrom().equals("")) {
        				mailFrom = article.getEmail();
        			}

        			if (!mailTo.equals("") && !mailFrom.equals("") && p.getMailServer() != null && !p.getMailServer().equals("")) {
        				MailBean Mailb = new MailBean(mailTo, mailFrom, p.getBoardName() + "게시판에 답변을 등록하신 글입니다.", mailTemplate, "", "", "", p.getMailServer());
        				Mailb.start();
        			}
        		} catch (Exception e) {
        			e.printStackTrace();
        		}
        	}
        	/* 메일기능 사용 끝 */

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
	    if(Integer.parseInt(ses.getUserLevel()) < 2) return true;
	    if(a.getLevelReply() >= Integer.parseInt(ses.getUserLevel())){
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
	    if (a.getReplyAllowedUser() != null && !a.getReplyAllowedUser().equals("")) {
		    if(Property.findAllowedID(a.getReplyAllowedUser(),ses.getUserID())) {
		        return true;
		    }
	    }
	    return false;
	}
	/**
	 * 파일 확장자 검사
	 * @param fileName
	 * @return
	 */
	private boolean checkAllowedExtension(Property property, String fileName) {
		String notAllowedExtension = property.getDefaultNotAllowedExtension();
		if(!property.getAllowedExtension().equals("")) notAllowedExtension += "," + property.getAllowedExtension();
	    /* 파일 확장자 검사 */
	    String ext = "";


	    // 첨부 파일 확장자
	    ext = fileName.toLowerCase().substring(fileName.lastIndexOf(".")+1);
	    // 차단된 확장자 목록

	    /**
	     * 2016. 03. 21 / MYM
	     * 보안약점 조치
	     */
	    if(notAllowedExtension == null) {
	    	notAllowedExtension = "";
	    }
	    String[] extension = notAllowedExtension.split(",");
	    /* 파일 확장자 허용하지 않을 경우 해당 파일 삭제 후 FALSE 리턴 */
	    if(!isContainExtension(extension, ext)){
	        return true;
	    }
	    else {
	        /* 해당 파일 삭제 */
	        String path = Property.UPLOAD_ROOT + "/" + property.getBoardID() + "/" + fileName;
	        File dfile = new File(path);
	        if(dfile != null) {
		        if(dfile.exists()) {
		            if(dfile.isFile())
		                dfile.delete();
		        }
	        }
	        return false;
	    }
	}
	/**
	 * 업로드 확장자명이 차단된 확장자 목록에 포함되어있는지 여부
	 * @param extension1	차단 확장자 목록
	 * @param extension2	업로드 할 파일 확장자
	 * @return	true: 차단된 확장자
	 */
	private boolean isContainExtension(String[] extension1, String extension2){
		boolean result = false;

		if(extension1 == null || extension2 == null) return result;
		for(int j = 0; j < extension1.length; j++){
			if(extension1[j].equals(extension2)){
				result = true;
				break;
			}
		}

		return result;
	}
}