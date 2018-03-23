<%@page import="java.util.HashMap"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="euc-kr"%>
<%@ page import="com.neoboard.util.*"%>
<%@page import="java.text.*, java.io.*, kr.co.knoc.util.HTMLFilter" %>

<%
     EtcUtil etc = new EtcUtil();
     //JSP에서 Servlet사용시 out이 중복이 되면서 나는 에러 때문에 out객체 자체를 body 밖으로 내보냈다.
	
     out.clear();
     out = pageContext.pushBody();
    /* 
    if(request.getParameter("filename").indexOf("../")>=0||request.getParameter("filename").indexOf("./")>=0){    	
    	response.sendRedirect("");    	
	}
    */

    if(request.getParameter("filepath") != null && (request.getParameter("filepath").indexOf("../")>=0||request.getParameter("filepath").indexOf("./")>=0)){    
    	response.sendRedirect("");
	}

	HashMap hash = new HashMap();
	
	hash.put("1", "CIP_manual.pdf");
	hash.put("2", "historybook_0218.pdf");
	hash.put("3", "2014_BS.xlsx");
	hash.put("4", "2014_IS.xlsx");
	hash.put("5", "2011_RS.xls");
	hash.put("6", "2012_CASH.xls");
	hash.put("7", "20120409_wellbeing.xls");
	hash.put("9", "20131223_agree.pdf");
	hash.put("10", "130103_new.pdf");
	
	
	hash.put("11", "20080229_agree.pdf");	
	hash.put("12", "20131223_agree.hwp");
    hash.put("13", "FS_KNOC_2010.pdf");
    hash.put("14", "Report(E)_KNOC_FY12.pdf");
    hash.put("15", "KOC_cartoon_e-book.pdf");
    hash.put("16", "Consolidated_Audit_Report_KNOC_FY2013.pdf");
	
    hash.put("17", "info_from_download.hwp");
    hash.put("18", "object_from_download.hwp");
    hash.put("19", "closed_documen_download.hwp");
    hash.put("20", "payband_2131223.pdf");	
    hash.put("21", "time_131129.pdf");	
    
    
    hash.put("22_1", "1_group_agreemen_141208.pdf");	
    hash.put("22_2", "2_2014_group_substance.pdf");
    hash.put("22_3", "3_2014_group_table.pdf");
    hash.put("22_4", "4_pay_agreement.zip");
    hash.put("22_5", "5_add_agreemnet.zip");
    hash.put("22_6", "6_work_140805.zip");
    hash.put("22_7", "7_knoc_worker10year_14year.hwp");
    hash.put("22_8", "8_group_agreement_140919.pdf");
	hash.put("23", "FY2014_English_Report.pdf");
	hash.put("24", "2016_statements.xlsx");
	hash.put("25", "edu_application.xlsx");    
	hash.put("26", "2016year_3.pdf");  // 2016년 대출이자율 현황(3분기).pdf
	hash.put("27", "energy_2016_01.hwp");
	hash.put("28", "b_2016_01.hwp");
	hash.put("29", "FY2015_English_Report.pdf");	
	hash.put("30", "2016_bigonggae.hwp"); // 한국석유공사 비공개 세부기준
	hash.put("31", "oil_loan(2016_06_24).hwp"); // 석유개발사업자금대출및관리규정.HWP
	hash.put("32", "2016year_4.pdf");	
	hash.put("33", "2012_kor.pdf");	
	hash.put("34", "2014_kor.pdf");	
	hash.put("35", "2012_eng.pdf");	
	hash.put("36", "2014_eng.pdf");
    
    // 다운로드할 파일의 이름을 알아내기
    String fname = new HTMLFilter().filter(hash.get(etc.checkNull(request.getParameter("fileno"))).toString());  // 보안약점 조치 2016.03.21 ECJ
    String fpath = new HTMLFilter().filter(etc.checkNull(request.getParameter("filepath")));  // 보안약점 조치 2016.03.21 ECJ
    
    // 다운로드할 파일이 저장되어 있는 곳 정의
    //String upDir = "/data/WEB/www2_knoc_co_kr/WebContent"+ fpath;
    
    // upDir 경로 수정 20120928
    ServletContext context = request.getSession().getServletContext();   
    String upDir=context.getRealPath("/") + fpath;
    
    // 다운로드할 파일의 완전한 경로
    String dname = upDir + fname;
    
    // 다운로드할 파일에 대해 한글처리
    fname = new String(fname.getBytes("euc-kr"), "ISO-8859-1");
      
    // 다운로드할 파일 내용을 디스크로 부터 읽어오기.
    File fp = new File(dname);
    String fsize = String.valueOf(fp.length());
    byte b[] = new byte[Integer.parseInt(fsize)];
    
    // 무조건 다운로드창을 띠우기 위해 HTTP header 설정
    response.setHeader("Content-type","application/unknowon");
    response.setHeader("Content-Disposition","attachment; filename=\"" + fname +"\"");    
    response.setHeader("Content-Length",fsize.replaceAll("\r", "").replaceAll("\n", "") +";");
    response.setHeader("Content-Transfer-Encoding","binary");
    response.setHeader("Pragma","no-cache");    
    response.setHeader("Expires","0");    
    
    if(fp.isFile()){
        BufferedInputStream fin  = new BufferedInputStream(new FileInputStream(fp));
        BufferedOutputStream fon = 
                new BufferedOutputStream(response.getOutputStream());
                
        int read = 0;
        try{
            while((read = fin.read(b)) != -1){
                fon.write(b,0,read );
            }                
                
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            if(fon!=null)
                fon.close();
            if(fin!=null)
                fin.close();
                        
        }
    }
    
%>