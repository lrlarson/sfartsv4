<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Detail</title>
<cfparam name="Event_Num" default="10000">
<cfscript>

sfartsData = CreateObject("Component","sfarts");
sfartsData.init();
eventDetail = sfartsData.getEventByID(Event_Num);

</cfscript>
<link type="text/css" href="css/app.css">
</head>

<body>
<div data-role="page" id="eventFinalDetail" data-add-back-btn="true">
    <div data-role="header">
            <h1 style="font-size:14px"><cfoutput>#eventDetail.Event_Name#</cfoutput></h1>
            <div data-role="navbar" data-theme="b">
		<ul>
			<li class="ui-block-b"><a href="map.cfm"  class="ui-btn-active ui-btn ui-btn-inline ui-btn-icon-right ui-btn-up-a" data-corners="false" data-shadow="false"  data-theme="a" data-inline="true">Map</a></li>
		</ul>
	</div><!-- /navbar -->
    </div><!--- end header--->
	<div data-role="content" >
    <cfoutput>
    <a href="mapDisplay2.cfm">Map</a></p>
    <span class="eventName" style="font-size:18px">#eventDetail.Event_Name# </span><br />
    <span class="orgName">#eventDetail.Org_Name# </span><br /><br />
    
    <span class="eventDate" style="font-style:italic;">#eventDetail.date_string#</span>
     <span class="eventDate" style="font-style:italic;">#eventDetail.time_string#</span><br /><br />
     <span class="eventDescription">#eventDetail.Event_Description# </span><br /><br />
    <span class="ticketString" style="font-style:italic;">#eventDetail.Ticket_String#</span>
    	
   <cfif #eventDetail.org_web# NEQ ''>
   <br /><br /> <a href="#eventDetail.org_web#" target="_blank">Event Website</a>
    </cfif>
   
    <cfif #eventDetail.event_phone# NEQ ''>
   <br /><br /> Phone: #eventDetail.event_phone#
    </cfif>
    </cfoutput>
    <script type="text/javascript"     src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDeAoBiPUncBuyH5-efc2csHqJcAHIn50E&sensor=true"></script>
	<script type="text/javascript">
		
		// When map page opens get location and display map
		$('.page-map').live("pagecreate", function() {
			if(navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position){
					initialize(position.coords.latitude,position.coords.longitude);
				});
			}
		});
		
		function initialize(lat,lng) {
			var latlng = new google.maps.LatLng(lat, lng);
			var myOptions = {
				zoom: 8,
				center: latlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP
		    };
		    var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
		}
	
	</script>
    </div> <!--- end content--->

</div>
 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>

</body>
</html>