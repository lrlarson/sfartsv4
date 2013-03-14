<!doctype html>
<html>
<meta charset="UTF-8">
<title>Untitled Document</title>
<head>


</head>

<body>
<div data-role="page" id="todaysEventsList" data-add-back-btn="true">
<cfajaxproxy cfc="sfarts" jsclassname="sfarts">
<cfscript>
	sfartsData = CreateObject("Component","sfarts");
	sfartsData.init();
	currentDate = now();
</cfscript>
 
   
    <script src="js/latlon.js"></script>
    <script src="js/geo.js"></script>
   
    <script type="text/javascript">
	
	var myGlobalLocation = '';
	var globalTestLocation = '';
	var htmlContent = '';
	
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
		//alert('in DB call');
					var sfartsProxy = new sfarts();
						sfartsProxy.setCallbackHandler(getTodaysEventsReturn);
						sfartsProxy.setErrorHandler(myErrorHandler); 
						sfartsProxy.getMasterEventsByDateByDispLocation(currentDate,currentDate,13);
						//alert('called the function');
						//insert different calls here for different event classes
	}
	</cfoutput>
	

	
	var getTodaysEventsReturn = function(eventReturn){
		//alert('in return');
		var finalArray = new Array();
		//document.write(myGlobalLocation);
		cleanEvents = eventReturn.DATA;
		//get reference point
		var p1 =new LatLon(Geo.parseDMS(myGlobalLocation.lat()),Geo.parseDMS(myGlobalLocation.lng()));
		
		if (cleanEvents.length > 0){
		for(i=0;i<cleanEvents.length;i++){
			 var p2 =new LatLon(Geo.parseDMS(cleanEvents[i][28]),Geo.parseDMS(cleanEvents[i][29]));
			 var instanceDistance =	kiloconv(p1.distanceTo(p2));
			 
			 
			 
			 	finalArray.push(cleanEvents[i]);
				x = finalArray.length;
				finalArray[x-1][30] = instanceDistance;
			 
			}
			//document.write(finalArray.length+ ' final length of final array');
			finalArray.sort(function(a, b){
			return parseFloat(a[30]) > parseFloat(b[30])?1:-1;	
			});
			
			
			
			for(i=0;i<finalArray.length;i++){
				// put measurement units here ----
				if (finalArray[i][30] <= .1){
					finalArray[i][30] = (5280 * finalArray[i][30]).toFixed(0) + ' feet';
				}else if (finalArray[i][30] > .1 && finalArray[i][30] < .50){
					finalArray[i][30] = (1769 * finalArray[i][30]).toFixed(0) + ' yards';	
				}else{
					finalArray[i][30] = finalArray[i][30] + ' miles';
				}
				
			htmlContent += '<li> <a href="eventFinalDetail.cfm?event_num='+finalArray[i][0]+' "><span style="font-size:10px; font-style:italic;">' + finalArray[i][30] + ' from you</span><br /><span class="summaryOrgName" style="font-weight:300">'+finalArray[i][6]+'</span> <br /> ' +finalArray[i][12]+'</li></a>';	
			}
			$('#eventList').append(htmlContent);
			//alert('i am being called');
			$('#eventList').listview();
			$('#eventList').listview('refresh');
			
			
		}else{
		document.write('no events');	
		}
		  	
	}
	
	function showPosition(position)
			  { //alert('in show position');
				//var myLocation = new google.maps.LatLng(37.779789,-122.418812)//city hall temp value
				//var myLocation = new google.maps.LatLng(37.973535,-122.531087)//standford temp value
				var myLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
				  //var myLatlng = new google.maps.LatLng(40.650429,-73.950348);
				  myGlobalLocation = myLocation;
				 // globalTestLocation = myLatlng;
				  <cfoutput>
				  getTodaysEvents('#dateformat(currentDate,"mm/DD/YY")#','#dateformat(currentDate,"mm/DD/YY")#');
				  //alert('get today procedure called');
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

	<div data-role="header">
		<h1>Public Art by Distance from Your Location</h1>
	</div>
<div data-role="content" data-add-back-btn="true" id="content">

 <ul data-role="listview" id="eventList">

<!---
<li>
<span class="summaryOrgName" style="font-weight:300">Test Org Name<br /></span>
    Test event name
    </li>
--->
</ul>


</div>
 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
 <script type="text/javascript">
	$(document).ready(function(e) {	
     initialize();
	    });
	</script>
</div>

</body>
</html>