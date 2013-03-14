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
<cfquery name="dispName" datasource="sfarts_cfx">
SELECT     ID, Discipline, curatedBy
FROM         [Discipline List]
WHERE id = #disp#
</cfquery>

</head>

<body>
<div data-role="page" id="editorialPage" data-add-back-btn="true">
<style>
img.resize{
    width:80px; /* you can use % */
    height: auto;
}

</style>
	<div data-role="header">
		<h1>Featured <cfoutput>#dispName.Discipline#</cfoutput> </h1>
	</div>
<div data-role="content" data-add-back-btn="true">
<ul data-role="listview">
<cfoutput query="editorialItems">
<li><a href="editorialFinalDetail.cfm?id=#editorialItems.Editorial_Num#"><img src="#imageNameThumb#" style="height:55px; width:80px;  " ><span >#title#</span><br /><span style="font-size:11px; font-style:italic">#date_string#</span></a></li> 
</cfoutput>
</ul>




</div>
 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>
</body>
</html>