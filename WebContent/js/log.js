//log.js

function log(msg) {
	var console = document.getElementById("debugConsole");

	if (console != null) {
		console.innerHTML += msg + "<br/>";
	}
}

function siri(msg){
	var console= document.getElementById('siriC');
	if(console!=null){
		console.innerHTML+=msg+"<br/>";
	}
}