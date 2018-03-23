<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link rel="stylesheet" type="text/css" href="/survey/survey.css" />
<title>한국석유공사 설문</title>
<script type="text/javascript" src="/include/jquery.js"></script>

<script type="text/javascript"> 
function checkInput(p_name){
	
	$('input:radio[name='+p_name+']').attr("checked", "");
	
}


function goSubmit(){
	//객관식
	var radioChecks = ['a1', 'a3', 'a5', 'a6', 'a7', 'c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'c7', 'c8', 'c9'];	
	//주관식
	var inputChecks = ['b8', 'b9', 'b10'];
	
	//객,주관식
	var radioChecks2 = ['a2', 'a4'];
	var inputChecks2 = ['b2', 'b4'];
	
	if($('#user_id').val() == ''){
		alert('아이디를 입력해 주세요.');
		return;
	}
	
	
	for(var i=0; i<radioChecks.length; i++){

		if(!$(':input:radio[name='+radioChecks[i]+']:checked').val()) {
			alert('설문문항에 모두 답하셔야합니다.');
			$('input:radio[name='+radioChecks[i]+']').focus();			
			return;
		}		
	}
	
	
	
	for(var i=0; i<inputChecks.length; i++){		
		if($('input:text[name='+inputChecks[i]+']').val() == ""){			
			alert('설문문항에 모두 답하셔야합니다.');
			$('input:text[name='+inputChecks[i]+']').focus();			
			return;
		}
	}
	
	
	for(var i=0; i<inputChecks2.length; i++){		
		if($('input:text[name='+inputChecks2[i]+']').val() == "" && !$(':input:radio[name='+radioChecks2[i]+']:checked').val()){			
			alert('설문문항에 모두 답하셔야합니다.');			
			$('input:text[name='+inputChecks2[i]+']').focus();			
			return;
		}
	}
	
	
	//a1
	if($(':input:radio[name=a1]:checked').val() == 1 || $(':input:radio[name=a1]:checked').val() == 2 || $(':input:radio[name=a1]:checked').val() == 3){
		$('input:text[name=b1_2]').attr("value", "");
		if($('input:text[name=b1_1]').val() == "" && !$(':input:radio[name=a1_1]:checked').val()){			
			alert('설문문항에 모두 답하셔야합니다.');			
			$('input:text[name=b1_1]').focus();		
			
			return;
		}
	}else{
		$('input:radio[name=a1_1]').attr("checked", "");
		$('input:text[name=b1_1]').attr("value", "");
		if($('input:text[name=b1_2]').val() == ""){			
			alert('설문문항에 모두 답하셔야합니다.');
			$('input:text[name=b1_2]').focus();			
			return;
		}
	}
	
	//c2
	if($(':input:radio[name=c2]:checked').val() == 1 || $(':input:radio[name=c2]:checked').val() == 2 || $(':input:radio[name=c2]:checked').val() == 3){
		$('input:radio[name=c2_2]').attr("checked", "");
		$('input:text[name=d2_2]').attr("value", "");
		if($('input:text[name=d2_1]').val() == "" && !$(':input:radio[name=c2_1]:checked').val()){			
			alert('설문문항에 모두 답하셔야합니다.');			
			$('input:text[name=d2_1]').focus();		
			
			return;
		}
	}else{
		$('input:radio[name=c2_1]').attr("checked", "");
		$('input:text[name=d2_1]').attr("value", "");
		if($('input:text[name=d2_2]').val() == "" && !$(':input:radio[name=c2_2]:checked').val()){			
			alert('설문문항에 모두 답하셔야합니다.');			
			$('input:text[name=d2_2]').focus();		
			
			return;
		}
	}
	//c3
	if($(':input:radio[name=c3]:checked').val() == 1 || $(':input:radio[name=c3]:checked').val() == 2 || $(':input:radio[name=c3]:checked').val() == 3){
		$('input:radio[name=c3_2]').attr("checked", "");
		$('input:text[name=d3_2]').attr("value", "");
		if($('input:text[name=d3_1]').val() == "" && !$(':input:radio[name=c3_1]:checked').val()){			
			alert('설문문항에 모두 답하셔야합니다.');			
			$('input:text[name=d3_1]').focus();		
			
			return;
		}
	}else{
		$('input:radio[name=c3_1]').attr("checked", "");
		$('input:text[name=d3_1]').attr("value", "");
		if($('input:text[name=d3_2]').val() == "" && !$(':input:radio[name=c2_2]:checked').val()){			
			alert('설문문항에 모두 답하셔야합니다.');			
			$('input:text[name=d3_2]').focus();		
			
			return;
		}
	}
	
	//c4
	if($(':input:radio[name=c4]:checked').val() == 1 || $(':input:radio[name=c4]:checked').val() == 2 ){
		if($('input:text[name=d4_1]').val() == "" && !$(':input:radio[name=c4_1]:checked').val()){			
			alert('설문문항에 모두 답하셔야합니다.');			
			$('input:text[name=d4_1]').focus();		
			
			return;
		}
	}else{
		$('input:radio[name=c4_1]').attr("checked", "");
		$('input:text[name=d4_1]').attr("value", "");		
	}
	
	
	if($('#area').val() == ''){
		alert('설문문항에 모두 답하셔야합니다.');			
		$('#area').focus();			
		return;
	}
	if(confirm("설문에 참여 하시겠습니까?")){
		$('#form01').submit();
	}
	
}


function checkRideo(p_id){
	$('input:text[name='+p_id+']').attr("value", "");
}

function questionView(p_no){
	if(p_no == 1){
		$("#question1").show();
		$("#question2").hide();
	}else{
		$("#question2").show();
		$("#question1").hide();
	}	
}

function questionView2(p_no){
	if(p_no == 1){
		$("#question_1_1").show();
		$("#question_1_2").hide();
	}else{
		$("#question_1_2").show();
		$("#question_1_1").hide();
	}	
}

function questionView3(p_no){
	if(p_no == 1){
		$("#question_2_1").show();
		$("#question_2_2").hide();
	}else{
		$("#question_2_2").show();
		$("#question_2_1").hide();
	}	
}

function questionView4(p_no){
	if(p_no == 1){
		$("#question_3_1").show();
		
	}else{
		$("#question_3_1").hide();
	}	
}
</script>
</head>
<body>
	
	<div id="wrap">		
		<div id="header">
			<div class="blind">
				<h1>설문 응답에 앞서</h1>
				<p>
					안녕하십니까? <br />
					한국석유공사는 석유의 안정적 공급을 통해 국민에게 희망과 편안함을 제공하는 정부투자기관입니다.
					본 설문지는 한국석유공사의 전체적인 이미지, 기업문화에 대한 의견수렴을 통해 우리 공사의 기업문화 발전방향을 모색하기 위해 쓰여질
					것입니다. <br /><br />
					한국석유공사 홍보실장
				</p>
			</div>
			<p>
				<img src="/survey/images/top_img.gif" alt="설문 응답에 앞서 안녕하십니까? 한국석유공사는 석유의 안정적 공급을 통해 국민에게 희망과 편안함을 제공하는 정부투자기관입니다. 
					본 설문지는 한국석유공사의 전체적인 이미지, 기업문화에 대한 의견수렴을 통해 우리 공사의 기업문화 발전방향을 모색하기 위해 쓰여질 것입니다.
					여러분의 의견과 아이디어가 공사의 발전에 중요한 기초 자료로 활용됩니다.
					아울러 동 설문지 내용에 대한 유출을 삼가하여 주실 것을 당부드립니다.
					감사합니다.
					한국석유공사 홍보실장" />
			</p>
		</div><!-- header end -->
		
		<hr />
<form action="/survey/surveyOk.jsp" id="form01" name="form01" method="post">		
		<div id="contents">
			<div class="user_id">
			<h3>아이디 확인</h3>
			<fieldset>
				<legend>아이디 확인</legend>
				
				<label for="user_id">
					설문 전 귀하의 카페 아이디를 적어 주세요<br />
					<span class="point">* 동 문항은 추후 선물 배포시 활용될 예정으로 정확히 기재해 주시기 바랍니다.</span>
				</label>
				<p><input type="text" id="user_id" name="user_id" maxlength="30" title="아이디를 입력해주세요" class="s_id" /></p> 
			</fieldset>
			</div><!-- user_id end -->
			
			<hr />
			
			<div class="brand_image">
			<h3>이미지조사 - 한국석유공사</h3>
			<fieldset>
				<legend>이미지조사 - 한국석유공사</legend>
				
				<h5>1. 한국 석유공사에 대해 잘 알고 있다.</h5>
				<p class="t_01">
					<input type="radio" name="a1" id="question_01_1" value="1" onclick="questionView(1)"/><label for="question_01_1">잘 알고 있다.</label> 
					<input type="radio" name="a1" id="question_01_2" value="2" onclick="questionView(1)"/><label for="question_01_2">알고 있다.</label>
					<input type="radio" name="a1" id="question_01_3" value="3" onclick="questionView(1)"/><label for="question_01_3">보통이다.</label>
					<input type="radio" name="a1" id="question_01_4" value="4" onclick="questionView(2)"/><label for="question_01_4">모른다.</label>
					<input type="radio" name="a1" id="question_01_5" value="5" onclick="questionView(2)"/><label for="question_01_5">전혀 모른다.</label>
				</p>
				<div id="question1" style="display: none">
				<h6>1_1. (위 문항에서 1-3번 선택 시) 어떤 경로를 통해 알게 되었나</h6>
				<p class="t_02">
					<input type="radio" name="a1_1" id="news" value="1" onclick="checkRideo('b1_1');"/><label for="news">일간지 신문</label> 
					<input type="radio" name="a1_1" id="tv" value="2" onclick="checkRideo('b1_1');"/><label for="tv">TV</label>
					<input type="radio" name="a1_1" id="internet" value="3" onclick="checkRideo('b1_1');"/><label for="internet">인터넷 기사</label>
					<input type="radio" name="a1_1" id="home" value="4" onclick="checkRideo('b1_1');"/><label for="home">공사 홈페이지</label>
					<input type="radio" name="a1_1" id="family" value="5" onclick="checkRideo('b1_1');"/><label for="family">가족 및 지인</label><br />
					<span class="etc"><label for="etc_01">기타</label> <input type="text" id="etc_01" title="기타" maxlength="30" class="s_etc" name="b1_1" onkeypress="checkInput('a1_1');" onkeydown="checkInput('a1_1');"/></span>
				</p>
				</div>
				<div id="question2" style="display: none">
				<h6>
					1_2. (1번 문항에서 4-5번 선택 시) 잘 모른다면 “한국석유공사” 하면 <br />
					가장 먼저 떠오르는 이미지는 무엇인지 적어 주시기 바랍니다.<span class="ex">(Ex. 시추선, 동해, 사막, 태극기, M&amp;A 등)</span>
				</h6>
				<p class="t_02"><input type="text" title="내용을 적어주세요" maxlength="100" class="s_cont" name="b1_2"/></p>
				</div>
				
				
				<h5>2. 한국 석유공사의 주요 사업분야는 무엇이라고 인식하고 있는지?</h5>
				<p class="t_01">
					<input type="radio" name="a2" id="re_01" value="1" onclick="checkRideo('b2')"/><label for="re_01">석유개발 기업</label> 
					<input type="radio" name="a2" id="re_02" value="2" onclick="checkRideo('b2')"/><label for="re_02">석유비축 기업</label>
					<input type="radio" name="a2" id="re_03" value="3" onclick="checkRideo('b2')"/><label for="re_03">유가정보 제공</label>
					<input type="radio" name="a2" id="re_04" value="4" onclick="checkRideo('b2')"/><label for="re_04">에너지 자금 대출</label><br />
					<span class="etc"><label for="etc_02">기타</label> <input type="text" id="etc_02" title="기타" maxlength="30" class="s_etc" name="b2" onkeypress="checkInput('a2');" onkeydown="checkInput('a2');"/></span>
				</p>
				
				
				<h5>3. 공기업인 한국석유공사가 가장 시급하게 해야 할 일은 무엇이라고 생각하는지?</h5>
				<p class="t_01">
					<input type="radio" name="a3" id="urgent_01" value="1"/><label for="urgent_01">청년실업 해소에 기여</label> 
					<input type="radio" name="a3" id="urgent_02" value="2"/><label for="urgent_02">민간기업과 같은 수익 중심의 경영 체질 개선</label><br />
					<input type="radio" name="a3" id="urgent_03" value="3"/><label for="urgent_03">윤리경영에 입각한 사회적 이익 추구</label>
					<input type="radio" name="a3" id="urgent_04" value="4"/><label for="urgent_04">사회공헌 등 사회적 약자 지원</label>
				</p>
				
				<h5>4. 한국석유공사는 ‘국민에게 사랑 받는 세계적 국영석유회사’로의 성장을 추진 중 입니다. 국제적인 경쟁력을 갖추기 위해서 가장 우선적으로 해야 할 일은 무엇으로 생각하는지?</h5>
				<p class="t_01">
					<input type="radio" name="a4" id="growth_01" value="1" onclick="checkRideo('b4')"/><label for="growth_01">전문인력 및 기술력 확보</label> 
					<input type="radio" name="a4" id="growth_02" value="2" onclick="checkRideo('b4')"/><label for="growth_02">인수합병을 통한 대형화</label><br />
					<input type="radio" name="a4" id="growth_03" value="3" onclick="checkRideo('b4')"/><label for="growth_03">정부의 재정지원</label>
					<input type="radio" name="a4" id="growth_04" value="4" onclick="checkRideo('b4')"/><label for="growth_04">윤리경영 및 사회공헌</label><br />
					<span class="etc"><label for="etc_03">기타</label> <input type="text" id="etc_03" title="기타" maxlength="30" class="s_etc" name="b4" onkeypress="checkInput('a4');" onkeydown="checkInput('a4');"/></span>
				</p>
				
				
				<h5>5. 한국석유공사의 핵심가치는 도전, 전문가 정신, 배려, 공헌 입니다. 이 중에서도 공사와 가장 잘 부합한다고 생각하는 가치는?</h5>
				<p class="t_01">
					<input type="radio" id="value_01" name="a5" value="1"/><label for="value_01">도전</label> 
					<input type="radio" id="value_02" name="a5" value="2"/><label for="value_02">전문가 정신</label>
					<input type="radio" id="value_03" name="a5" value="3"/><label for="value_03">배려</label>
					<input type="radio" id="value_04" name="a5" value="4"/><label for="value_04">공헌</label>
				</p>
				
				<h5>6. 언론 매체를 통해 느끼는 한국석유공사 직원들에 대한 이미지는?</h5>
				<p class="t_01">
					<input type="radio" name="a6" id="image_01" value="1"/><label for="image_01">전문적이다</label> 
					<input type="radio" name="a6" id="image_02" value="2"/><label for="image_02">도전적이며 진취적이다</label><br />
					<input type="radio" name="a6" id="image_03" value="3"/><label for="image_03">보수적이며 관료적이다</label>
					<input type="radio" name="a6" id="image_04" value="4"/><label for="image_04">여느 공기업 직원 차이가 없어 잘 모르겠다</label>
				</p>
				
				<h5>7. 한국석유공사의 심볼은 고귀한 다이아몬드와 진취적으로 확산되는 빛을 상징하고 첨단 기술력을 나타내는 예리한 마름모골의 모양을 하고 있습니다. 일반 국내외 대기업들 심볼과 비교하여 개선했으면 하는 부분은?</h5>
				<p class="simbol"><img src="/survey/images/knoc_logo.gif" alt="simbol" /></p>
				<p class="t_01_img">
					<input type="radio" name="a7" id="simbol_01" value="1"/><label for="simbol_01">지금이 좋아서 개선할 필요가 없다</label> 
					<input type="radio" name="a7" id="simbol_02" value="2"/><label for="simbol_02">붉은 색감</label><br />
					<input type="radio" name="a7" id="simbol_03" value="3"/><label for="simbol_03">다이아몬드 모양</label>
					<input type="radio" name="a7" id="simbol_04" value="4"/><label for="simbol_04">색감/모양 모두</label>
				</p>
				
				<h5>
					8. 귀하께서 생각하는 “ 한국석유공사” 의 이미지 중에서 긍정적이라서 부각이 필요한 것이 있다면 적어주시기 바랍니다.<br />
					<span class="ex">(Ex. 도전적 기업, 에너지절약, 자주개발, 석유정보서비스, M&amp;A 등)</span>
				</h5>
				<p class="t_01"><input type="text" title="내용을 적어주세요" maxlength="100" class="s_cont" name="b8"/></p>
				
				<h5>
					9. 귀하께서 생각하는 “ 한국석유공사” 의 이미지 중에서 부정적이라서 바꾸고 싶은 것이 있다면 적어주시기 바랍니다.<br />
					<span class="ex">(Ex.관료주의, 석유고갈, 소규모, 지방이전 등)</span>
				</h5>
				<p class="t_01"><input type="text" title="내용을 적어주세요" maxlength="100" class="s_cont" name="b9"/></p>
				
				<h5>
					10. 한국석유공사와 가장 잘 어울리는 캐치프레이즈 아이디어를 적어주시기 바랍니다. *국문 또는 영어로 적어주시기 바랍니다.
				</h5>
				<p class="t_01"><input type="text" title="내용을 적어주세요" maxlength="100" class="s_cont" name="b10"/></p>
				
			</fieldset>
			
			</div><!-- brand_image end -->
			
			<hr />
			
			<div class="preference">
				<h3>선호도조사 - 한국석유공사</h3>
				<fieldset>
				<legend>선호도 조사 - 한국 석유공사</legend>
				
				<h5>1. 귀하의 학교(고등학교, 대학교, 대학원 etc) 전공은?</h5>
				<p class="t_01">
					<input type="radio" name="c1" id="major_01" value="1"/><label for="major_01">공대/자연대</label> 
					<input type="radio" name="c1" id="major_02" value="2"/><label for="major_02">법대/상대</label>
					<input type="radio" name="c1" id="major_03" value="3"/><label for="major_03">어문계열</label>
					<input type="radio" name="c1" id="major_04" value="4"/><label for="major_04">예체능 등 기타</label>
				</p>
				
				<h5>2. 한국석유공사는 유사 사기업(ex. 석유화학기업 등)들과 비교했을 때 ‘일하기 좋은 직장’이라고 생각한다.</h5>
				<p class="t_01">
					<input type="radio" name="c2" id="com_01" value="1" onclick="questionView2(1);"/><label for="com_01">매우 그렇다</label> 
					<input type="radio" name="c2" id="com_02" value="2" onclick="questionView2(1);"/><label for="com_02">그렇다</label>
					<input type="radio" name="c2" id="com_03" value="3" onclick="questionView2(1);"/><label for="com_03">보통이다</label>
					<input type="radio" name="c2" id="com_04" value="4" onclick="questionView2(2);"/><label for="com_04">그렇지 않다</label>
					<input type="radio" name="c2" id="com_05" value="5" onclick="questionView2(2);"/><label for="com_05">매우 그렇지 않다</label>
				</p>
				<div style="display: none;" id="question_1_1">
				<h6>2-1. (위 문항에서 1~3번 선택시) 그렇다고 생각하는 이유는?</h6>
				<p class="t_02">
					<input type="radio" name="c2_1" id="cause_01" value="1" onclick="checkRideo('d2_1')"/><label for="cause_01">직장 안정성</label> 
					<input type="radio" name="c2_1" id="cause_02" value="2" onclick="checkRideo('d2_1')"/><label for="cause_02">발전 가능성</label><br />
					<input type="radio" name="c2_1" id="cause_03" value="3" onclick="checkRideo('d2_1')"/><label for="cause_03">최근 취업 추세가 공기업이기 때문에</label>
					<input type="radio" name="c2_1" id="cause_04" value="4" onclick="checkRideo('d2_1')"/><label for="cause_04">국가 정책을 수행하는 자부심</label><br />
					<span class="etc"><label for="etc_04">기타</label> <input type="text" id="etc_04" title="기타" maxlength="30" class="s_etc" name="d2_1"/></span>
				</p>
				</div>
				<div style="display: none;" id="question_1_2">
				<h6>2-2. (위 문항에서 4~5번 선택시) 그렇지 않은 이유는 무엇인지?</h6>
				<p class="t_02">
					<input type="radio" name="c2_2" id="cause1_01" value="1" onclick="checkRideo('d2_2')"/><label for="cause1_01">인지도가 낮아서</label> 
					<input type="radio" name="c2_2" id="cause1_02" value="2" onclick="checkRideo('d2_2')"/><label for="cause1_02">자원개발 사업이 생소해서</label><br />
					<input type="radio" name="c2_2" id="cause1_03" value="3" onclick="checkRideo('d2_2')"/><label for="cause1_03">유사 사기업에 비해 급여/복지 수준이 낮을 것 같아서</label>
					<input type="radio" name="c2_2" id="cause1_04" value="4" onclick="checkRideo('d2_2')"/><label for="cause1_04">공기업들이 지방이전하기 때문에</label><br />
					<span class="etc"><label for="etc_05">기타</label> <input type="text" id="etc_05" title="기타" maxlength="30" class="s_etc" name="d2_2"/></span>
				</p>
				</div>
				
				
				<h5>3. 한국석유공사는 다른 공기업과 비교했을 때 ‘일하는 좋은 직장’, ‘입사하고 싶은 직장’ 이라고 생각한다.</h5>
				<p class="t_01">
					<input type="radio" name="c3" id="com1_01" value="1" onclick="questionView3(1);"/><label for="com1_01">매우 그렇다</label> 
					<input type="radio" name="c3" id="com1_02" value="2" onclick="questionView3(1);"/><label for="com1_02">그렇다</label>
					<input type="radio" name="c3" id="com1_03" value="3" onclick="questionView3(1);"/><label for="com1_03">보통이다</label>
					<input type="radio" name="c3" id="com1_04" value="4" onclick="questionView3(2);"/><label for="com1_04">그렇지 않다</label>
					<input type="radio" name="c3" id="com1_05" value="5" onclick="questionView3(2);"/><label for="com1_05">매우 그렇지 않다</label>
				</p>
			
				
				
				<div style="display: none;" id="question_2_1">
				<h6>3-1. (위 문항에서 1~3번 선택시) 어떤 이유에서 그렇다고 생각하나?</h6>
				<p class="t_02">
					<input type="radio" name="c3_1" id="cause2_01" value="1" onclick="checkRideo('d3_1')"/><label for="cause2_01">급여/복지제도가 좋을 것 같아서</label> 
					<input type="radio" name="c3_1" id="cause2_02" value="2" onclick="checkRideo('d3_1')"/><label for="cause2_02">해외근무 기회가 많아서</label>
					<input type="radio" name="c3_1" id="cause2_03" value="3" onclick="checkRideo('d3_1')"/><label for="cause2_03">기업문화가 젊을 것 같아서</label><br />
					<input type="radio" name="c3_1" id="cause2_04" value="4" onclick="checkRideo('d3_1')"/><label for="cause2_04">국가에 대한 기여도가 높아서</label>
					<input type="radio" name="c3_1" id="cause2_05" value="5" onclick="checkRideo('d3_1')"/><label for="cause2_05">능력만큼 대우받는 성과보상 방식이 좋아서</label><br />
					<span class="etc"><label for="etc_06">기타</label> <input type="text" id="etc_06" name="d3_1" title="기타" maxlength="30" class="s_etc" onkeypress="checkInput('c3_1');" onkeydown="checkInput('c3_1');"/></span>
				</p>
				</div>
				
				<div style="display: none;" id="question_2_2">
				<h6>3-2. (위 문항에서 4~5번 선택시) 그렇지 않은 이유는?</h6>
				<p class="t_02">
					<input type="radio" name="c3_2" id="cause3_01" value="1" onclick="checkRideo('d3_2')"/><label for="cause3_01">자원개발 및 비축 등 사업이 생소해서</label> 
					<input type="radio" name="c3_2" id="cause3_02" value="2" onclick="checkRideo('d3_2')"/><label for="cause3_02">타 공기업에 비해 급여/복지 수준이 낮아서</label><br />
					<input type="radio" name="c3_2" id="cause3_03" value="3" onclick="checkRideo('d3_2')"/><label for="cause3_03">해외근무가 싫어서</label>
					<input type="radio" name="c3_2" id="cause3_04" value="4" onclick="checkRideo('d3_2')"/><label for="cause3_04">능력만큼 대우받는 성과보상 방식이 피곤해서</label><br />
					<span class="etc"><label for="etc_07">기타</label> <input name="d3_2" type="text" id="etc_07" title="기타" maxlength="30" class="s_etc" onkeypress="checkInput('c3_2');" onkeydown="checkInput('c3_2');"/></span>
				</p>
				</div>
				
				<h5>4. 한국석유공사는 앞으로 발전가능성이 높은 기업이라고 생각한다.</h5>
				<p class="t_01">
					<input type="radio" name="c4" id="com2_01" value="1" onclick="questionView4(1);"/><label for="com2_01">매우 그렇다</label> 
					<input type="radio" name="c4" id="com2_02" value="2" onclick="questionView4(1);"/><label for="com2_02">그렇다</label>
					<input type="radio" name="c4" id="com2_03" value="3" onclick="questionView4(2);"/><label for="com2_03">보통이다</label>
					<input type="radio" name="c4" id="com2_04" value="4" onclick="questionView4(2);"/><label for="com2_04">그렇지 않다</label>
					<input type="radio" name="c4" id="com2_05" value="5" onclick="questionView4(2);"/><label for="com2_05">매우 그렇지 않다</label>
				</p>
				<div style="display: none;" id="question_3_1">
				<h6>4-1. (위 문항에서 1~2번 선택시) 발전 가능성이 높은 기업이라고 생각하는 이유는?</h6>
				<p class="t_02">
					<input type="radio" name="c4_1" id="com3_01" value="1" onclick="checkRideo('d4_1')"/><label for="com3_01">해외 진출 사업이 늘어나서</label> 
					<input type="radio" name="c4_1" id="com3_02" value="2" onclick="checkRideo('d4_1')"/><label for="com3_02">자원개발이라는 사업특성 때문에</label><br />
					<input type="radio" name="c4_1" id="com3_03" value="3" onclick="checkRideo('d4_1')"/><label for="com3_03">해외유학 등 발전기회가 많아서</label>
					<input type="radio" name="c4_1" id="com3_04" value="4" onclick="checkRideo('d4_1')"/><label for="com3_04">정부의 충분한 지원 때문에</label><br />
					<span class="etc"><label for="etc_08">기타</label> <input type="text" id="etc_08" title="기타" maxlength="30" class="s_etc" name="d4_1" onkeypress="checkInput('c4_1');" onkeydown="checkInput('c4_1');"/></span>
				</p>
				</div>
				
				<h5>5. 한국석유공사는 나의 역량을 개발하기 좋은 직장이라고 생각한다.</h5>
				<p class="t_01">
					<input type="radio" name="c5" id="com4_01" value="1"/><label for="com4_01">매우 그렇다</label> 
					<input type="radio" name="c5" id="com4_02" value="2"/><label for="com4_02">그렇다</label>
					<input type="radio" name="c5" id="com4_03" value="3"/><label for="com4_03">보통이다</label>
					<input type="radio" name="c5" id="com4_04" value="4"/><label for="com4_04">그렇지 않다</label>
					<input type="radio" name="c5" id="com4_05" value="5"/><label for="com4_05">매우 그렇지 않다</label>
				</p>
				
				<h5>6. 한국석유공사는 직원들에 대한 근무환경 (급여, 복지 등)이 좋다고 생각한다.</h5>
				<p class="t_01">
					<input type="radio" name="c6" id="com5_01" value="1"/><label for="com5_01">매우 그렇다</label> 
					<input type="radio" name="c6" id="com5_02" value="2"/><label for="com5_02">그렇다</label>
					<input type="radio" name="c6" id="com5_03" value="3"/><label for="com5_03">보통이다</label>
					<input type="radio" name="c6" id="com5_04" value="4"/><label for="com5_04">그렇지 않다</label>
					<input type="radio" name="c6" id="com5_05" value="5"/><label for="com5_05">매우 그렇지 않다</label>
				</p>
				
				<h5>7. 신입직원으로서 한국석유공사에 입사했을 경우 회사가 신입직원에게 배려해 주었으면 하는 부분은 어떤 것 입니까?</h5>
				<p class="t_01">
					<input type="radio" name="c7" id="com6_01" value="1" /><label for="com6_01">희망 보직 배치</label> 
					<input type="radio" name="c7" id="com6_02" value="2"/><label for="com6_02">직무관련 교육훈련</label><br />
					<input type="radio" name="c7" id="com6_03" value="3"/><label for="com6_03">직장 상사와의 친밀감</label>
					<input type="radio" name="c7" id="com6_04" value="4"/><label for="com6_04">개인 생활 인정 등 신입직원 가치 존중</label>
				</p>
				
				<h5>8. 정부에서는 중앙과 지방의 균형발전 취지아래 공공기관 지방이전을 추진 중이며 이에 따라 한국석유공사는 향후 ‘울산광역시’로 이전하여 공사의 새로운 시대를 열 계획입니다. 이에 귀하는 우리공사의 새 출발에 참여할 의사가 있는지?</h5>
				<p class="t_01">
					<input type="radio" name="c8" id="com7_01" value="1"/><label for="com7_01">있다</label> 
					<input type="radio" name="c8" id="com7_02" value="2"/><label for="com7_02">없다</label>
					<input type="radio" name="c8" id="com7_03" value="3"/><label for="com7_03">잘 모르겠다</label>
				</p>
				
				<h5>9. 한국석유공사는 공기업으로서 사회적 책임 완수를 위해 ‘소외이웃 돕기’, ‘지역사회 공헌’, ‘학술문화 진흥’, ‘해외사회 공헌’ 을 사회공헌 4대 핵심분야로 선정하여 나눔과 배려의 경영을 실현하고 있습니다. 이 중 한국석유공사가 공기업으로서 좀 더 강화해야 한다고 생각되는 부분은 어떤것지?</h5>
				<p class="t_01">
					<input type="radio" name="c9" id="com8_01" value="1"/><label for="com8_01">소외이웃 돕기(독거노인 등 소외계층 지원 등)</label> <br />
					<input type="radio" name="c9" id="com8_02" value="2"/><label for="com8_02">지역사회 공헌(지역 다문화 가정 지원 및 1사1촌 자매결연 등)</label><br />
					<input type="radio" name="c9" id="com8_03" value="3"/><label for="com8_03">학술문화 진흥(청소년 장학금 지원 등)</label><br />
					<input type="radio" name="c9" id="com8_04" value="4"/><label for="com8_04">해외사회 공헌(한국전쟁 참전 용사 후손 지원 및 태권도 시범 해외 지원 등)</label>
				</p>
				
				<h5>
					10. 마지막으로 “한국석유공사”에 하고 싶은 말 또는 바라는 바가 있다면 적어주시기 바랍니다.<br />
					<span class="ex">(Ex. 국민에 기대에 부응하는 Global 석유회사로서의 발전을 기대합니다.)</span>
				</h5>
				<p class="t_01">
					<textarea id="area" rows="0" cols="0" class="area" name="d10"></textarea>
				</p>
				
				</fieldset>
			</div><!-- preference end -->
			
			<!-- 버튼[start] -->
			<div align="center">
				<img src="/survey/images/btn_submit.gif" alt="확인" style="cursor:pointer;" onclick="goSubmit();"/ />
			</div>
			<!-- 버튼[end] -->
		</div><!-- contents end -->
</form>
	</div><!-- wrap end -->
	
</body>
</html>