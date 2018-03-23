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
	application.setAttribute("gNavMenuDepth3","04");
	application.setAttribute("gNavMenuDepth4","00");
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>   
<% request.setCharacterEncoding("euc-kr"); %> 
<%
	String name =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("name")),"8859_1");
	String id =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("id")),"8859_1");
	String email =  etcutil.strBlockSpecialTags(etcutil.checkNull(request.getParameter("email")),"8859_1");
	
	MgrDO data = new MgrDO();
	data.setName(name);
	data.setEmail(email);
	data.setId(id);
	
	int cnt = mgrHelper.FindPwd(data);
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
					<a href="/" title="한국석유공사 메인페이지로 이동"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
                    &gt; <span>기타서비스</span> &gt; <span class="locanow">패스워드 찾기</span></div>
            <!--// location: end //-->
            
                <div class="pagetle">
                    <h3><img src="/images/member/ttl_pw_find.gif" alt="패스워드 찾기" /></h3>
                </div>
                <div id="boardsec">
                	<div id="login">
               		  <h2><img src="../images/member/img_pw_find_text.gif" alt="패스워드 조회 결과" /></h2>
               		  <% 
               		  if (cnt > 0) {
               			  if (data.getMobileNumber() != null && !data.getMobileNumber().equals("")) {
               		  %>
                        <div id="id_ok" class="c666666_b">
                        	<span class="c383838_b">회원님의 핸드폰번호로 임시 비밀번호를 발송하였습니다.</span><br />비밀번호 발송  번호 : <span class="cDD0902_b"> <%=data.getMobileNumber()%></span>
                      	</div>
                      <%
               			  } else {
               		  %>
                        <div id="id_ok" class="c666666_b">
                        	<span class="c383838_b">회원님의 핸드폰번호가 존재하지 않습니다. </span><br />관리자에게 문의해 주십시오.
                      	</div>               		  
               		  <%
               			  }
                      } else {
                      %>
					  <div id="id_ok" class="c666666_b">
                        	<span class="c383838_b">회원님의 핸드폰번호가 존재하지 않습니다. </span><br />관리자에게 문의해 주십시오.
                      	</div>
					  <%
					  }
					  %>
                        <div id="btn_1" style="padding-left:50px;"><a href="login.jsp"><img src="../images/member/btn_submit.gif" alt="확인" border="0" /></a></div>
                  </div>
              </div>
            </div>
        </div>
    
        <%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
    </div>
</div>
</body>
</html>