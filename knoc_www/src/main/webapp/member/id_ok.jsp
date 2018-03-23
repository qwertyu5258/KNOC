<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import="kr.co.knoc.mgr.*" %>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="mgrHelper" class="kr.co.knoc.mgr.MgrHelper" scope="page" />
<% 
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","09");
	application.setAttribute("gNavMenuDepth2","01");
	application.setAttribute("gNavMenuDepth3","03");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>     
<% request.setCharacterEncoding("euc-kr"); %> 
<%
	String name =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("name")),"8859_1");
	String email =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("email")),"8859_1");
	
	MgrDO data = new MgrDO();
	data.setName(name);
	data.setEmail(email);
	
	data = mgrHelper.FindId(data);
%>
<%@include file="/include/comheader.jsp"%>

	<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

    <div id="contents">
        <%@include file="/include/sub_leftmenu_new.jsp"%><!--// leftmenu: start //-->
    
        <div id="rightarea">
            <div id="subcnts">
               <%@include file="/include/subtop_member.jsp"%>
                <!--// location: start //-->
                <div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
                    &gt; <span>기타서비스</span> &gt; <span class="locanow">아이디 찾기</span></div>
            <!--// location: end //-->
            
                <div class="pagetle">
                    <h3><img src="/images/member/ttl_id_find.gif" alt="아이디 찾기" /></h3>
                </div>
                <div id="boardsec">
                	<div id="login">
               		  <h2><img src="../images/member/img_id_find_text.gif" alt="아이디 조회 결과" /></h2>
               		  <% if (data.getId() != null && !data.getId().equals("")) { %>
                        <div id="id_ok" class="c666666_b">
                        	<span class="c383838_b">회원님의 아이디는</span> <span class="cDD0902_b"><%=etcutil.changeText(3, data.getId())%></span> <span class="c666666_b">입니다.(<%=data.getJoinDateTime().substring(0,4)%>년 <%=data.getJoinDateTime().substring(5,7)%>월 <%=data.getJoinDateTime().substring(8,10)%>일 가입)</span><br />개인정보 보호를 위해 끝자리는 ‘*’로 표시합니다.
                      	</div>
					  <% } else { %>
                      	<div id="id_ok" class="c666666_b">
                        	일치하는 정보가 없습니다. 다시 확인하시고 이용해 주십시오.
                      	</div>
                      <% } %>
                        <div id="btn_1"><a href="login.jsp"><img src="../images/member/btn_submit.gif" alt="확인" border="0" /></a> <a href="pw_find.jsp"><img src="../images/member/btn_pw_find_01.gif" alt="PW 찾기" border="0" /></a></div>
                  </div>
              </div>
            </div>
        </div>
    
        <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
    </div>
</div>
</body>
</html>