<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>SFArts Arts Events Guide</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="jquery.mobile-1.1.1/jquery.mobile.theme-1.1.1.min.css" rel="stylesheet" type="text/css"/>
<link href="jquery.mobile-1.1.1/jquery.mobile.structure-1.1.1.min.css" rel="stylesheet" type="text/css"/>
<link href="css/app.css" rel="stylesheet" type="text/css"/>
<script src="jquery.mobile-1.1.1/jquery.js" type="text/javascript"></script>
<script src="jquery.mobile-1.1.1/jquery.mobile-1.1.1.min.js" type="text/javascript"></script>

<cfscript>
sfartsData = CreateObject("Component","sfarts");
sfartsData.init();
currentDate = now();
todaysEvents = sfartsData.getMasterEventsByDate(currentDate,currentDate);
thisWeekendsEvents = sfartsData.getEventsForThisWeekendNoDisp();
</cfscript>
</head> 
<body> 

<div id="page" data-role="page" data-theme="d">
	<div class="topOfPage">SFArts.org<br /><br /><br /><br /></div>
	
	<div data-role="content">	
		<ul data-role="listview">
			<li><a href="#downLoadAppsPage">Download our iOS/Android Apps</a></li>
            <li><a href="#editorialPage">See Highlighted Events</a></li>
            <li><a href="#todayPage"><cfoutput>See Today's Events (#todaysEvents.recordcount# events today)</cfoutput></a></li>
			<li><a href="#weekendPage">See This Weekend's Events <cfoutput> (#thisWeekendsEvents.recordcount# events)</cfoutput> </a></li>
            <li><a href="#keyWordPage">Search Events by Keyword</a></li>
            
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
		<h1>Page Three</h1>
	</div>
	<div data-role="content">	
		Content		
	</div>
	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>

<div data-role="page" id="weekendPage" data-add-back-btn="true">
	<div data-role="header">
		<h1>Page Four</h1>
	</div>
	<div data-role="content">	
		Content		
	</div>
	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>

<div data-role="page" id="keywordPage" data-add-back-btn="true">
	<div data-role="header">
		<h1>Page Four</h1>
	</div>
	<div data-role="content">	
		Content		
	</div>
	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>

<div data-role="page" id="editorialPage" data-add-back-btn="true">
	<div data-role="header">
		<h1>Highlighted Events</h1>
	</div>
	<div data-role="content">	
		<ul data-role="listview">
        <li><a href="musicEditorial.cfm?disp=2">Music Highlights</a></li>
        </ul>	
	</div>
	 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>

</body>
</html>