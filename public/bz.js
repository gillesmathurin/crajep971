function bzGetFlashPlayerBZ75F561CD344942C392BA() {
	var div = document.getElementById('SWBZ75F561CD344942C392BA');
	if (div) {
		div.innerHTML = '<p style="background-color:#ffffff;color:#000000;padding:1em;">Vous avez une ancienne version de Flash Player. <a href="http://www.adobe.com/go/getflash/" target="_top">Téléchargez Flash player.</a></p>';
	} else {
		alert("no SWBZ75F561CD344942C392BA div");
	}
}
function checkLocalWarning() {
	var path = _urlBZ75F561CD344942C392BA.substring(0,8);
	if (path.match('file:\/\/')) {
		var element = document.getElementById('local-warning');
		element.style.display = '';
	}
}
function bzEmbedSWFBZ75F561CD344942C392BA() {
	if (swfobject.hasFlashPlayerVersion("9.0.45")) {
		var flashvars = {
			swfId: "SWBZ75F561CD344942C392BA",
			xmlPath: _urlBZ75F561CD344942C392BA + "bz.xml",
			imgPath: _urlBZ75F561CD344942C392BA + "img",
			urlType: "_top",
			showInfo: "1",
			themeMode: "2"
		};
		var params = {
			wmode: "transparent",
			allowscriptaccess: "always"
		};
		var attributes = {};
		swfobject.embedSWF(_urlBZ75F561CD344942C392BA + "bzAnimation.swf", "SWBZ75F561CD344942C392BA", "755", "315", "9.0.45", false, flashvars, params, attributes);
		swfobject.addDomLoadEvent(checkLocalWarning);
	} else {
		swfobject.addDomLoadEvent(bzGetFlashPlayerBZ75F561CD344942C392BA);
	}
}
bzEmbedSWFBZ75F561CD344942C392BA();
