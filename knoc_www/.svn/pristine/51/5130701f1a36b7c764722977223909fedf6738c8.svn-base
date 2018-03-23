$(function(){	
	
	//gnb	
	$("#gnb").sMenu({		
		on_menu1	: 0,
		on_menu2	: 0,
		hover_class : "hover"
	});	
	
	// oil tab
	var obj_oil_tab = $("#oil_tab > ul > li");
	$("> a", obj_oil_tab).on("click", function(e) {		
		var idx = obj_oil_tab.index($(this).parent("li"));
		obj_oil_tab.removeClass("on").eq(idx).addClass("on");
		
		var no = idx * 1 + 1;		
		$("#oil_tab").attr("class", "main_oil tab0" + no);
		e.preventDefault();		
	});
	
	$("> div > ul > li > a", obj_oil_tab).on("click", function(e) {
		e.preventDefault();
	});
	
	// mining
	$("#main_minings").on("change", function(){
		var code = $(this).val();
		var content = "";
		if(code) {
			for(var i = 0 ; i < mining_arr[code].length ; i++) {
				content += "<option value=\""+ mining_arr[code][i].link + "\">" + mining_arr[code][i].value + "</option>";
			}
		}		
		else {
			content = "<option value\"\">Select Mine Lot</option>";			
		}
		
		$("#main_minings02").html(content);
	});
	
	// popup	
	$(document).on("click", "a.btn_open_popup", function(e) {
		openPopup(this);
		e.preventDefault();		
	});
	
	// banner
	$("#main_banner03 > ul > li > a").on("focusin", function() {
		$(this).parent("li").parent("ul").addClass("hover");
	}).on("mouseenter", function() {
		$(this).parent("li").parent("ul").addClass("hover");
	}).on("focusout", function() {
		$(this).parent("li").parent("ul").removeClass("hover");
	}).on("mouseleave", function() {
		$(this).parent("li").parent("ul").removeClass("hover");
	});
	
	
//	alert($(".footer_banner_prev").length); 
//	컨텐츠가 1개일 경우 롤링은 되지 않게끔 조치.
	if($(".footer_banner_prev").length > 0){

		var foot_banner = 0;
		$(".footer_banner_area").jCarouselLite({
			auto:true,
			speed:600,          
			btnNext:".footer_banner_next",
			btnPrev:  ".footer_banner_prev",
			visible: 1,
			
			afterEnd: function(a){foot_banner=0}
		});			
		
	}
	

	
});

