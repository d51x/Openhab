(function(s) {
	var res = s; //Kb
	res = res / 1024; //Mb
	if ( res < 1024) {
		return res.toFixed(1) + " Mb";
	}
	res = res / 1024; //Gb
	return res.toFixed(1) + " Gb";

}) (input)