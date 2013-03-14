<!doctype html>
<html>
<meta charset="UTF-8">
<title>Untitled Document</title>
<head>
<cfparam name="searchText" default="piano">

<cfscript>
sfartsData = CreateObject("Component","sfarts");
sfartsData.init();
currentDate = now();
todaysEvents = sfartsData.getEventsBySimpleStringSearch(searchText);

</cfscript>
<!---
<cfquery name="dispName" datasource="sfarts_cfx">
SELECT     ID, Discipline, curatedBy
FROM         [Discipline List]
WHERE id = #disp#
</cfquery>
--->
</head>

<body>
<div data-role="page" id="todaysEventsList" data-add-back-btn="true">
	<div data-role="header">
		<h1><cfoutput>"#searchText#"</cfoutput></h1>
	</div>
<div data-role="content" data-add-back-btn="true">
 <ul data-role="listview">
 <cfoutput query="todaysEvents">
<li><a href="eventFinalDetail.cfm?event_num=#event_num#">
<span class="summaryOrgName" style="font-weight:300">#org_name#<br /></span>
    #event_name#
    </a></li>
  </cfoutput>
</ul>
</div>
 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>
</body>
</html>