<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Detail</title>
<cfparam name="Event_Num" default="10001">
<cfscript>

sfartsData = CreateObject("Component","sfarts");
sfartsData.init();
eventDetail = sfartsData.getEventByID(Event_Num);

</cfscript>
<script type="text/javascript">
//alert('script running');
</script>
</head>

<body>
<div data-role="page" id="eventFinalDetail" data-add-back-btn="true">
    <div data-role="header">
            <h1 style="font-size:14px"><cfoutput>#eventDetail.Event_Name#</cfoutput></h1>
           
            <div data-role="navbar" data-theme="b">
		<ul>
			
		</ul>
	</div><!-- /navbar -->
	
    </div><!--- end header--->
	<div data-role="content" >
   <cfoutput>
   <!---
    <a href="mapDisplay2.cfm" >Map</a></p>
	--->
   
    <span class="eventName" style="font-size:18px">#eventDetail.Event_Name# </span><br />
    <span class="orgName">#eventDetail.Org_Name# </span><br /><br />
    
    <span class="eventDate" style="font-style:italic;">#eventDetail.date_string#</span>
     <span class="eventDate" style="font-style:italic;">#eventDetail.time_string#</span><br /><br />
     <span class="eventDescription">#eventDetail.Event_Description# </span><br /><br />
    <span class="ticketString" style="font-style:italic;">#eventDetail.Ticket_String#</span>
    <br />
    <br />
     <span class="venueName" style=""><b>Venue:</b> #eventDetail.Venue_Name#</span>	
     <br />
      <span class="venueAddress" style=""> #eventDetail.Venue_address#, #eventDetail.Venue_City#
      <cfif #eventDetail.Venue_Phone# NEQ ''>
       <br />Venue Phone: #eventDetail.Venue_Phone#</span>	
  	</cfif>
       <cfif #eventDetail.event_phone# NEQ ''>
  <br /> Event Details Phone: #eventDetail.event_phone#
    </cfif>
    
    <br />
    	 <a href="##" id="bookmarkButton" data-role="button" data-mini="true" data-theme="b">Bookmark</a>
             <br />
       <a href="mapDisplay2.cfm" data-role="button" data-mini="true" data-theme="b">Map</a>
    
   <cfif #eventDetail.ticketLink# NEQ ''>
   <br /> <a href="#eventDetail.ticketLink#" data-role="button" data-mini="true" data-theme="b"target="_blank">More Ticket Information</a>
    </cfif>
   
   <cfif #eventDetail.org_web# NEQ ''>
  <br /><a href="#eventDetail.org_web#" data-role="button" data-mini="true" data-theme="b" target="_blank">Event Website</a>
    </cfif>
   
    </cfoutput>
<br />
	


 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>

<script type="text/javascript">
		
			
				
		
		//alert('script running');
		// When map page opens get location and display map
		$('.page-map').live("pagecreate", function() {
			//alert('pagecreate started');
			if(navigator.geolocation) {
				//alert('inside navigator');
				navigator.geolocation.getCurrentPosition(function(position){
					//alert('inside getCurrentPosition' + ' '+ position.coords.latitude + ' '+position.coords.longitude);
					initialize(position.coords.latitude,position.coords.longitude);
				//alert('pagecreate ran');
				
				});
			}
		});
		
		$('.page-map').live('pageshow',function(event){
			//alert('pagecreate started');
			if(navigator.geolocation) {
				//alert('inside navigator');
				navigator.geolocation.getCurrentPosition(function(position){
					//alert('inside getCurrentPosition' + ' '+ position.coords.latitude + ' '+position.coords.longitude);
					initialize(position.coords.latitude,position.coords.longitude);
				//alert('pagecreate ran');
				
				});
			}
		});
		
		function initialize(lat,lng) {
			
			//alert('inside initialize' + lat+lng);
			<cfoutput>
			var eventLatlng = new google.maps.LatLng(#eventDetail.lat_lon#);
			</cfoutput>
			var latlng = new google.maps.LatLng(lat, lng);
			//alert('made it past constructor');
			var myOptions = {
				zoom: 13,
				center: eventLatlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP
		    };
		    var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
			 var marker = new google.maps.Marker({
			  position: latlng,
			  map: map,
			  title:"Your location"
  });	 	
  			var image = 'gps.png';

			var marker = new google.maps.Marker({
			  position: eventLatlng,
			  map: map,
			  icon:image,
			  title:"Event location"
  });	 
			
		}
	
	</script>
   <cfoutput>
    <script>
	$( document ).ready(function() {
  $('##bookmarkButton').click(function( event ) {
	
    	var storedEvents = [];
		if (localStorage.getItem('events')){
		retrievedObject = localStorage.getItem('events');
		storedEvents = JSON.parse(retrievedObject);
		}
		
		var eventDetail = {eventName:'#eventDetail.Event_Name#',eventDateString:'#eventDetail.Date_String#',end_date:'#eventDetail.end_date#',event_num:'#eventDetail.event_num#',org_name:'#eventDetail.org_name#'};

		storedEvents.push(eventDetail);
		localStorage.setItem('events',JSON.stringify(storedEvents));
		$('##bookmarkButton').hide();
		
	
  });
});
	</script>
    </cfoutput>
   
</div>

    
</body>
</html>