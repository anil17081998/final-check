function validation() {
	var title = document.forms["movielist"]["movname"].value;
	if(title=="") {
		alert("Title Required");
		return false;
	}
	if((title.length < 2) || (title.length > 100)) {
		alert("Title should have 2 to 100 characters");
		return false;
	}
	var box = document.forms["movielist"]["gross"].value;
	if(box=="") {
		alert("Gross is required");
		return false;
	}
	if(/[^0-9]/.test(box)) {
		alert("Gross has to be a number");
		return false;
	}
	var date = document.forms["movielist"]["launch"].value;
	if(date=="") {
		alert("Date of Launch is required");
		return false;
	}
	var gen = document.forms["movielist"]["catogory"].value;
	if(gen=="") {
		alert("Select one genre");
		return false;
	}
	}
	