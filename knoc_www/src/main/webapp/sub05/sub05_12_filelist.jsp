<%@page import="com.neoboard.data.AttachFile"%>
<%@page import="kr.co.knoc.gov_public.GovPublicBean"%>
<%@page import="kr.co.knoc.util.EtcUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="/WEB-INF/tlds/sitetaglib.tld" prefix="stl" %>
<%@ taglib uri="/WEB-INF/tlds/sitectrltaglib.tld" prefix="sctrl" %>

<jsp:useBean id="pp" class="kr.co.knoc.tags.pager.PageProperty" scope="request"/>
<jsp:useBean id="etcutil" scope="page" class="kr.co.knoc.util.EtcUtil" />
<jsp:useBean id="govPublicManager" scope="page" class="kr.co.knoc.gov_public.GovPublicManager" />
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String gpk = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("gpk")));
	String sType = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("sType")));
	String sWord = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("sWord")),"8859_1");

	String gov_public_kind_nm = "";
	String[] gov_public_kind_nm_arr = {
			"통합검색","회사현황", "HSEQ", "감사", "사업계획",
			"계약관리", "사회공헌", "인사복지", "예산재무",
			"정보통신", "상생협력", "석유개발", "석유비축",
			"알뜰주유소", "석유정보", "홍보"};

	String[] gNavMenuDepth4Arr = {
			"00", "01", "02", "03", "04",
			"05", "06", "07", "08",
			"09", "10", "11", "12",
			"13", "14", "15"
	};

	String[] imageArr = {
			"/images/information/ttl_sub05_3_total.gif", //통합검색
			"/images/information/ttl_sub04_9_2_1.gif", //회사현황
			"/images/information/ttl_sub04_9_2_2.gif", //HSEQ
			"/images/information/ttl_sub04_9_2_3.gif", //감사
			"/images/information/ttl_sub04_9_2_4.gif", //사업계획
			"/images/information/ttl_sub04_9_2_5.gif", //계약관리
			"/images/information/ttl_sub04_9_2_6.gif", //사회공헌
			"/images/information/ttl_sub04_9_2_7.gif", //인사복지
			"/images/information/ttl_sub04_9_2_8.gif", //예산재무
			"/images/information/ttl_sub04_9_2_9.gif", //정보통신
			"/images/information/ttl_sub04_9_2_10.gif", //상생협력
			"/images/information/ttl_sub04_9_2_11.gif", //석유개발
			"/images/information/ttl_sub04_9_2_12.gif", //석유비축
			"/images/information/ttl_sub04_9_2_13.gif", //알뜰주유소
			"/images/information/ttl_sub04_9_2_14.gif", //석유정보
			"/images/information/ttl_sub04_9_2_15.gif" //홍보
	};


	String[][] arr_str = {
			
		    // 회사현황1
			{ "374",	"감사실",	"이유경",	"052-216-2126" },
			{ "360",	"감사실",	"황자영",	"052-216-2208" },
			{ "페이지 신설 요청",	"기획조정처",	"박종일",	"052-216-2212" },
			{ "189",	"기획조정처",	"강량화",	"052-216-2210" },
			{ "190",	"기획조정처",	"강량화",	"052-216-2210" },
			{ "121",	"기획조정처",	"박종일",	"052-216-2212" },
			{ "페이지 신설 요청",	"기획조정처",	"박종일",	"052-216-2212" },
			{ "페이지 신설 요청",	"기획조정처",	"김연정",	"052-216-2256" },
			{ "186",	"기획조정처",	"김광식",	"052-216-2226" },
			{ "368",	"기획조정처",	"고유나",	"052-216-2228" },
			{ "337",	"기획조정처",	"이상영",	"052-216-2209" },
			{ "126",	"예산투자처",	"김도현",	"052-216-2386" },
			{ "105",	"총무관리처",	"차정민",	"052-21-2607" },
			{ "페이지 신설 요청",	"총무관리처",	"차정민",	"052-21-2607" },
			{ "167",	"총무관리처",	"차정민",	"052-21-2607" },
			{ "페이지 신설 요청",	"총무관리처",	"권승주",	"052-216-3030" },
			{ "169",	"총무관리처",	"이도훈",	"052-216-2605" },
			{ "106",	"총무관리처",	"구본훈",	"052-216-2603" },
			{ "103",	"총무관리처",	"차정민",	"052-21-2607" },
			{ "102",	"총무관리처",	"차정민",	"052-21-2607" },
			{ "107",	"총무관리처",	"권승주",	"052-216-3030" },
			{ "101",	"총무관리처",	"정한나",	"052-216-2609" },
			{ "페이지 신설 요청",	"총무관리처",	"차정민",	"052-21-2607" },
			{ "페이지 신설 요청",	"총무관리처",	"차정민",	"052-21-2607" },
			{ "302",	"총무관리처",	"권승주",	"052-216-3030" },
			{ "301",	"총무관리처",	"권승주",	"052-216-3030" },
			{ "300",	"총무관리처",	"권승주",	"052-216-3030" },
			{ "371",	"총무관리처",	"구본훈",	"052-216-2603" },
			{ "271",	"총무관리처",	"차정민",	"052-216-2607" },
			{ "171",	"인재경영처",	"김종학",	"052-216-2762" },
			{ "177",	"인재경영처",	"고은별",	"052-216-2746" },
			{ "109",	"안전환경처",	"이문규",	"052-216-2962" },
			{ "305",	"안전환경처",	"염지연",	"052-216-2942" },
			{ "303",	"안전환경처",	"안세환",	"052-216-3002" },
			{ "355",	"E&P총괄처",	"김주식",	"052-216-3294" },
			{ "274",	"생산사업1처",	"박지나",	"052-216-3309" },
			{ "164",	"기술개발처",	"강신욱",	"052-216-3515" },
			{ "166",	"비축시설처",	"김동욱",	"052-216-5328" },
			{ "165",	"비축시설처",	"김동욱",	"052-216-5328" },
			{ "184",	"법무팀",	"박원",	"052-216-2272" },
			{ "185",	"법무팀",	"박원",	"052-216-2272" },
			{ "344",	"법무팀",	"박원",	"052-216-2272" },
			{ "182",	"총무관리처, 인재경영처",	"정한나",	"052-216-2609" },

			//HSEQ2
			{ "299", "안전환경처", "양진석", "052-216-2925" },
			{ "332", "안전환경처", "송동은", "052-216-2924" },
			{ "331", "안전환경처", "송동은", "052-216-2924" },				

			//감사3			
			{ "7",	    "감사실",	"김의재",	"052-216-2103" },
			{ "145",	"감사실",	"황민철",	"052-216-2124" },
			{ "146",	"감사실",	"황민철",	"052-216-2124" },
			{ "11",	    "감사실",	"이문환",	"052-216-2122" },
			{ "10",	    "감사실",	"이문환",	"052-216-2122" },
			{ "149",	"감사실",	" ",	" " },
			{ "6",    	"감사실",	"황민철",	"052-216-2124" },
			{ "8",	    "감사실",	"김의재",	"052-216-2103" },
			{ "148",	"감사실",	"이유경",	"052-216-2126" },
			{ "142",	"감사실",	"황민철",	"052-216-2124" },
			{ "150",	"감사실",	"이유경",	"052-216-2126" },
			{ "163",	"감사실",	"이유경",	"052-216-2126" },
			{ "147",	"감사실",	"황민철",	"052-216-2124" },
			{ "192",	"총무관리처",	"차정민",	"052-21-2607" },
			
			//사업계획4
			{ "4", "기획조정처", "노진평", "052-214-2247" },			
			
			//계약관리5
			{ "172",	"총무관리처",	"서석민",	"052-216-2649" },
			{ "173",	"총무관리처",	"서석민",	"052-216-2649" },
			{ "196",	"총무관리처",	"차정민",	"052-216-2607" },
			{ "197",	"총무관리처",	"서석민",	"052-216-2649" },
			{ "페이지 신설 요청",	"총무관리처",	"정봉준",	"052-216-2648" },
			{ "페이지 신설 요청",	"총무관리처",	"정봉준",	"052-216-2648" },			
			
			//사회공헌6
			//
			
			//인사복지7
			{ "161",	"기획조정처",	"차유회",	"052-216-2707" },
			{ "96",	    "인재경영처",	"홍성화",	"052-216-2784" },
			{ "181",	"인재경영처",	"차유회",	"052-216-2707" },
			{ "87",	    "인재경영처",	"고은별",	"052-216-2746" },
			{ "180",	"인재경영처",	"이효진",	"052-216-2766" },
			{ "178",	"인재경영처",	"박영환",	"052-216-2706" },
			{ "179",	"인재경영처",	"이효진",	"052-216-2766" },
			{ "349",	"인재경영처",	"고은별",	"052-216-2746" },
			{ "350",	"인재경영처",	"고은별",	"052-216-2746" },
			
			//예산재무8
			{ "67",	    "재무처",	"송다해",	"052-216-2432" },
			{ "68",	    "재무처",	"송다해",	"052-216-2432" },
			{ "79",	    "재무처",	"원일선",	"052-216-2462" },
			{ "367",	"재무처",	"정진실",	"052-216-2448" },
			{ "336",	"재무처",	"원일선",	"052-216-2462" },
			{ "362",	"재무처",	"나창현",	"052-216-2431" },
			{ "365",	"재무처",	"유병문",	"052-216-2460" },
			
			//정보통신9
			{ "162",	"정보통신",	"박종일",	"052-216-2212" },
			{ "155",	"정보통신",	"배성기",	"052-216-2807" },
			{ "297",	"정보통신",	"김동후",	"052-216-2849" },
			{ "272",	"정보통신",	"최지미",	"052-216-2812" },
			{ "296",	"정보통신",	"배성기",	"052-216-2807" },
			{ "151",	"정보통신",	"이신권",	"052-216-2963" },
			{ "154",	"정보통신",	"이신권",	"052-216-2963" },
			{ "153",	"정보통신",	"이신권",	"052-216-2963" },
			{ "152",	"정보통신",	"이신권",	"052-216-2963" },

			//상생협력10
			{ "198",	"총무관리처",	"이종찬",	"052-216-2626" },
			{ "25",	    "총무관리처",	"이종협",	"052-216-2604" },
			{ "28",	    "총무관리처",	"이종협",	"052-216-2604" },
			{ "31",	    "총무관리처",	"이종찬",	"052-216-2626" },
			{ "26",	    "총무관리처",	"이종협",	"052-216-2604" },
			{ "310",	"총무관리처",	"이종찬",	"052-216-2626" },
			{ "187",	"E&P총괄처",	"김주식",	"052-216-3294" },
			
			//석유개발11			
			{ "313",	"탐사사업처",	"최예슬",	"052-216-3132" },
			{ "220",	"탐사사업처",	"정연찬",	"052-216-3107" },
			{ "219",	"탐사사업처",	"정연찬",	"052-216-3107" },
			{ "369",	"탐사사업처",	"정연찬",	"052-216-3107" },
			{ "370",	"탐사사업처",	"정연찬",	"052-216-3107" },
			{ "315",	"탐사사업처",	"최예슬",	"052-216-3132" },
			{ "314",	"탐사사업처",	"최예슬",	"052-216-3132" },
			{ "312",	"탐사사업처",	"최예슬",	"052-216-3132" },
			{ "276",	"생산사업1처",	"이보미",	"052-216-3313" },
			{ "275",	"생산사업1처",	"윤경원",	"052-216-3348" },
			{ "341",	"생산사업2처",	"진성원",	"052-216-3404" },
			{ "144",	"생산사업2처",	"김광선",	"052-216-3442" },
			{ "338",	"생산사업2처",	"이창숙",	"052-216-3445" },
			{ "339",	"생산사업2처",	"김광선",	"052-216-3442" },
			{ "326",	"시추건설처",	"이고운",	"052-216-3949" },
			{ "281",	"시추건설처",	"유명균",	"052-216-3915" },
			{ "279",	"시추건설처",	"정예석",	"052-216-3927" },
			{ "328",	"시추건설처",	"이고운",	"052-216-3949" },
			{ "325",	"시추건설처",	"이고운",	"052-216-3949" },
			{ "278",	"시추건설처",	"이종일",	"052-216-3923" },
			
			//석유비축12
			{ "366",	"석유비축처",	"안재율",	"052-216-5065" },
			{ "366",	"석유비축처",	"김현정",	"052-216-5005" },
			{ "311",	"석유비축처",	"김수동",	"052-216-5044" },
			{ "358",	"석유사업처",	"권오건",	"052-216-5105" },
			{ "356",	"석유사업처",	"권오건",	"052-216-5105" },
			{ "357",	"석유사업처",	"권오건",	"052-216-5105" },
			{ "351",	"석유사업처",	"권오건",	"052-216-5105" },
			{ "346",	"비축시설처",	"김동욱",	"052-216-5328" },
			{ "345",	"비축시설처",	"김동욱",	"052-216-5328" },
			{ "348",	"비축시설처",	"김동욱",	"052-216-5328" },
			{ "347",	"비축시설처",	"김동욱",	"052-216-5328" },
			{ "286",	"오일허브사업단",	"백성현",	"052-216-5423" },
			{ "284",	"오일허브사업단",  	"이승용",	"052-216-5405" },
			{ "285",	"오일허브사업단",	"이승용",	"052-216-5405" },
			{ "287",	"오일허브사업단",	"백성현",	"052-216-5423" },

			//알뜰주유소13
			{ "319",	"유통사업처",	"송은정",	"052-216-5245" },
			{ "322",	"유통사업처",	"오유나",	"052-216-5205" },
			{ "321",	"유통사업처",	"김선일",	"052-216-5203" },
			{ "320",	"유통사업처",	"김선일",	"052-216-5203" },
			
			//석유정보14
			{ "페이지 신설 요청",	"총무관리처",	"차정민",	"052-216-2607" },
			{ "308",	"석유정보센터",	"정찬신",	"052-216-2523" },
			{ "307",	"석유정보센터",	"정주현",	"052-216-2551" },
			{ "306",	"석유정보센터",	"유제원",	"052-216-2579" },
			{ "309",	"석유정보센터",	"정보원",	"052-216-2505" },
			{ "295",	"기술개발처",	"강신욱",	"052-216-3515" },
			{ "317",	"기술개발처",	"강신욱",	"052-216-3515" },
			{ "323",	"기술개발처",	"강신욱",	"052-216-3515" },
			
			//홍보15
			{ "193",	"기획조정처",	"조정근",	"052-216-2229" },
			{ "188",	"기획조정처",	"주형인",	"052-216-2232" },
			{ "195",	"기획조정처",	"고유나",	"052-216-2228" },
			{ "170",	"총무관리처",	"차정민",	"052-216-2607" },
			{ "191",	"총무관리처",	"정한나",	"052-216-2609" },
			{ "157",	"석유정보센터 ","김솔",	    "052-216-2550" },
			{ "140",	"E&P총괄처",	"김주식",	"052-216-3294" }			
			
			
	};

	
	if(gpk.length() > 0){
		/**
		* 2016. 03. 21 / MYM
		* 보안약점 조치
		*/
		int intGpk = Integer.parseInt(gpk);
		if(intGpk < 0) { intGpk = 0; }
		gov_public_kind_nm = gov_public_kind_nm_arr[intGpk];
	}

	String nowpage = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("page")));
	String gov_public_nid = EtcUtil.strBlockSpecialTags(EtcUtil.checkNull(request.getParameter("gov_public_nid")));

	pp.setPage(nowpage);
	pp.setPageSize("10");
	pp.setPageUrl("");

	ArrayList<HashMap<String, String>> govPublicList = govPublicManager.getGovPublicFileList(gov_public_nid, request);

	int count = govPublicManager.getGovPublicKindListCount(Integer.parseInt(gpk));
	int seq = count-(pp.getNPage()-1) * pp.getNPageSize();
	/**
	* 2016. 03. 21 / MYM
	* 보안약점 조치
	*/
	if(seq < 0) { seq = 1; }
