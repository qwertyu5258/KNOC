//Element ID 
function dEI(elementID){
	return document.getElementById(elementID);
}


// layer display
function layerDis(layerID){
	var tlayer = dEI(layerID);
	if(tlayer.style.display != "block"){
		tlayer.style.display = "block";
		//$("#tabBoard").hide();
		//$("#oil_price").hide();
		//$("#main_select").hide();
		//$("#popup_zone").hide();
		//$("#pr_room").hide();
		//$("#display").hide();
		
	}else if(tlayer.style.display != "none"){
		tlayer.style.display = "none";
		//$("#tabBoard").show();
		//$("#oil_price").show();
		//$("#main_select").show();
		//$("#popup_zone").show();
		//$("#pr_room").show();
		//$("#display").show();
	}else{
		tlayer.style.display = "none";
	}
}
 
function layerClose(layerID){
	layerDis(layerID);
		
}


