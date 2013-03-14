<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>SFArts Arts Events Guide</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="jquery.mobile-1.1.1/jquery.mobile.theme-1.1.1.min.css" rel="stylesheet" type="text/css"/>
<link href="jquery.mobile-1.1.1/jquery.mobile.structure-1.1.1.min.css" rel="stylesheet" type="text/css"/>
<link href="css/app.css" rel="stylesheet" type="text/css"/>
<link href="css/datepicker.css" rel="stylesheet" type="text/css"/>
<script src="jquery.mobile-1.1.1/jquery.js" type="text/javascript"></script>

<script>
		//reset type=date inputs to text
		$( document ).bind( "mobileinit", function(){
			$.mobile.page.prototype.options.degradeInputs.date = true;
		});	
		
		function searchDate() {
		targetDate = $('#date').val();
		alert(targetDate);	
		}
		
		var test1 = function(){
			alert("test");	
			
		}
		
		$('#date').click(test1);
	</script>
    

<script src="jquery.mobile-1.1.1/jquery.mobile-1.1.1.min.js" type="text/javascript"></script>
<script src="js/jQuery.ui.datepicker.js"></script>
<script src="js/jquery.ui.datepicker.mobile.js"></script>

<cfscript>
sfartsData = CreateObject("Component","sfarts");
sfartsData.init();
currentDate = now();
todaysEvents = sfartsData.getMasterEventsByDate(currentDate,currentDate);
thisWeekendsEvents = sfartsData.getEventsForThisWeekendNoDisp();
</cfscript>
<cfquery dbtype="query" name="numMusic">
select count(event_num) as numberOfMusic
from todaysEvents
where ID = 3 or ID2 = 3
</cfquery>
</head> 
<body> 

<div id="page" data-role="page" data-theme="d">
	<div class="topOfPage">SFArts.org</div>
    <div class="logoText">Your Comprehensive Guide to San Francisco Arts<br /></div>
    
   
	
	<div data-role="content">	
		<ul data-role="listview">
			<li><a href="#downLoadAppsPage">Download our iOS/Android Apps</a></li>
            <li><a href="#editorialPage">See Highlighted Events</a></li>
            <li><a href="#todayPage"><cfoutput>See Today's Events <span class="count">(#todaysEvents.recordcount#)</span></cfoutput></a></li>
			<li><a href="#weekendPage">See This Weekend's Events <cfoutput> <span class="count">(#thisWeekendsEvents.recordcount#)</span></cfoutput> </a></li>
            <li><a href="#keywordPage">Search Events by Keyword</a></li>
               <li><a href="#specificDate">Search Events by Date</a></li>
            
		</ul>		
	</div>
	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>

<div data-role="page" id="downLoadAppsPage" data-add-back-btn="true">
	<div data-role="header" >
		<h1>Download Mobile Apps</h1>
	</div>
	<div data-role="content">	
		Here is our link content....	
	</div>
	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>

