
var xmlHttp = false;
var e;
function getXMLHTTPObj() {
	var obj = null;
	try {
		obj = new ActiveXObject("Msxml2.XMLHTTP");
	}
	catch (e) {
		try {
			obj = new ActiveXObject("Microsoft.XMLHTTP");
		}
		catch (ee) {
			obj = null;
		}
	}
	if (!obj && typeof XMLHttpRequest != "undefined") {
		obj = new XMLHttpRequest();
	}
	return obj;
}

