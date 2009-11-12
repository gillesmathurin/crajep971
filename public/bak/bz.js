function bzGetFlashPlayerBZE68A893E137F4B2B8388() {
	var div = document.getElementById('SWBZE68A893E137F4B2B8388');
	if (div) {
		div.innerHTML = '<p style="background-color:#ffffff;color:#000000;padding:1em;">Vous avez une ancienne version de Flash Player. <a href="http://www.adobe.com/go/getflash/" target="_top">Téléchargez Flash player.</a></p>';
	} else {
		alert("no SWBZE68A893E137F4B2B8388 div");
	}
}
function checkLocalWarning() {
	var path = _urlBZE68A893E137F4B2B8388.substring(0,8);
	if (path.match('file:\/\/\/')) {
		var element = document.getElementById('local-warning');
		element.style.display = '';
	}
}
function bzEmbedSWFBZE68A893E137F4B2B8388() {
	if (swfobject.hasFlashPlayerVersion("9.0.45")) {
		var flashvars = {
			swfId: "SWBZE68A893E137F4B2B8388",
			xmlPath: _urlBZE68A893E137F4B2B8388 + "bz.xml",
			imgPath: _urlBZE68A893E137F4B2B8388 + "img",
			urlType: "_top",
			showInfo: "1",
			themeMode: "2"
		};
		var params = {
			wmode: "transparent",
			allowscriptaccess: "always"
		};
		var attributes = {};
		swfobject.embedSWF(_urlBZE68A893E137F4B2B8388 + "bzAnimation.swf", "SWBZE68A893E137F4B2B8388", "754", "314", "9.0.45", false, flashvars, params, attributes);
		swfobject.addDomLoadEvent(checkLocalWarning);
	} else {
		swfobject.addDomLoadEvent(bzGetFlashPlayerBZE68A893E137F4B2B8388);
	}
}
bzEmbedSWFBZE68A893E137F4B2B8388();