// mining
var mining_arr = {
		"N1" : [
		        {"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_1_2.jsp", "value" : "Kazakhstan"},
		        {"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_1_5.jsp", "value" : "Uzbekistan"},
		        {"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_1_6.jsp", "value" : "Vietnam"},
		        {"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_1_4.jsp", "value" : "Korea"},
		        {"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_1_7.jsp", "value" : "Azerbaijan"},
		        {"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_1_8.jsp", "value" : "Malaysia"}
		        ],		
		"N2" : [
		        {"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_krg.jsp", "value" : "이라크 KRG Bazian"},
		        {"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_qushtappa.jsp", "value" : "이라크 Qush Tappa"},
		        {"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_north.jsp", "value" : "이라크 Sangaw North"},
		        {"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_south.jsp", "value" : "이라크 Sangaw South"},
		        {"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_hawlerarea.jsp", "value" : "이라크 Hawler Area"}
		       ],
       	"N3" : [
		        {"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_namangan.jsp", "value" : "우주벡 Namangan & Chuat"},
		        {"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_aralsea.jsp", "value" : "우주베키스탄 아랄해"},
		        {"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_uznew.jsp", "value" : "서페르가나/취나바드"},
		       ],
		"N4" : [
		        {"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_zambyl.jsp", "value" : "카자흐스탄-잠빌"},
		        {"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_sumbe.jsp", "value" : "카자흐스탄-Sumbe"},
		        {"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_egizkara.jsp", "value" : "카자흐스탄 Egizkara"},
		        {"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_ada.jsp", "value" : "카자흐스탄 ADA"},
		        {"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_skarpovsky.jsp", "value" : "카자흐스탄 S.Karpovsky"}
		       ],
		"N5" : [
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_libya.jsp", "value" : "리비아 Elephant"}
			   ],
		"N6" : [
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_marib.jsp", "value" : "예맨 LNG"},
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_yemen_4_1.jsp", "value" : "예맨 4개발"},
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_yemen_16.jsp", "value" : "예맨 16"},
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_yemen_39.jsp", "value" : "예맨 39"},
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_yemen_70.jsp", "value" : "예맨 70"},
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_yemen_4_2.jsp", "value" : "예맨 4 탐사"}
			   ],	
	   	"N7" : [
		     	{"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_4_1.jsp", "value" : "Russian Federation"},
		     	{"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_4_2.jsp", "value" : "United Kingdom"}
			   ],
		"N8" : [
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_nigeria_323.jsp", "value" : "나이지리아 323"},
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_nigeria_321.jsp", "value" : "나이지리아 321"}
			   ],
   		"N9" : [
	     		{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_inam.jsp", "value" : "아제르 바이잔이남"}
		   	   ],
		   	   
	   	"N10" : [
	     		{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_vietnam_15_1.jsp", "value" : "베트남 15-1"},
	     		{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_vietnam_11_2.jsp", "value" : "베트남 11-2"}
		   	   ],
	   	"N12" : [
		     	{"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_5_2.jsp", "value" : "Yemen"},
		     	{"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_5_1.jsp", "value" : "Iraq"}
			   ],
			   
	    "N13" : [
		     	{"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_2_3.jsp", "value" : "USA"},
		     	{"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_2_1.jsp", "value" : "Canada"},
		     	{"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_2_2.jsp", "value" : "Peru"},
		     	{"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_2_4.jsp", "value" : "Venezuela"},
		     	{"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_2_5.jsp", "value" : "Colombia"}
			   ],
			   
	   "N14" : [
		     	{"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_3_1.jsp", "value" : "Libya"},
		     	{"link" : "http://www.knoc.co.kr/ENG/sub03/sub03_1_3_2.jsp", "value" : "Nigeria"}
			   ],	
	   "N15" : [
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_peru_115.jsp", "value" : "페루 115"},
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_peru_8.jsp", "value" : "페루 8"},
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_peru_tech.jsp", "value" : "페루 SAVIA PERU"}
			   ],
			   
	   "N16" : [
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_cpe_7.jsp", "value" : "콜롬비아 CPE7"},
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_cpo_2.jsp", "value" : "콜롬비아 CPO2"},
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_cpo_3.jsp", "value" : "콜롬비아 CPO3"}
			   ],
	   "N17" : [
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_venezuela.jsp", "value" : "베네수엘라 오나도"}
		   		],
 	   "N18" : [
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_marib.jsp", "value" : "예멘LNG"},
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_yemen_4_1.jsp", "value" : "예멘 4개발"},
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_yemen_70.jsp", "value" : "예멘 70"},
		     	{"link" : "http://www.knoc.co.kr/sub03/sub03_2_2_yemen_4_2.jsp", "value" : "예멘 4탐사"}
		   		]        		       
}

function submitMiningForm(f) {
	var url = f.main_minings02.value;
	if(!url) {
		return false;
	}
	
	f.action = url;
	return true;
}

// font
var font_size = 1;
function zoomInPage() {	
	if(font_size < 5) {
		font_size++;
		$("body").attr("class", "font_size" + font_size);
	}
}

function zoomOutPage() {	
	if(font_size > 1) {
		font_size--;
		$("body").attr("class", "font_size" + font_size);
	}
}

function printPage() {	
	window.print();	
}

/* gnb */
function closeGnb() {
	$("#gnb").removeClass("open");
}

/* multi language */ 
function submitLanguageForm(f) {
	
	var url = f.langs.value;
	if(!url) {
		return false;
	}
	
	f.action = url;	
	return true;
}

/* 팝업창 열기 */
function openPopup(obj) {

	obj = $(obj);
	var url = obj.attr("href");
	var title = obj.attr("title");
	var popup_size = "size_640x480";
		
	var class_arr = obj.attr("class").split(" ");
	var size_fmt = /^size_\d{3,4}x\d{3,4}$/;
	for(var i = 0 ; i < class_arr.length ; i++) {
		if(size_fmt.test(class_arr[i])) { popup_size = class_arr[i]; break; }
	}
	
	size_arr = popup_size.replace("size_", "").split("x");
	var popup_width = size_arr[0];
	var popup_height = size_arr[1];
	
	try {
		window.open(url, title, "scrollbars=yes,width=" + popup_width + ",height=" + popup_height + ",top=10,left=20");		
	}
	catch (e) {
		window.open(url, "", "scrollbars=yes,width=" + popup_width + ",height=" + popup_height + ",top=10,left=20");
	}
}