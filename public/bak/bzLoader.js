if( !_urlBZE68A893E137F4B2B8388 ) {
	var _urlBZE68A893E137F4B2B8388 = null;
	var scripts = document.getElementsByTagName("script");
	for( var i=0;i<scripts.length;i++ ) {
		var s = scripts[i];
		if( s.src && s.src.match(/bzLoader\.js/) ) {
			if (s.src.length>11) {
				_urlBZE68A893E137F4B2B8388 = s.src.substring(0,s.src.length-11);
			} else {
				_urlBZE68A893E137F4B2B8388 = "./";
			}
		}
	}
}
var _scriptsBZE68A893E137F4B2B8388 = new Array();
_scriptsBZE68A893E137F4B2B8388[0] = 'swfobject.js';
_scriptsBZE68A893E137F4B2B8388[1] = 'bz.js';
for( var i=0;i<_scriptsBZE68A893E137F4B2B8388.length;i++ ) {
	var urlC = _urlBZE68A893E137F4B2B8388+_scriptsBZE68A893E137F4B2B8388[i];
	document.write('<script type="text/javascript" src="'+ urlC +'"><\/script>');
}