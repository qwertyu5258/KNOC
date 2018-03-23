;(function($) { 
	//리스트에서 항목을 체크한 후 삭제할 때 체크된게 있는지 검사
	/**
	 * TEMPL_ID 각각 checkbox class
	 * $(".TEMPL_ID").bmtChecked("이동할 템플릿을 선택하세요")
	 */
	$.fn.bmtChecked = function(msg){
		 
		var checked=true;
		this.each(function(){  
			 
			if($(this).attr("checked")){  
				checked=false;
				return false;	
			} 
		});
		if(checked){  
			if(msg){
				alert(msg); 
			}else{
				alert("삭제 할 회원을 선택해 주세요 ");
			}
			return false;
		}else{
			return true;
		}
	};
	
	//전체 체크하는 toggle checkebox
	/**
	 * allCheck == > checkbox 아이디
	 * TEMPL_ID 각각 checkbox class 
	 * 
	 * function toggleCheck(){
		$("#allCheck").bmtToggleCheck(".TEMPL_ID"); 
		}
	 */
	$.fn.bmtToggleCheck = function (checked_id){
		this.attr("checked") ? $(checked_id).attr("checked","checked") :$(checked_id).attr("checked",false);
	};
	
	/**
	 * last 인자는 마지막에 구분자를 할건지 결정 true이면 구분자 사용하지 않음
	 * userid#userid#
	 */
	$.fn.bmt_MakeSpecific = function ( specific , last){
		var specificStr="";
		var len = $(this).length;
		
		 $(this).each(function (index) {
			 
			 if(last){ 
				 if( len == index+1){
					 specificStr+= $(this).val();	 
				 }else{
					 specificStr+= $(this).val()+specific;
				 }  
			 }else{
				 specificStr+= $(this).val()+specific;
			 }
		});
		 
		 return specificStr;
	};
	/**
	 * last 인자는 마지막에 구분자를 할건지 결정 true이면 구분자 사용하지 않음 text값을 가져옴
	 * userid#userid#
	 */
	$.fn.bmt_MakeText = function ( specific , last){
		var specificStr="";
		var len = $(this).length;
		
		 $(this).each(function (index) {
			 
			 if(last){ 
				 if( len == index+1){
					 specificStr+= $(this).text();	 
				 }else{
					 specificStr+= $(this).text()+specific;
				 }  
			 }else{
				 specificStr+= $(this).text()+specific;
			 }
		});
		 
		 return specificStr;
	};
	/**
	 * 동일 이름 radiobox 체크 유효성체크 
	 * if(!$("input[name=pop_tmp]").radioChecked("템플릿종류를 선택하세요")){
			return;
		}
	 */
	$.fn.radioChecked = function (msg){
		var checked=true;
		this.each(function(){  
			 
			if($(this).attr("checked")){  
				checked=false;
				return false;	
			} 
		});
		if(checked){  
			if(msg){
				alert(msg); 
			}else{
				alert("삭제 할 회원을 선택해 주세요 ");
			}
			return false;
		}else{
			return true;
		}
	};
	
	
	/**
	 * 동일 이름 text 체크 유효성체크 
	 * if(!$(".class").textvalue("내용을 입력하세요")){
			return;
		}
	 */
	$.fn.textvalue = function (msg){
		var value =""; 
		this.each(function(){  
			value = $(this).val();
			if("" == value){
				value="";
				return false;
			}
		});
		
		if("" == value){  
			if(msg){
				alert(msg); 
			}else{
				alert("삭제 할 회원을 선택해 주세요 ");
			}
			return false;
		}else{
			return true;
		}
	};
	
	
	$.fn.bmt_TempData = function ( specific){
		var specificStr="";
		
		$("input[type=text]", this).val("임시 데이터  입니다.");
		$("textarea",this).val("내용입니다."); 
		$("option:eq(1)" ,this).attr('selected','true');
		
		$("input[type=radio]").attr("checked","true");
		$("input[type=checkbox]").attr("checked","true"); 
	};
	 
	
	$.fn.bmt_modal = function(title, width, height){
		$(this).dialog({ 
			autoOpen: false, 
			modal: true,
			bgiframe: true,
			width: width,
			height: height,
			resizable:false,
			title: title,
			buttons: {
				/* 
				'닫기': function(){
					$(this).dialog('close');
					}
				 */
				}
		}); 
	};
	
	/**
	 * jquery 달력 추가 인자는 날짜 포맷
	 * yy-mm-dd ,yy-mm(기본)
	 */
	$.fn.bmt_datepicker = function (p_dateFormat){
		var dateFormat=p_dateFormat || "yy-mm";
		$(this).datepicker({
			   monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			   dayNamesMin: ['일','월','화','수','목','금','토'],
			   weekHeader: 'Wk',
			   dateFormat: dateFormat, //형식(2012-03-03)
			   autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
			   changeMonth: true, //월변경가능
			   changeYear: true, //년변경가능
			   showMonthAfterYear: true, //년 뒤에 월 표시
			   buttonImageOnly: false, //이미지표시
			   showButtonPanel: true, 
			   buttonImage: '/js/dev/jquery/calendar.png', //이미지주소
			   showOn: "focus" //엘리먼트와 이미지 동시 사용 
			  }); 
	};
	
	
	$.fn.bmt_disabled = function (){
		this.attr("disabled","disabled");
		this.hide();
	};
	$.fn.bmt_abled = function (){
		this.removeAttr("disabled");
		this.show();
	};
	
	$.fn.bmtTextSum = function(msg){
		 
		var checked=true;
		var total_sum=0;
		this.each(function(){  
			total_sum+=Number($(this).text().replace(/,/gi,""));
		});
		 return total_sum;
	};
})(jQuery);