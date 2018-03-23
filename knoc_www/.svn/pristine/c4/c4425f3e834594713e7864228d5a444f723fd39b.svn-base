<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*"%>    
<%@ page import = "kr.co.knoc.util.*"%>
<%@ page import = "kr.co.knoc.banner.*"%>
<jsp:useBean id="BannerMa" scope="page" class="kr.co.knoc.banner.BannerManager" />
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<% request.setCharacterEncoding("euc-kr"); %>    
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>석유공사 홈페이지에 오신것을 환영합니다.</title>
<script src="/include/jquery.js" type="text/javascript" ></script>
<script src="/include/content.js" type="text/javascript" ></script>
<link href="/include/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/share/js/common.js"></script>
<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0">
		
		
		
		<div id="2010banner">
				<div style="width:50px;float:left;margin:10px 0 0 15px;">
				<h2><img src="/images/main/bnt_tle.gif" alt="배너모음" /></h2><br />
				<img src="/images/main/bnr_play.gif" onclick="bn_play();return false;"  alt="재생" style="cursor:pointer"/>&nbsp;
				<img src="/images/main/bnr_stop.gif" onclick="bn_skip();return false;" alt="정지"  style="cursor:pointer"/>
				</div>
				<div id="wrap">
					<a href="#banner" class="prev"><img src="/images/new_main/scroll_left.gif" onclick="mv_left();return false;" alt="이전" /></a>

					<div id="list">
						<ul>

<%
ArrayList al = BannerMa.getBanner();
int i = 0;
Iterator iter = al.iterator();
while(iter.hasNext()){
	BannerBean bb = (BannerBean)iter.next();
%>

							<li><a href="<%=bb.getLinkUrl()%>" target="<%=bb.getLinkType()%>" title="<%=bb.getAlttext()%>"><img src="/upload/BANNER/<%=bb.getNewFilename()%>" alt="<%=bb.getAlttext()%>" /></a></li>
<%
	i++;
}
%>
							
						</ul>
					</div>
					<a href="#banner" class="next"><img src="/images/new_main/scroll_right.gif" onclick="mv_right();return false;"  alt="다음" /></a>
				</div>		
			</div>

			<script type='text/javascript'>bann_init(); // 초기화</script>


</body>
</html>