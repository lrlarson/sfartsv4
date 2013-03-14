<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>SFArts Arts Events Guide</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="jquery.mobile-1.1.1/jquery.mobile.theme-1.1.1.css" rel="stylesheet" type="text/css"/>
<link href="jquery.mobile-1.1.1/jquery.mobile.structure-1.1.1.css" rel="stylesheet" type="text/css"/>
<link href="css/app.css" rel="stylesheet" type="text/css"/>
<link href="css/datepicker.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript"     src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDeAoBiPUncBuyH5-efc2csHqJcAHIn50E&sensor=true"></script>
<!---
<script src="http://code.jquery.com/jquery-1.4.3.min.js"></script>
--->
<script src="jquery.mobile-1.1.1/jquery.js" type="text/javascript"></script>
<script src="js/moment.js" type="text/javascript"></script>

<cfajaxproxy cfc="sfarts" jsclassname="sfarts">

<script>
		//reset type=date inputs to text
		$( document ).bind( "mobileinit", function(){
			$.mobile.page.prototype.options.degradeInputs.date = true;
		});	
		
		function searchDate() {
		targetDate = $('#date').val();
		alert(targetDate);	
		}
		
		function checkDatesInBookmarks(){
			var now = moment();
			var nowMoment = moment(now, 'MM-DD-YYYY');
			
			retrievedObject = localStorage.getItem('events');
			
			if (retrievedObject){
			var jsonString = JSON.parse(retrievedObject);
			length = jsonString.length;
			if (length > 0){
			$('#bMarks').show();	
			}else{
			//$('#bMarks').hide();
			}
			
			for (var i=0;i<length;i++){
			var endDate = jsonString[i].end_date;
			var event_num = jsonString[i].event_num;
			
			var endDateMoment = moment(endDate, 'MM-DD-YYYY');
			if (nowMoment.diff(endDate,'days')*-1>=0){
				
				console.log('ok');
			}else{
					//remove from storage
					$.each(jsonString,function(index, obj)       {
					if(obj.event_num == event_num){
       				 jsonString.splice(index,1);
       				 console.log(jsonString); 
       				 localStorage['events']= JSON.stringify(jsonString);}});

					console.log('NOT ok');
					}
				}
				
			}else{
				//$('#bMarks').hide();
			}
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
//arrayDispEditorial = new array(1);
todaysEvents = sfartsData.getMasterEventsByDate(currentDate,currentDate);
thisWeekendsEvents = sfartsData.getEventsForThisWeekendNoDisp();
highlightedEvents = sfartsData.getEditorialContent();
</cfscript>
<cfquery dbtype="query" name="numMusic">
select count(event_num) as numberOfMusic
from todaysEvents
where ID = 3 or ID2 = 3
</cfquery>
<cfset dispArray=[1,2,3,4,5,6,7,8,9,10]>
    <cfloop array="#dispArray#" index="i">
   <cfquery dbtype="query" name="countItems">
   select id from highlightedEvents
   where dispID = #i#
   </cfquery>
   <cfset arrayDispEditorial[#i#] = #countItems.recordcount#>
   <cfquery dbtype="query" name="countItems2">
   select Event_Num from todaysEvents
   where id = #i# or id2 = #i# 
   </cfquery>
   <cfset arrayDispToday[#i#] = #countItems2.recordcount#>
   <cfquery dbtype="query" name="countItems3">
   select Event_Num from thisWeekendsEvents
   where id = #i# or id2 = #i# 
   </cfquery>
   <cfset arrayDispWeekend[#i#] = #countItems3.recordcount#>
</cfloop>
</head> 
<body> 

<div id="page" data-role="page" data-theme="d">
	<div class="topOfPage" style=" text-align:center;font-size:48px">SF/Arts</div>
    <div class="logoText">Your Comprehensive Guide to San Francisco Arts<br /></div>
    
   
	
	<div data-role="content">	
		<ul data-role="listview">
			<li><a href="#downLoadAppsPage">Download our iOS/Android Apps</a></li>
            <li><a href="#editorialPage">See Highlighted Events <cfoutput> <span class="count">(#highlightedEvents.recordcount#)</span></cfoutput> </a></li>
            <li><a href="#todayPage"><cfoutput>See Today's Events <span class="count">(#todaysEvents.recordcount#)</span></cfoutput></a></li>
			<li><a href="#weekendPage">See Next Weekend's Events <cfoutput> <span class="count">(#thisWeekendsEvents.recordcount#)</span></cfoutput> </a></li>
            <li><a href="#keywordPage">Search Events by Keyword</a></li>
               <li><a href="#specificDate">Search Events by Date</a></li>
               
               
				<li><a href="#featuredPublicArt">Featured Public Art</a></li>
                
              	<li><a href="#closeToYou">Events Close to You</a></li>
                <li id="bMarks"><a href="bookmarkedEvents.cfm">Bookmarked Events</a></li>
	
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
        <p><img src="SFArts.jpg" style="height:auto; width:auto; float:left; padding-right:10px;">San Francisco Arts Monthly has free apps available for both iOS and Android.</p>
          <a href="http://itunes.apple.com/us/app/sf-arts-guide/id380603718?mt=8" target="_blank"><img  src="iTunes.png" style="height:auto;"></a><br />
         <a href="https://play.google.com/store/apps/details?id=air.com.larsonassociates.com.SfArtsAndroid&feature=search_result#?t=W251bGwsMSwyLDEsImFpci5jb20ubGFyc29uYXNzb2NpYXRlcy5jb20uU2ZBcnRzQW5kcm9pZCJd" target="_blank"> <img  src="googlePLay.png" width="133" height="44"></a></p>
    </div>
    
    <div style="clear:both;"></div>
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
        <cfoutput>
        <li><a href="todaysEvents.cfm?disp=3">Music <span class="count"> (#arrayDispToday[3]#)</span></a></li>
        <li><a href="todaysEvents.cfm?disp=1">Theater <span class="count"> (#arrayDispToday[1]#)</span></a></li>
        <li><a href="todaysEvents.cfm?disp=2">Dance <span class="count"> (#arrayDispToday[2]#)</span></a></li>
        <li><a href="todaysEvents.cfm?disp=7">Museums <span class="count"> (#arrayDispToday[7]#)</span></a></li>
        <li><a href="todaysEvents.cfm?disp=8">Galleries <span class="count"> (#arrayDispToday[8]#)</span></a></li>
        <li><a href="todaysEvents.cfm?disp=6">Film/Video <span class="count"> (#arrayDispToday[6]#)</span></a></li>
        <li><a href="todaysEvents.cfm?disp=10">More for Less <span class="count"> (#arrayDispToday[10]#)</span></a></li>
        <li><a href="todaysEvents.cfm?disp=9">Children <span class="count"> (#arrayDispToday[9]#)</span></a></li>
        <li><a href="todaysEvents.cfm?disp=4">Literary Arts <span class="count"> (#arrayDispToday[4]#)</span></a></li>
        <li><a href="todaysEvents.cfm?disp=5">Festivals <span class="count"> (#arrayDispToday[5]#)</span></a></li>
        <!---
        <li><a href="todaysEvents.cfm?disp=12">Nightlife <span class="count"> (#arrayDispToday[12]#)</span></a></li>
		--->
        </cfoutput>
        </ul>		
	</div>
	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF !important">SFArts.org</a></h4>
</div>
</div>

<div data-role="page" id="weekendPage" data-add-back-btn="true">
	<div data-role="header">
		<h1>Next Weekend..</h1>
	</div>
	<div data-role="content">	
		<ul data-role="listview">
        <cfoutput>
        <li><a href="thisWeekend.cfm?disp=3">Music <span class="count"> (#arrayDispWeekend[3]#)</span></a></li>
        <li><a href="thisWeekend.cfm?disp=1">Theater <span class="count"> (#arrayDispWeekend[1]#)</span></a></li>
        <li><a href="thisWeekend.cfm?disp=2">Dance <span class="count"> (#arrayDispWeekend[2]#)</span></a></li>
        <li><a href="thisWeekend.cfm?disp=7">Museums <span class="count"> (#arrayDispWeekend[7]#)</span></a></li>
        <li><a href="thisWeekend.cfm?disp=8">Galleries <span class="count"> (#arrayDispWeekend[8]#)</span></a></li>
        <li><a href="thisWeekend.cfm?disp=6">Film/Video <span class="count"> (#arrayDispWeekend[6]#)</span></a></li>
        <li><a href="thisWeekend.cfm?disp=10">More for Less <span class="count"> (#arrayDispWeekend[10]#)</span></a></li>
        <li><a href="thisWeekend.cfm?disp=9">Children <span class="count"> (#arrayDispWeekend[9]#)</span></a></li>
        <li><a href="thisWeekend.cfm?disp=4">Literary Arts <span class="count"> (#arrayDispWeekend[4]#)</span></a></li>
        <li><a href="thisWeekend.cfm?disp=5">Festivals <span class="count"> (#arrayDispWeekend[5]#)</span></a></li>
        <!---
        <li><a href="thisWeekend.cfm?disp=12">Nightlife <span class="count"> (#arrayDispWeekend[12]#)</span></a></li>
		--->
        </cfoutput>
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
        <cfoutput>
        <li><a href="editorial.cfm?disp=3">Music Highlights<span class="count"> (#arrayDispEditorial[3]#)</span></a></li>
        <li><a href="editorial.cfm?disp=1">Theater Highlights <span class="count">(#arrayDispEditorial[1]#)</span></a></li>
        <li><a href="editorial.cfm?disp=2">Dance Highlights <span class="count">(#arrayDispEditorial[2]#)</span></a></li>
        <li><a href="editorial.cfm?disp=7">Museum Highlights <span class="count">(#arrayDispEditorial[7]#)</span></a></li>
        <li><a href="editorial.cfm?disp=8">Gallery Highlights <span class="count">(#arrayDispEditorial[8]#)</span></a></li>
        <li><a href="editorial.cfm?disp=6">Film/Video Highlights <span class="count">(#arrayDispEditorial[6]#)</span></a></li>
        <li><a href="editorial.cfm?disp=10">More for Less Highlights <span class="count">(#arrayDispEditorial[10]#)</span></a></li>
        <li><a href="editorial.cfm?disp=9">Children Highlights <span class="count">(#arrayDispEditorial[9]#)</span></a></li>
        <li><a href="editorial.cfm?disp=4">Literary Arts Highlights <span class="count">(#arrayDispEditorial[4]#)</span></a></li>
        <li><a href="editorial.cfm?disp=5">Festivals Highlights <span class="count">(#arrayDispEditorial[5]#)</span></a></li>
        <!---
        <li><a href="editorial.cfm?disp=12">Nightlife Highlights <span class="count">(#arrayDispEditorial[12]#)</span></a></li>
		--->
        </cfoutput>
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

<div data-role="page" id="featuredPublicArt" data-add-back-btn="true">
	<div data-role="header">
		<h1>Featured Public Art</h1>
	</div>
	<div data-role="content">	
			<ul data-role="listview">
             <li><a href="closeToYouPublicArt.cfm">Featured Public Art</a></li>
           
            </ul>
	</div>
	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>

<div data-role="page" id="closeToYou" data-add-back-btn="true">
	<div data-role="header">
		<h1>Events Close to You</h1>
	</div>
	<div data-role="content">	
			<ul data-role="listview">
             <li><a href="closeToYou.cfm">All Events Close to You</a></li>
             <li><a href="closeToYouVisual.cfm">Gallery/Museum Events Close to You</a></li>
           	<li><a href="closeToYouPerforming.cfm">Theatre/Music/Dance Events Close to You</a></li>
            </ul>
	</div>
    </div>
    <!---
    <div data-role="page" id="bookMarkedEvents" data-add-back-btn="true">
	<div data-role="header">
		<h1>Bookmarked Events</h1>
	</div>
	<div data-role="content">	
			<ul data-role="listview">
             <li><a href="bookmarkedEvents.cfm">Your Bookmarks</a></li>
            </ul>
	</div>
	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>
--->

	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>

</body>
<!---
<!--VISISTAT SNIPPET//-->
<SCRIPT TYPE="text/javascript">var DID=12737;</SCRIPT>
<SCRIPT SRC="http://sniff.visistat.com/sniff.js" TYPE="text/javascript"></SCRIPT>
<!--VISISTAT SNIPPET//-->
--->
<script type="text/javascript">




$(document).ready(function(e) {
	
		
		checkDatesInBookmarks();	
		
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