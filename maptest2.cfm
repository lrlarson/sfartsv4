<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Main Page</title>
	
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0a1/jquery.mobile-1.0a1.min.css" />
	<script src="http://code.jquery.com/jquery-1.4.3.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.0a1/jquery.mobile-1.0a1.min.js"></script>
</head>
<body>
	<div data-role="page">
		<div data-role="header"><h1>Main Page</h1></div>
		<div data-role="content"><p><a href="mapDisplay2.cfm">Map</a></p></div>
	</div>
	<script type="text/javascript"     src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDeAoBiPUncBuyH5-efc2csHqJcAHIn50E&sensor=true"></script>
	<script type="text/javascript">
		// When map page opens get location and display map
		$('.page-map').live("pagecreate", function() {
			//alert('pagecreate started');
			if(navigator.geolocation) {
				//alert('inside navigator');
				navigator.geolocation.getCurrentPosition(function(position){
					//alert('inside getCurrentPosition' + ' '+ position.coords.longitude);
					initialize(position.coords.latitude,position.coords.longitude);
				//alert('pagecreate ran'+position.coords.latitude);
				});
			}
		});
		
		function initialize(lat,lng) {
			
			//alert('insiade initialize');
			var latlng = new google.maps.LatLng(lat, lng);
			//alert('this should be lat long' +latlng);
			var myOptions = {
				zoom: 8,
				center: latlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP
		    };
		    var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
		}
	</script>
</body>
</html>
