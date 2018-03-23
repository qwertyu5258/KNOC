$(function(){
	
	//gnb
	var gnb = $("#header");
	$("#gnb", gnb).sMenu({		
		on_menu1	: 0,
		on_menu2	: 0,
		hover_class : "hover",
		openCall	: function() {
					$("#gnb > ul > li > ul").stop().animate({ "height" : "239px"}, 0);
		},
		closeCall	: function() {
					$("#gnb > ul > li > ul").stop().animate({ "height" : "0"}, 0);	
		},
		hoverCall	:  function(obj, depth) {			
			if(depth == 2) {
				$("#gnb > ul > li").removeClass("hover");
				obj.parent().parent("li").addClass("hover");
			}
		}
	});
	//gnb닫기
	$(".btn_gnb_close").click(function(){
		$("#gnb").removeClass("open");
		$("#gnb > ul > li > ul").stop().animate({ "height" : "0"}, 0);	
	});

	//footer banner
	var foot_banner = 0
	$(".footer_banner_area").jCarouselLite({
		auto:true,
		speed:600,          
		btnNext:".footer_banner_next",
		btnPrev:  ".footer_banner_prev",
		visible: 7,
		
		afterEnd: function(a){foot_banner=0}
	});
	
	//프린트
	$(".btn_print").click(function(){
		window.print();
	});
	
	var fontSize = 1;
	$(".font_size .zoom_in").click(function(){
		if(fontSize == 5){
			
		}else{
			fontSize++
			$("body").removeClass().addClass("font_size"+fontSize);
		}
	});
	
	$(".font_size .zoom_out").click(function(){
		if(fontSize == 1){
			
		}else{
			fontSize--
			$("body").removeClass().addClass("font_size"+fontSize);
		}
	});
	//폰트사이즈

	$("a.btn_open_popup").on("click", function(e) {
		openPopup(this);
		e.preventDefault();
	});	
});


function goSite(a){
	
	if(a == 1){
		var obj = document.getElementById("langs");
	}else if( a == 2){
		var obj = document.getElementById("main_minings");
	}else{
		
	}
	
	var strSite = obj.value;
	
	if(strSite != ""){
		if(a == 2) {
			location.href = strSite;
		} else {
			window.open(strSite);
		}
	}
	
}



function openPopup(obj) {
	obj = $(obj);
	var url = obj.attr("href");
	var title = obj.attr("title");
	var popup_size = "size_640x480"; //기본 사이즈
		
	var class_arr = obj.attr("class").split(" ");
	var size_fmt = /^size_\d{3,4}x\d{3,4}$/;
	for(var i = 0 ; i < class_arr.length ; i++) {
		if(size_fmt.test(class_arr[i])) { popup_size = class_arr[i]; break; }
	}
	
	size_arr = popup_size.replace("size_", "").split("x");
	var popup_width = size_arr[0];
	var popup_height = size_arr[1];
	
	try {
		window.open(url, title, "scrollbars=no,width=" + popup_width + ",height=" + popup_height + ",top=100,left=600");		
	}
	catch (e) {
		window.open(url, "", "scrollbars=no,width=" + popup_width + ",height=" + popup_height + ",top=100,left=600");
	}
}