

//favorite

	 var fav_wrap;
	 var fav_wrap_div;
	 var fav_count=0;
	 
	function  fav_func(wrap){
			fav_wrap=jQuery("div."+wrap);
			fav_wrap_div=fav_wrap.find(">div");
		 //var fav_bt=favor_wrap.find(">a");

	}
		function fav_left(){
			if(fav_count>0){
				fav_wrap_div.hide();
				fav_count--;
				fav_wrap_div.eq(fav_count).show();
			}
		}
		function fav_right(){
			if(fav_count<1){
				fav_wrap_div.hide();
				fav_count++;
				fav_wrap_div.eq(fav_count).show();
			}
		}

jQuery(function(){ jQuery("#favor_02").hide();});




// auto scroll 배너 관련 

var move_ul=''; // ul
var bann_li=''; // li 
var bann_li_size=0; // 갯수
var bann_li_width=0; // 1개 width값
var pos=0; // left 위치값
var bann_arr=[]; //width 값 지정 배열
var total_width=0;
var check=0;
var total=0;
var tot_mar=0;
var direc_num=0;
var init_po=-1110;
//배너 초기화
function bann_init(){
	move_ul= jQuery("div#list > ul");
	move_ul.parent().css("left","15px");
	//alert(move_ul.size());
	move_ul.css({"width":"10000px","position":"absolute"});
	bann_li=move_ul.find(">li");
	bann_li_size=bann_li.size(); // 갯수
	bann_li_width=bann_li.width(); // 1개 width값 111px

	bann_li.each(function(n){
		bann_arr[n]=$(this).width();
		total_width +=bann_arr[n];	
		tot_mar-=12;	
	});
	clone_li();
	clone_li();
	total =total_width+tot_mar;
	move_ul.attr("timer", setInterval(bann_move, 40));
	bann_hover(0);
	pos=(total_width*-1)-tot_mar;
	//alert(pos);

//focus 제어 추가
bann_li.children().focus(bn_skip);
jQuery("#wrap > a.prev").focus(mv_left);
jQuery("#wrap > a.next").focus(mv_right);

}

// hover 기능
function bann_hover(d_num){	
		move_ul.hover(function(){
			clearInterval(move_ul.attr("timer"));
		},function(){
			if(d_num==0){
				clearInterval(move_ul.attr("timer"));
				move_ul.attr("timer", setInterval(bann_move,40));	
				}else{
				clearInterval(move_ul.attr("timer"));
				move_ul.attr("timer", setInterval(mv_right,40));	
			}
			
		});
}

// 배너 복사
function clone_li(){
	for(i=0;i <=bann_li_size;i++){
		bann_li.eq(i).clone().appendTo(jQuery("div#list > ul"));
	}
}

// 왼쪽으로 동작
function bann_move(){
	if(pos >= total*-2){
		move_ul.css({"left":pos});
		pos-=1;
	}else{
		pos=(total_width*-1)-tot_mar;
	}
}

// 오른쪽으로 동작
function mv_right2(){
		if(pos<=0){
			pos+=1;
			move_ul.css({left:pos});
		}else{
			
			pos=(total_width*-1)-tot_mar;
		}
}

// 왼쪽제어
function mv_left(){
	bann_hover(0);
	direc_num=0;
	bn_play();
}

// 오른쪽제어
function mv_right(){
	jQuery("div#list > ul > li > a").focus(bn_skip);
	bann_hover(1);
	direc_num=1;
	bn_play();
}

//중지
function bn_skip(){
		clearInterval(move_ul.attr("timer"));
}

//재생
function bn_play(){
		clearInterval(move_ul.attr("timer"));
		if(direc_num==0){
			move_ul.attr("timer", setInterval(bann_move, 40));
		}else if(direc_num==1){
			move_ul.attr("timer", setInterval(mv_right2, 40));
		}
}




