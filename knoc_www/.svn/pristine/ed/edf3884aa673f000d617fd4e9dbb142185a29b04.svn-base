$(function(){
	// 달력 스크립트 관련
	$.datepicker.regional["ko"] = {
		closeText: "닫기",
		prevText: "이전달",
		nextText: "다음달",
		currentText: "오늘",
		changeMonth: true,
		changeYear: true,
		showButtonPanel: false,
		yearRange: "c-99:c+99",
		maxDate: "+"+365*10+"d",
		minDate: "-"+365*10+"d",
		monthNames: ["1월","2월","3월","4월","5월","6월",
		"7월","8월","9월","10월","11월","12월"],
		monthNamesShort: ["1월","2월","3월","4월","5월","6월",
		"7월","8월","9월","10월","11월","12월"],
		dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		dayNamesShort: ["일","월","화","수","목","금","토"],
		dayNamesMin: ["일","월","화","수","목","금","토"],
		weekHeader: "Wk",
		dateFormat: "yy-mm-dd",
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: true,
		yearSuffix: "",
		showOn: "button",
		buttonImage: "/share/js/jquery-ui-1.11.1.custom/images/ico_calendar.gif",
		buttonImageOnly: true,
		buttonText: "Select date"
	};
	$.datepicker.setDefaults($.datepicker.regional["ko"]);
	 
	$("input.date").datepicker(); 
});