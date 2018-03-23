function swfView(width, height, url,title){
	document.write("<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' title='"+title+"'");
	document.write("codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0' ");
	document.write("width='"+width+"' height='"+height+"' align='middle'>");
	document.write("<param name='allowScriptAccess' value='always' /> ");
	document.write("<param name='movie'				value='"+url+"' /> ");
	document.write("<param name='quality'			value='high' /> ");
	document.write("<param name='wmode'				value='transparent'> ");
	document.write("<embed src='"+url+"' wmode='transparent' quality='high' width='"+width+"' height='"+height+"' align='middle' ");
	document.write("allowScriptAccess='sameDomain' type='application/x-shockwave-flash' ");
	document.write("pluginspage='http://www.macromedia.com/go/getflashplayer' />");
	document.write("</object>");

}