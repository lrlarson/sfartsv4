<!DOCTYPE html>
<html>
  <head>
  <cfparam name="event_num" default="10001">
  <cfscript>
	sfartsData = CreateObject("Component","sfarts");
	sfartsData.init();
	mapData = sfartsData.getLatLonByEvent_Num(event_num);
	</cfscript>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">

      html { height: 50% }
      body { height: 100%; margin: 0; padding: 0 }
      #map_canvas { height: 100% }

    </style>
    <script type="text/javascript"
      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDeAoBiPUncBuyH5-efc2csHqJcAHIn50E&sensor=true">
    </script>
    <script type="text/javascript">
	function getLocation()
  {
  if (navigator.geolocation)
    {
    navigator.geolocation.getCurrentPosition(showPosition);
	//alert('good');
    }
  else{alert('This browser does not support location services');
  	}
  }
	
	function showPosition(position)
			  {
				var myLatlng2 = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
				  
			  	var myLatlng = new google.maps.LatLng(40.650429,-73.950348);
		  
		  
		  
			  var mapOptions = {
				zoom: 12,
				center: myLatlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			  }
			  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
			
			  var marker = new google.maps.Marker({
				  position: myLatlng,
				  map: map,
				  title:"Hello World!"
			  });
			  var marker = new google.maps.Marker({
			  position: myLatlng2,
			  map: map,
			  title:"Your location"
  });	 


   
	  }
			  
			  
      function initialize() { 
	  	  getLocation();
	  }
    </script>
  </head>
  <body onload="initialize()">
    <div id="map_canvas" style="width:100%; height:100%"></div>
  </body>
</html>
