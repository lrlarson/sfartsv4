<!DOCTYPE html>
<html>
  <head>
  <cfparam name="disp" default="3">
  <cfajaxproxy cfc="sfarts" jsclassname="sfarts">
  
  <script type="text/javascript" src= "http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
  <cfscript>
	sfartsData = CreateObject("Component","sfarts");
	sfartsData.init();
	currentDate = now();
	</cfscript>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">

    
    </style>
    
 
 
      <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDeAoBiPUncBuyH5-efc2csHqJcAHIn50E&sensor=true">
	</script>
   
    <script src="js/latlon.js"></script>
    <script src="js/geo.js"></script>
   
    <script type="text/javascript">
	
	var myGlobalLocation = '';
	var globalTestLocation = '';
	
	
	function getLocation(){
  if (navigator.geolocation)
    {
    navigator.geolocation.getCurrentPosition(showPosition);
	//alert('good');
    }
  else{alert('This browser does not support location services');
  	}
  }
	<cfoutput>
	var getTodaysEvents = function(currentDate,currentDate){
					var sfartsProxy = new sfarts();
						sfartsProxy.setCallbackHandler(getTodaysEventsReturn);
						sfartsProxy.setErrorHandler(myErrorHandler); 
						sfartsProxy.getMasterEventsByDate(currentDate,currentDate);
						
	}
	</cfoutput>
	

	
	var getTodaysEventsReturn = function(eventReturn){
		var finalArray = new Array();
		//document.write(myGlobalLocation);
		cleanEvents = eventReturn.DATA;
		//get reference point
		var p1 =new LatLon(Geo.parseDMS(myGlobalLocation.lat()),Geo.parseDMS(myGlobalLocation.lng()));
		if (cleanEvents.length > 0){
		for(i=0;i<cleanEvents.length;i++){
			 var p2 =new LatLon(Geo.parseDMS(cleanEvents[i][28]),Geo.parseDMS(cleanEvents[i][29]));
			 var instanceDistance =	kiloconv(p1.distanceTo(p2));
			 //remove distance test ---
			 //if (instanceDistance < .5){
			 //document.write(instanceDistance + '  miles<br />');
			 finalArray.push(cleanEvents[i]);
			 //document.write(finalArray.length + '<br />');
			  x = finalArray.length;
			  finalArray[x-1][30] = instanceDistance;
			  document.write(finalArray[x-1][30]+'instance distance for '+i+'<br />');
			 //}else{
				//document.write(i+'<br />');
			 //}
			}
			document.write(finalArray.length+ ' final length of final array <br />');
			finalArray.sort(function(a, b){
			return parseFloat(a[30]) > parseFloat(b[30])?1:-1;	
			});
			for(i=0;i<finalArray.length;i++){
			document.write(finalArray[i][30] + '<br />');
			}
		}else{
		document.write('no events');	
		}
		  	
	}
	
	function showPosition(position)
			  {
				var myLocation = new google.maps.LatLng(37.779789,-122.418812)//city hall temp value
				//var myLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
				  var myLatlng = new google.maps.LatLng(40.650429,-73.950348);
				  myGlobalLocation = myLocation;
				  globalTestLocation = myLatlng;
				  <cfoutput>
				  getTodaysEvents('#dateformat(currentDate,"mm/DD/YY")#','#dateformat(currentDate,"mm/DD/YY")#');
		  		</cfoutput>
		  	 
		
   
	  }
	  
	  function kiloconv(val){

	var distance=((val* 0.621)).toFixed(2);
	return distance;

}
			  
			  
      function initialize() { 
	  	  getLocation();
		   
	  }
	  
	  // Error handler for the asynchronous functions. 
            var myErrorHandler = function(statusCode, statusMsg) 
            { 
                alert('Status: ' + statusCode + ', ' + statusMsg); 
            } 
	
    </script>
  </head>
  <body >
  <!---
  <div data-role="page" data-theme="b" class="page-map" style="width:100%; height:100%;">
	<div data-role="header"><h1>Map Page</h1></div>
	<div data-role="content"><p><a href="mapDisplay.cfm">Map</a></p></div>
	</div>
</div>--->

  </body>
  <cfoutput>
  <script type="text/javascript">
	$(document).ready(function(e) {	
     initialize();
	    });
	</script>
    </cfoutput>
  
</html>