%>

<%
    /*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	' Page Navigator section
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
	application.setAttribute("gNavMenuDepth1","05");
	application.setAttribute("gNavMenuDepth2","13");
	application.setAttribute("gNavMenuDepth3","11");

	/**
	* 2016. 03. 21 / MYM
	* 보안약점 조치
	*/
	int intGpk = Integer.parseInt(gpk);
	if(intGpk < 0) { intGpk = 0; }
	application.setAttribute("gNavMenuDepth4",gNavMenuDepth4Arr[intGpk]);
	/*'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''*/
%>

<%!
	private String getFileImage(HttpServletRequest request, String fileName){

		String imgFileNm = fileName.toLowerCase();
		String mime = "";
		String imgSrc = "";

		if(imgFileNm.lastIndexOf(".") > -1)
	    	mime = imgFileNm.substring(imgFileNm.lastIndexOf(".")+1);
	    else
	    	mime = "unknown";

	    if(AttachFile.containsMime(mime))
	    	imgSrc = "/neoboard/skin/skin01/images/mime_" + mime + ".gif";
	    else
	    	imgSrc = "/neoboard/skin/skin01/images/mime_unknown.gif";

		return imgSrc;
	}
%>

<%@include file="/include/comheader.jsp"%>
<%@include file="/include/subtopnavi_new.jsp"%><!--// subtopNavi: start //-->

	<div id="contents">
		<!--// leftmenu: start //-->
        <%@include file="/include/sub_leftmenu_new.jsp"%>
        <!--// leftmenu: end //-->
		<div id="rightarea">
			<div id="subcnts">
				<%@include file="/include/subtop_05.jsp"%>

				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>
					&gt; <span>정보마당</span>
					&gt; <span>사전정보공표</span>
					&gt; <span>카테고리별 정보</span>
					&gt; <span class="locanow"><%=gov_public_kind_nm %></span>
				</div>
				<!--// location: end //-->

				<div class="pagetle">
					<h3 class="tleimg"><img src="<%=imageArr[Integer.parseInt(gpk)] %>" alt="<%=gov_public_kind_nm_arr[Integer.parseInt(gpk)] %>" /></h3>
				</div>

				<!-- list -->
				<div id="boardsec">
					<table cellspacing="0" cellpadding="0" class="listtype" summary="">
						<caption></caption>
						<colgroup>
							<col width="15%" />
							<col width="*" />
							<col width="15%" />
							<col width="15%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">게재일자</th>
								<th scope="col">첨부파일</th>
							</tr>
						</thead>
						<tbody>
						<%if(count == 0){ %>
							<tr>
								<td colspan="7">등록된 정보가 없습니다.</td>
							</tr>
						<%
							}else{
								Iterator<HashMap<String, String>> iter = govPublicList.iterator();
								int fileNum = govPublicList.size();
								while(iter.hasNext()){
									HashMap<String, String> hashMap = iter.next();
						%>
							<tr>
								<td><%=fileNum %></td>
								<td style="text-align:left;"><%=EtcUtil.checkNull(hashMap.get("FILE_TITLE")) %></td>
								<td><%=EtcUtil.checkNull(hashMap.get("REG_DATE")) %></td>
								<td>
								<%if(hashMap.get("GOV_PUBLIC_FILE_SEQ") != null){ %>
									<a href="sub05_12_filedown.jsp?gov_public_file_seq=<%=EtcUtil.checkNull(hashMap.get("GOV_PUBLIC_FILE_SEQ")) %>">
										<img src="<%=getFileImage(request, EtcUtil.checkNull(hashMap.get("ORG_FILE_NM"))) %>" border="0" width="16" height="16" alt="<%=EtcUtil.checkNull(hashMap.get("ORG_FILE_NM")) %>" />
									</a>
								<%}else{out.print("&nbsp;");} %>
								</td>
							</tr>
						<%
									seq--;
									fileNum--;
								}
							}
						%>
						</tbody>
					</table>
				</div>
				<div class="boardbtm" style="text-align: right; padding-top:10px;margin-right:20px;">
					<a href="/sub05/sub05_12_list.jsp?gpk=<%=gpk%>&page=<%=nowpage %>&sType=<%=sType%>&sWord=<%=sWord %>">
						<img src="/neoboard/skin/skin01/images/btn_list.gif" />
					</a>
				</div>

				<div class="new_officer">
					<table summary="담당부서 및 연락처 관리일">
					<caption>담당부서 및 연락처 관리일</caption>
					<tbody>
						<tr>
							<td class="write_day"></td>
<%


	//gov_public_nid = "287";

	String[] info = new String[4];
	String info_dept = "";
	String info_name = "";
	String info_tel  = "";
	
	for(int i=0; i<arr_str.length; i++){
		info[0] = "";
		info[1] = "";
		info[2] = "";

		if( arr_str[i][0].equals(gov_public_nid)) {
			info[0] = arr_str[i][0];
			info[1] = arr_str[i][1];
			info[2] = arr_str[i][2];
			info[3] = arr_str[i][3];
			break;
		}
	
	}
	
	info_dept = info[1] != null?info[1]: "";
	info_name = info[2] != null?info[2]: "";
	info_tel  = info[3] != null?info[3]: "";

%>							

						    <td class="contact_team"><strong>담당부서 : </strong><%=info_dept %></td>
							<td class="contact_user"><strong>담당자 : </strong><%=info_name %></td>
							<td class="contact_tel"><strong>연락처 : </strong><%=info_tel %></td>					
						
						</tr>
					</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->
</div>

</body>
</html>