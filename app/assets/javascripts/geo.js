function getGeo() {
	// Check to see if the browser supports the GeoLocation API.
	if (navigator.geolocation) {
		var options = {
		  enableHighAccuracy: true,
		  timeout: 5000,
		  maximumAge: 0
		};
		
		function error(err) {
		  console.warn('ERROR(' + err.code + '): ' + err.message);
		};
		
		// Get the location
		navigator.geolocation.getCurrentPosition(function(position) {
			var lat = position.coords.latitude;
			var lon = position.coords.longitude;

			document.getElementById("lat").value = lat;
			document.getElementById("lon").value = lon;
		}, error, options);
	} else {
		// Print out a message to the user.
		document.write('Your browser does not support GeoLocation :(');
	}
}