(function(s) {
	var res = s; // bytes
	if ( res < 1024) {
		return res + " b";
	}
	res = res / 1024;  //Kb
	if ( res < 1024) {
		return res.toFixed(2) + " Kb";
	}	
	res = res / 1024; //Mb
	if ( res < 1024) {
		return res.toFixed(2) + " Mb";
	}
	res = res / 1024; //Gb
	return res.toFixed(2) + " Gb";

}) (input)