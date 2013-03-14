<!doctype html>
<html>
<meta charset="UTF-8">
<title>Untitled Document</title>
<head>
<cfparam name="date" default="9/20/12">




</head>

<body>
<div data-role="page" id="todaysEventsList" data-add-back-btn="true">
<cfscript>
if ((date EQ "9/20/12") or (date EQ "")){
date = dateFormat(now(),"mm/dd/yy");
}
</cfscript>
	<div data-role="header">
		<h1 style="font-size:13px"><cfoutput>Events<br />for #date# </cfoutput></h1>
	</div>
<div data-role="content" >
<ul data-role="listview">
		<cfoutput>
        <li><a href="eventsByDateDetail.cfm?disp=3&date=#dateformat(date,"mm/dd/yy")#">Music </a></li>
        <li><a href="eventsByDateDetail.cfm?disp=1&date=#date#">Theater</a></li>
        <li><a href="eventsByDateDetail.cfm?disp=2&date=#date#">Dance</a></li>
        <li><a href="eventsByDateDetail.cfm?disp=7&date=#date#">Museums</a></li>
        <li><a href="eventsByDateDetail.cfm?disp=8&date=#date#">Galleries</a></li>
        <li><a href="eventsByDateDetail.cfm?disp=6&date=#date#">Film/Video</a></li>
        <li><a href="eventsByDateDetail.cfm?disp=10&date=#date#">More for Less</a></li>
        <li><a href="eventsByDateDetail.cfm?disp=9&date=#date#">Children</a></li>
        <li><a href="eventsByDateDetail.cfm?disp=4&date=#date#">Literary Arts</a></li>
        <li><a href="eventsByDateDetail.cfm?disp=5&date=#date#">Festivals</a></li>
        <li><a href="eventsByDateDetail.cfm?disp=12&date=#date#">Nightlife</a></li>
        </cfoutput>
        </ul>	
</div>
 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>
</body>
</html>