<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.net.*"%>
<%@ page import = "java.io.*"%>    
<%@ page import = "kr.co.knoc.petronet.*"%>
<jsp:useBean id="PetronetMa" scope="page" class="kr.co.knoc.petronet.PetronetManager" /> 
<%
	String path = "http://www.petronet.co.kr/KNOC/KNOC_home_new.jsp";
	URL testUrl = new URL ( path ) ; 
	URLConnection uc = testUrl.openConnection (  ) ; 
	if  ( uc == null )   {  
		throw new Exception ( "Got a null URLConnection object!" ) ; 
	}  
	InputStream is = uc.getInputStream (  ) ; 
	if  ( is == null )   {  
		throw new Exception ( "Got a null content object!" ) ; 
	}  
	StringBuffer putBackTogether = new StringBuffer (  ) ; 
	Reader r = new InputStreamReader ( is, "euc-kr" ) ; 
	char [  ]  cb = new char [ 2048 ] ; 
	
	
	int amtRead = r.read ( cb ) ; 
	while  ( amtRead  >  0 )   {  
		putBackTogether.append ( cb, 0, amtRead ) ; 
		amtRead = r.read ( cb ) ; 
	}  
	String pageSource = putBackTogether.toString (  ) ;

	out.println(pageSource);
	if (pageSource != null) {
		String[] content = pageSource.split("<BR />");
		String pageS1 = content[0];
		String[] recentDtArray = pageS1.split(":");
		String recentDt = recentDtArray[1];
		//원유현물
		String[] oilArray = content[1].split("/");
		String oil1_name = oilArray[0];
		String oil1_num = oilArray[1];
		String oil1_img = oilArray[2];
		oil1_img = content[1].substring(content[1].indexOf(oil1_img),content[1].length());
		oilArray = content[2].split("/");
		String oil2_name = oilArray[0];
		String oil2_num = oilArray[1];
		String oil2_img = oilArray[2];
		oil2_img = content[2].substring(content[2].indexOf(oil2_img),content[2].length());
		oilArray = content[3].split("/");
		String oil3_name = oilArray[0];
		String oil3_num = oilArray[1];
		String oil3_img = oilArray[2];
		oil3_img = content[3].substring(content[3].indexOf(oil3_img),content[3].length());
		//석유제품
		oilArray = content[4].split("/");
		String oilp1_name = oilArray[0];
		String oilp1_num = oilArray[1];
		String oilp1_img = oilArray[2];
		oilp1_img = content[4].substring(content[4].indexOf(oilp1_img),content[4].length());
		oilArray = content[5].split("/");
		String oilp2_name = oilArray[0];
		String oilp2_num = oilArray[1];
		String oilp2_img = oilArray[2];
		oilp2_img = content[5].substring(content[5].indexOf(oilp2_img),content[5].length());
		oilArray = content[6].split("/");
		String oilp3_name = oilArray[0];
		String oilp3_num = oilArray[1];
		String oilp3_img = oilArray[2];
		oilp3_img = content[6].substring(content[6].indexOf(oilp3_img),content[6].length());
		//원유선물
		oilArray = content[7].split("/");
		String oils1_name = oilArray[0];
		String oils1_num = oilArray[1];
		String oils1_img = oilArray[2];
		oils1_img = content[7].substring(content[7].indexOf(oils1_img),content[7].length());
		oilArray = content[8].split("/");
		String oils2_name = oilArray[0];
		String oils2_num = oilArray[1];
		String oils2_img = oilArray[2];
		oils2_img = content[8].substring(content[8].indexOf(oils2_img),content[8].length());
		//국내기간
		String recentDtP = content[9].substring(content[9].indexOf("recentDt-")+9,content[9].length());
		//주유소판매
		oilArray = content[10].split("/");
		String station1_name = oilArray[0];
		String station1_num = oilArray[1];
		String station1_img = oilArray[2];
		station1_img = content[10].substring(content[10].indexOf(station1_img),content[10].length());
		oilArray = content[11].split("/");
		String station2_name = oilArray[0];
		String station2_num = oilArray[1];
		String station2_img = oilArray[2];
		station2_img = content[11].substring(content[11].indexOf(station2_img),content[11].length());
		oilArray = content[12].split("/");
		String station3_name = oilArray[0];
		String station3_num = oilArray[1];
		String station3_img = oilArray[2];
		station3_img = content[12].substring(content[12].indexOf(station3_img),content[12].length());
		//LPG판매
		oilArray = content[13].split("/");
		String lpg1_name = oilArray[0];
		String lpg1_num = oilArray[1];
		String lpg1_img = oilArray[2];
		lpg1_img = content[13].substring(content[13].indexOf(lpg1_img),content[13].length());
		oilArray = content[14].split("/");
		String lpg2_name = oilArray[0];
		String lpg2_num = oilArray[1];
		String lpg2_img = oilArray[2];
		lpg2_img = content[14].substring(content[14].indexOf(lpg2_img),content[14].length());
		out.println("recentDt = " + recentDt.trim());
		out.println("oil1_name = " + oil1_name.trim());
		out.println("oil1_num = " + oil1_num.trim());
		out.println("oil1_img = " + oil1_img.trim());
		out.println("oil2_name = " + oil2_name.trim());
		out.println("oil2_num = " + oil2_num.trim());
		out.println("oil2_img = " + oil2_img.trim());
		out.println("oil3_name = " + oil3_name.trim());
		out.println("oil3_num = " + oil3_num.trim());
		out.println("oil3_img = " + oil3_img.trim());
		out.println("oilp1_name = " + oilp1_name.trim());
		out.println("oilp1_num = " + oilp1_num.trim());
		out.println("oilp1_img = " + oilp1_img.trim());
		out.println("oilp2_name = " + oilp2_name.trim());
		out.println("oilp2_num = " + oilp2_num.trim());
		out.println("oilp2_img = " + oilp2_img.trim());
		out.println("oilp3_name = " + oilp3_name.trim());
		out.println("oilp3_num = " + oilp3_num.trim());
		out.println("oilp3_img = " + oilp3_img.trim());
		out.println("oils1_name = " + oils1_name.trim());
		out.println("oils1_num = " + oils1_num.trim());
		out.println("oils1_img = " + oils1_img.trim());
		out.println("oils2_name = " + oils2_name.trim());
		out.println("oils2_num = " + oils2_num.trim());
		out.println("oils2_img = " + oils2_img.trim());
		out.println("recentDtP = " + recentDtP.trim());
		out.println("station1_name = " + station1_name.trim());
		out.println("station1_num = " + station1_num.trim());
		out.println("station1_img = " + station1_img.trim());
		out.println("station2_name = " + station2_name.trim());
		out.println("station2_num = " + station2_num.trim());
		out.println("station2_img = " + station2_img.trim());
		out.println("station3_name = " + station3_name.trim());
		out.println("station3_num = " + station3_num.trim());
		out.println("station3_img = " + station3_img.trim());
		out.println("lpg1_name = " + lpg1_name.trim());
		out.println("lpg1_num = " + lpg1_num.trim());
		out.println("lpg1_img = " + lpg1_img.trim());
		out.println("lpg2_name = " + lpg2_name.trim());
		out.println("lpg2_num = " + lpg2_num.trim());
		out.println("lpg2_img = " + lpg2_img.trim());
		
		PetronetBean pb = new PetronetBean();
		pb.setRecentDt(recentDt.trim());
		pb.setOil1Name(oil1_name.trim());
		pb.setOil1Num(oil1_num.trim());
		pb.setOil1Img(oil1_img.trim());
		pb.setOil2Name(oil2_name.trim());
		pb.setOil2Num(oil2_num.trim());
		pb.setOil2Img(oil2_img.trim());
		pb.setOil3Name(oil3_name.trim());
		pb.setOil3Num(oil3_num.trim());
		pb.setOil3Img(oil3_img.trim());
		pb.setOilp1Name(oilp1_name.trim());
		pb.setOilp1Num(oilp1_num.trim());
		pb.setOilp1Img(oilp1_img.trim());
		pb.setOilp2Name(oilp2_name.trim());
		pb.setOilp2Num(oilp2_num.trim());
		pb.setOilp2Img(oilp2_img.trim());
		pb.setOilp3Name(oilp3_name.trim());
		pb.setOilp3Num(oilp3_num.trim());
		pb.setOilp3Img(oilp3_img.trim());
		pb.setOils1Name(oils1_name.trim());
		pb.setOils1Num(oils1_num.trim());
		pb.setOils1Img(oils1_img.trim());
		pb.setOils2Name(oils2_name.trim());
		pb.setOils2Num(oils2_num.trim());
		pb.setOils2Img(oils2_img.trim());
		pb.setRecentDtP(recentDtP.trim());
		pb.setStation1Name(station1_name.trim());
		pb.setStation1Num(station1_num.trim());
		pb.setStation1Img(station1_img.trim());
		pb.setStation2Name(station2_name.trim());
		pb.setStation2Num(station2_num.trim());
		pb.setStation2Img(station2_img.trim());
		pb.setStation3Name(station3_name.trim());
		pb.setStation3Num(station3_num.trim());
		pb.setStation3Img(station3_img.trim());
		pb.setLpg1Name(lpg1_name.trim());
		pb.setLpg1Num(lpg1_num.trim());
		pb.setLpg1Img(lpg1_img.trim());
		pb.setLpg2Name(lpg2_name.trim());
		pb.setLpg2Num(lpg2_num.trim());
		pb.setLpg2Img(lpg2_img.trim());
		
		boolean result = PetronetMa.deletePetronet();
		result = PetronetMa.insertPetronet(pb);
	}	
%>