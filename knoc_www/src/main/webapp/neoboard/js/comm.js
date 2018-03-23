function CheckLen()
{
	f = document.commentform;
	var t;
	var msglen;
	msglen = 0;
	l = f.comment.value.length;

	savedLength = Number(f.savedLength.value);
	savedByteLength = Number(f.savedByteLength.value);

	if (savedLength > l)
	{
		for(k=0;k<l;k++){
			t = f.comment.value.charAt(k);
			if (escape(t).length > 4)
				msglen += 2;
			else
				msglen++;
		}

		f.savedLength.value = l;
		f.savedByteLength.value =  msglen;
	}
	else
	{
		for(k= savedLength ;k<l;k++){
			t = f.comment.value.charAt(k);
			if (escape(t).length > 4)
			{
				msglen += 2;
			}
			else
			{
				msglen ++;
			}
		}

		msglen = msglen + savedByteLength;

		f.savedLength.value = l;
		f.savedByteLength.value =  msglen;

	}


	if (msglen > 500) {
	  reserve = msglen-500;
	  alert("500¹ÙÀÌÆ®  ÀÌ»óÀº ÀÛ¼ºÇÏ½Ç¼ö ¾ø½À´Ï´Ù.\r\n ¾²½Å ³»¿ëÀº "+reserve+"¹ÙÀÌÆ®°¡ ÃÊ°úµÇ¾ú½À´Ï´Ù.");
	  cutText();
	  document.all.contlength.innerText= '500';
	  return;
	}

	document.all.contlength.innerText=msglen;
}
function CheckLength()
{
	var f = document.commentform;
	var t;
	var msglen;
	msglen = 0;
	l = f.comment.value.length;

	for(k=0;k<l;k++){
		t = f.comment.value.charAt(k);
		if (escape(t).length > 4)
			msglen += 2;
		else
			msglen++;
	}

    return msglen;
}
function nets_check(aquery){
	var tmpStr;
	var temp=0;
	var onechar;
	var tcount;
	
	tcount = 0;
	tmpStr = new String(aquery);
	temp = tmpStr.length;

	for(k=0;k<temp;k++){
		onechar = tmpStr.charAt(k);
		if(escape(onechar).length > 4)
			tcount += 2;
		else if(onechar!='\r')
			tcount++;
		if(tcount > 4000){
			tmpStr = tmpStr.substring(0,k);
			break;
		}
	}
	document.commentform.comment.value = tmpStr;	 
 }

 function cutText(){
  	nets_check(document.commentform.comment.value);
 }
 
 function popFaq(num,bid) {
 	window.open("/neoboard/pop_faq.jsp?num="+num+"&bid="+bid,'faq','width=600, height=550,scrollbars=no');
}

function popLog(num,bid) {
 	window.open("/neoboard/pop_log.jsp?num="+num+"&bid="+bid,'log','width=695, height=500,scrollbars=no');
}
function popMail(num,bid) {
 	window.open("/neoboard/pop_mail.jsp?num="+num+"&bid="+bid,'mail','width=600, height=550,scrollbars=no');
}
function popPrint() {
 	window.open('/neoboard/pop_print.jsp','print','width=700, height=340,scrollbars=yes');
 	//MM_openBrWindow('popup_sub03_05_print_view.jsp','','width=680, height=340,scrollbars=no')
}
function popMap(num,bid,feature) {
	window.open("/neoboard/pop_map.jsp?num="+num+"&bid="+bid,'map',feature);
}

function boardrss(val){
	copyit(val);
	alert("RSS ÁÖ¼Ò°¡ º¹»ç µÇ¾ú½À´Ï´Ù.");
}
function copyit(theField) { 
	var tempval=eval("document.all."+theField)  
	therange=tempval.createTextRange() 
	therange.execCommand("Copy") 
}



/** À¯È¿¼º °Ë»ç ·çÆ¾ **/
function MC_eregNumeric(str){
	var reg = RegExp("^[0-9\.]+$");
	return reg.test(str);	
}
function MC_eregAlpha(str) {
	var reg = RegExp("^[a-zA-Z]+$");
	return reg.test(str);
}
function MC_eregEmail(str) {
	var reg = RegExp("^[0-9\.a-zA-Z\-]+@[0-9\.a-zA-Z\-]+\.[a-zA-Z\.]");
	return reg.test(str);
}
function MC_eregAlphaNumeric(str){
	var reg = RegExp("^[0-9\.a-zA-Z]+$");
	return reg.test(str);
}
function MC_eregKorean(str) {
	var reg = RegExp("^[°¡-ÆR0-9 ]+$");
	return reg.test(str);
}
function MC_eregID(str){
	var reg = RegExp("^[a-zA-Z0-9\_]{4,18}$");
	return reg.test(str);
}
function MC_eregPhone(str){
	var reg = RegExp("^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$");
	return reg.test(str);
}