<div data-role="page" id="todayPage" data-add-back-btn="true">
	<div data-role="header">
		<h1>Today's Events</h1>
	</div>
	<div data-role="content">	
		<ul data-role="listview">
        <li><a href="todaysEvents.cfm?disp=3">Music (<cfoutput>#numMusic.numberOfMusic#)</cfoutput></a></li>
        <li><a href="todaysEvents.cfm?disp=1">Theater</a></li>
        <li><a href="todaysEvents.cfm?disp=2">Dance</a></li>
        <li><a href="todaysEvents.cfm?disp=7">Museums</a></li>
        <li><a href="todaysEvents.cfm?disp=8">Galleries</a></li>
        <li><a href="todaysEvents.cfm?disp=6">Film/Video</a></li>
        <li><a href="todaysEvents.cfm?disp=10">More for Less</a></li>
        <li><a href="todaysEvents.cfm?disp=9">Children</a></li>
        <li><a href="todaysEvents.cfm?disp=4">Literary Arts</a></li>
        <li><a href="todaysEvents.cfm?disp=5">Festivals</a></li>
        <li><a href="todaysEvents.cfm?disp=12">Nightlife</a></li>
        </ul>		
	</div>
	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>

<div data-role="page" id="weekendPage" data-add-back-btn="true">
	<div data-role="header">
		<h1>This Weekend..</h1>
	</div>
	<div data-role="content">	
		<ul data-role="listview">
        <li><a href="thisWeekend.cfm?disp=3">Music </a></li>
        <li><a href="thisWeekend.cfm?disp=1">Theater</a></li>
        <li><a href="thisWeekend.cfm?disp=2">Dance</a></li>
        <li><a href="thisWeekend.cfm?disp=7">Museums</a></li>
        <li><a href="thisWeekend.cfm?disp=8">Galleries</a></li>
        <li><a href="thisWeekend.cfm?disp=6">Film/Video</a></li>
        <li><a href="thisWeekend.cfm?disp=10">More for Less</a></li>
        <li><a href="thisWeekend.cfm?disp=9">Children</a></li>
        <li><a href="thisWeekend.cfm?disp=4">Literary Arts</a></li>
        <li><a href="thisWeekend.cfm?disp=5">Festivals</a></li>
        <li><a href="thisWeekend.cfm?disp=12">Nightlife</a></li>
        </ul>		
	</div>
	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>

<div data-role="page" id="keywordPage" data-add-back-btn="true">
	<div data-role="header">
		<h1>Search by Keyword</h1>
	</div>
	<div data-role="content">	
		<div data-role="fieldcontain">
     <form action="searchReturn.cfm" method="get" name="searchText">    
    <label for="name">Search Term:&nbsp;</label>
    <input type="text" name="searchText" id="searchText"  />
    <label >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    <button type="submit" value="Submit" >Search</button>
    </form>
</div>	
	</div>
	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>

<div data-role="page" id="editorialPage" data-add-back-btn="true">
	<div data-role="header">
		<h1>Highlights</h1>
	</div>
	<div data-role="content">	
		<ul data-role="listview">
        <li><a href="editorial.cfm?disp=3">Music Highlights</a></li>
        <li><a href="editorial.cfm?disp=1">Theater Highlights</a></li>
        <li><a href="editorial.cfm?disp=2">Dance Highlights</a></li>
        <li><a href="editorial.cfm?disp=7">Museum Highlights</a></li>
        <li><a href="editorial.cfm?disp=8">Gallery Highlights</a></li>
        <li><a href="editorial.cfm?disp=6">Film/Video Highlights</a></li>
        <li><a href="editorial.cfm?disp=10">More for Less Highlights</a></li>
        <li><a href="editorial.cfm?disp=9">Children Highlights</a></li>
        <li><a href="editorial.cfm?disp=4">Literary Arts Highlights</a></li>
        <li><a href="editorial.cfm?disp=5">Festivals Highlights</a></li>
        <li><a href="editorial.cfm?disp=12">Nightlife Highlights</a></li>
        </ul>	
	</div>
    </div>
    <div data-role="page" id="specificDate" data-add-back-btn="true">
	<div data-role="header" >
		<h1>Search by Date</h1>
	</div>
	<div data-role="content">
	
		
		<form action="byDateEventSummary.cfm" method="get">
        
			<div data-role="fieldcontain">

	     	    <input type="date" name="date" id="date" style="display:none"  />
			<button type="submit" value="Submit" >Search Selected Date</button>
			</div>		
		</form>
     
	</div>
</div>

	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>

</body>
<script type="text/javascript">
$(document).ready(function(e) {
   		
		
		 $( '.ui-datepicker-calendar a' ).live('click', function() {
		 var currentDate = new Date();
		  var day = currentDate.getDate();
		  var month = currentDate.getMonth() + 1;
		  var year = currentDate.getFullYear();
		  var currentDateString = month +'/'+day+'/'+year;
			 test3 = $('#date').val();
			 var targetDate = new Date(test3);
			 var referenceDate = new Date(currentDateString);
			 if(targetDate<referenceDate){
			
				alert('Please pick a date in the future...');
			 }
			
			$( '.ui-datepicker-calendar a' ).datepicker();
			$( '.ui-datepicker-calendar a' ).datepicker('setDate', new Date());


  });
    
});
		

</script>
</html>