<!doctype html>
<html>
<meta charset="UTF-8">
<title>Untitled Document</title>
<head>


<cfscript>
sfartsData = CreateObject("Component","sfarts");
sfartsData.init();
currentDate = now();
todaysEvents = sfartsData.getMasterEventsByDate(currentDate,currentDate);
thisWeekendsEvents = sfartsData.getEventsForThisWeekendNoDisp();
</cfscript>

</head>

<body>
<div data-role="content">
<cfoutput query="thisWeekendsEvents">
#event_num#<br />
</cfoutput>
</div>
</body>
</html>