if( !_urlBZ75F561CD344942C392BA ) {
	var _urlBZ75F561CD344942C392BA = null;
	var scripts = document.getElementsByTagName("script");
	for( var i=0;i<scripts.length;i++ ) {
		var s = scripts[i];
		if( s.src && s.src.match(/bzLoader\.js/) ) {
			if (s.src.length>11) {
				_urlBZ75F561CD344942C392BA = s.src.substring(0,s.src.length-11);
			} else {
				_urlBZ75F561CD344942C392BA = "./";
			}
		}
	}
}
var _scriptsBZ75F561CD344942C392BA = new Array();
_scriptsBZ75F561CD344942C392BA[0] = 'swfobject.js';
_scriptsBZ75F561CD344942C392BA[1] = 'bz.js';
for( var i=0;i<_scriptsBZ75F561CD344942C392BA.length;i++ ) {
	var urlC = _urlBZ75F561CD344942C392BA+_scriptsBZ75F561CD344942C392BA[i];
	document.write('<script type="text/javascript" src="'+ urlC +'"><\/script>');
}