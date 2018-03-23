// JavaScript Document
function show_img_sub(obj,num,total){
	var max = document.getElementsByName(total);	
	for(var i=1 ; i<=max.length ; i++){
		var txt = max[i-1].src;
		var lastIndex = txt.lastIndexOf("_");
		if(i == num){
			if(txt.substring(lastIndex+1) != '.gif'){
				document.getElementById(obj+i).style.display = 'block';
				max[i-1].src = max[i-1].src.replace(".gif","_.gif");
			}
		}
		else {
				document.getElementById(obj+i).style.display = 'none';
				max[i-1].src = max[i-1].src.replace("_.gif",".gif");
		}
	}
}