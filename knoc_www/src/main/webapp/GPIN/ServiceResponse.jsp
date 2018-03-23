<%@ page language = "java" contentType = "text/html; charset=UTF-8"%>

<%@ page import="kr.co.knoc.util.*" %>
<%@ page import="gov.mogaha.gpin.sp.proxy.*" %>

<%
    /**
     * 이 서비스는 공공I-PIN인증정보수신 페이지입니다.
     * 사용자인증 정보, 사이트가입확인요청 등의 요청서비스에 대해서 공공I-PIN에서 응답을 주는 페이지이므로
     * 1) 공공I-PIN 공무원창구를 통해 정확하게 URL이 등록되어야하며
     * 2) 서비스와 관련된 내용을 수정하시면 안됩니다.
     *
     */
    response.addHeader("Cache-Control", "private");

    GPinProxy proxy = GPinProxy.getInstance(this.getServletConfig().getServletContext());

	String[] attrNames = new String[] {"dupInfo", "virtualNo", "realName", "sex", "age", "birthDate", "nationalInfo", "authInfo", "GPIN_AQ_SERVICE_SITE_USER_CONFIRM"}; 

	String samlResponse = request.getParameter("SAMLResponse");

	String okurl = Kcookie.getCookie(request, "okurl" );
	String return_url = (String)application.getAttribute("return_url" );
	application.setAttribute("return_url","");
	
	if(okurl == null || okurl.equals("")){
		okurl = "/index.jsp";
	} else {
		okurl = okurl + "?return_url=" + return_url;
	}

	int attLenth = 0;
	
	String parameter = request.getParameter("versionRequest");
	
    if(parameter != null && "versionRequest".equals(parameter) )
    {
        try
        {
            out.println(proxy.getSPVersion());
        }
        catch(Exception e)
        {
            // 에러에 대한 처리는 이용기관에 맞게 처리할 수 있습니다.
            e.printStackTrace();
            out.println(e.getMessage());
        }
        return;
    }

			
	// 요청한 사용자 IP와 응답받는 사용자 IP를 비교한다.
	if (request.getRemoteAddr().equals(session.getAttribute("gpinUserIP")))
	{

		String[] rets = proxy.parseSAMLResponse(samlResponse, attrNames);
				
		attLenth = rets.length;
				
		if (!rets[0].equals(""))
						session.setAttribute("dupInfo", rets[0]);
		if (!rets[1].equals(""))
						session.setAttribute("virtualNo", rets[1]);
		if (!rets[2].equals(""))
						session.setAttribute("realName", rets[2]);
		if (!rets[3].equals(""))
						session.setAttribute("sex", rets[3]);
		if (!rets[4].equals(""))
						session.setAttribute("age", rets[4]);
		if (!rets[5].equals(""))
						session.setAttribute("birthDate", rets[5]);
		if (!rets[6].equals(""))
						session.setAttribute("nationalInfo", rets[6]);
		if (!rets[7].equals(""))
						session.setAttribute("authInfo", rets[7]);     
		if (!rets[8].equals(""))
						session.setAttribute("GPIN_AQ_SERVICE_SITE_USER_CONFIRM", rets[8]);
	}			
			
%>
		<script language="javascript" type="text/javascript">
				if (<%=attLenth%> > 0 )
				{
		//Sample-AuthRequest에서 생선한 세션값으로 이동함.

		window.opener.location.href = "<%=okurl%>";
		window.close();
				}
				else{
					alert("수신받은 인증값이 없습니다.");
				}
		</script>    
<%
    session.setAttribute("gpinAuthRetPage", null);
	session.setAttribute("okurl",null);
%>