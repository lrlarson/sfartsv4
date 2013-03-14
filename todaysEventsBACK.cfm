<!doctype html>
<html>
<meta charset="UTF-8">
<title>Untitled Document</title>
<head>
<cfparam name="disp" default="6">

<cfscript>
sfartsData = CreateObject("Component","sfarts");
sfartsData.init();
currentDate = now();
todaysEvents = sfartsData.getMasterEventsByDateByDisp(currentDate,currentDate,disp);

</cfscript>
<cfquery name="dispName" datasource="sfarts_cfx">
SELECT     ID, Discipline, curatedBy
FROM         [Discipline List]
WHERE id = #disp#
</cfquery>
</head>

<body>
<div data-role="page" id="todaysEventsList" data-add-back-btn="true">
	<div data-role="header">
		<h1>Today in <cfoutput>#dispName.Discipline# </cfoutput></h1>
	</div>
<div data-role="content" data-add-back-btn="true">
<table width="100%">
 <cfoutput query="todaysEvents">
  <tr>
    <td><a href="##"><span class="summaryOrgName">#org_name#<br /></span>
    #event_name#</a>
    </td>
  </tr>
  </cfoutput>
</table>


</div>
 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>
</body>
</html>