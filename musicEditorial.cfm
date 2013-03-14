<!doctype html>
<html>
<meta charset="UTF-8">
<title>Untitled Document</title>
<head>
<cfparam name="disp" default="3">

<cfscript>
sfartsData = CreateObject("Component","sfarts");
sfartsData.init();
currentDate = now();
editorialItems = sfartsData.getEditorialContentByDisp(disp);
</cfscript>

</head>

<body>
<div data-role="content">
<cfoutput query="editorialItems">
#title#<br />
</cfoutput>
</div>
</body>
</html>