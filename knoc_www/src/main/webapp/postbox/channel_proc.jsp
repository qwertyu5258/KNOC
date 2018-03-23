 <%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>    
<%@ page import="kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.postbox.*"%>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />    


<%@include file="/postbox/_channel_inc.jsp"%>
<%
	if (channel_user_id == null || (!channel_user_id.equals(_CHANNEL_USER)
		&& !channel_user_id.equals(_CEO_USER)))  
	{ 
%>
<script type="text/javascript">
	location.href = "channel_login.jsp";
</script>
<%		
		return;
	}

	String mode = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("m")));
	if (mode == null || mode.equals("")) {
		mode = "G";
	}
	request.setCharacterEncoding("euc-kr");	
	String subject = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("subject")),"8859_1");
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")));
	String content = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("content")),"8859_1");
	//try{		content = new String(content.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
	String answer = etcutil.checkNull(request.getParameter("answer"));
	try{		answer = new String(answer.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { e.printStackTrace(); }  // 보안약점 조치 2016.04.12 ECJ
	String pwd = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("pwd")));
	int	no	= (request.getParameter("no")==null)?0:Integer.parseInt(request.getParameter("no"));
	

	
	if (!channel_user_id.equals(_CEO_USER)) {
		/* 비밀번호 인증 */
		if(mode.equals("E") || mode.equals("D")) {
			boolean checkPwd = PostBoxMa.checkPwd(no, pwd);
			if (!checkPwd) {				
%>
<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	history.back();
</script>	
<%		
				return;	
			}
		}
		else if(mode.equals("R")) {
%>			
<script type="text/javascript">
	alert("권한이 없습니다."); 
	history.back();
</script>
<%
			return;
		}
	}
	
	/* DB 실행 */
	boolean result = false;
	PostBoxBean cb = new PostBoxBean();
	cb.setNo(no);
	cb.setTitle(subject);
	cb.setPwd(pwd);
	cb.setContent(content);
	cb.setAnswer(answer);	
	cb.setEmail(_EMAIL_RECEIVERS);
	cb.setName(_EMAIL_RECEIVERS_NAME);
	cb.setMobile(_SMS_RECEIVERS);
	cb.setId(channel_user_id);
	
	 
	
	if (mode.equals("W")) {		
		result = PostBoxMa.insertChannel(cb);
%>
<script type="text/javascript">
	alert("의견을 제출하였습니다. 비밀번호는 <%=pwd%> 입니다. 글 조회시 필요하므로 반드시 기억하시기 바랍니다."); 
	location.href="channel_guide.jsp";
</script>
<%		
	} else if (mode.equals("E")) {
		result = PostBoxMa.updateChannel(cb);
%>
<script type="text/javascript">
	location.href="channel_list.jsp?page=<%=nowpage%>&no=<%=no%>";
</script>
<%		
	} else if (mode.equals("R")) {
		result = PostBoxMa.updateReplyChannel(cb);
%>
<script type="text/javascript">
	location.href="channel_view.jsp?page=<%=nowpage%>&no=<%=no%>";
</script>
<%				
	} else if (mode.equals("D")) {
		result = PostBoxMa.deleteChannel(no);
%>
<script type="text/javascript">
	location.href="channel_list.jsp?page=<%=nowpage%>&no=<%=no%>";
</script>
<%				
	}
%>