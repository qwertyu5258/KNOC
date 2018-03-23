<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.survey.*"%>    
<%@ page import="kr.co.knoc.mgr.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>           
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />

<%	request.setCharacterEncoding("euc-kr");	%>
<jsp:useBean id="sf" class="kr.co.knoc.survey.SurveyForm">
	<jsp:setProperty name="sf" property="*"/>
</jsp:useBean>
<%
	String nowpage = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("page")),"8859_1");
	String schType = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schType")),"8859_1");
	String schText = etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("schText")),"8859_1");

	SurveyManager sm = new SurveyManager();
	SurveyView view = sm.getSurveyView(sf.getSurveyNum());
	if(view == null) {
%>		
		<stl:msgBack msg="존재하지 않는 설문입니다."/>
<%		
	}
		
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Cookie[] co = request.getCookies();
	String dupleChkCookie = "";
	for (int i=0; i<co.length; i++) {
		if (co[i].getName().equals("NEOSURVEY_" + sf.getSurveyNum())) {
			dupleChkCookie = co[i].getValue();
		}
	}
	SurveyEntry entry = new SurveyEntry();
	if("1".equals(view.getSurvey().getDupleType())) {
		/* 로그인 한 회원에 한해서 한번 만 */
		/* 세션 검사 및 코딩 */
		MgrSession user = (MgrSession)session.getAttribute("USERSESSION");
		if(user == null) { 
%>			<stl:msgBack msg="로그인이 필요합니다."/> <%
		}
		SurveyEntry surveyEntry = sm.getSurveyEntry(sf.getSurveyNum(), etcutil.checkNull(user.getUserID()));  // 보안약점 조치 2016.03.21 ECJ
		if(surveyEntry.getEntryNum() > 0) {
%>
		<stl:msgBack msg="이미 참여하신 설문입니다."/>
<%	
		}
		entry.setEntryId(etcutil.checkNull(user.getUserID()));  // 보안약점 조치 2016.03.21 ECJ
	} else {
		/* 무제한 가능 단 쿠키로 방어 */
		if(dupleChkCookie != null && "1".equals(dupleChkCookie)){
%>
			<stl:msgBack msg="이미 참여하신 설문입니다."/>
<%			
		}
		entry.setEntryId("");
	}
	
	entry.setEntryIp(request.getRemoteAddr());
	entry.setSurveyNum(sf.getSurveyNum());	
	
	Map answerExamples = new HashMap();
	Iterator i = view.getQuestions().iterator();
	while(i.hasNext()) {
		SurveyQuestionView questionView = (SurveyQuestionView)i.next();
		SurveyQuestionBean question = questionView.getQuestion();
		String[] ex = request.getParameterValues("example" + question.getQuestionNum());
		String msg = "";
		if(ex == null) {
			if("0".equals(question.getQuestionType()) ) {
				
				/* 객관식일 경우 */
				msg = question.getQuestion() + "질문에 대한 하나이상의 보기를 선택해야만 합니다.";
%>		
				<stl:msgBack msg="<%=msg %>"/>
<%				
			} else {
				
				/* 주관식일 경우 */
				msg = question.getQuestion() + "질문에 대한 의견을 입력해 주세요.";
%>				
				<stl:msgBack msg="<%=msg %>"/>
<%				
			}
		}
		answerExamples.put(Integer.toString(question.getQuestionNum()),ex);
	}
	
	
	
	boolean result = sm.insertVoteSurvey(entry,view,answerExamples);
	
	if(result == false) {
	%><stl:msgBack msg="설문투표가 실패하였습니다."/><%
	}
	else {
		if(!"1".equals(view.getSurvey().getDupleType())) {
			Cookie cookie = new Cookie ("NEOSURVEY_" + sf.getSurveyNum(),"1");
			cookie.setMaxAge(3600);  // 보안약점 조치 2016.03.21 ECJ
			response.addCookie(cookie);
		}
	%><stl:msgRedirect msg="설문투표가 완료되었습니다." url="surveyList.jsp?page=<%=nowpage %>&schType=<%=schType %>&schText=<%=schText %>"/><%
	}
%> 