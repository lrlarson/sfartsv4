<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
<cfparam name="id" default="4853">

<cfscript>
sfartsData = CreateObject("Component","sfarts");
sfartsData.init();
editorialDetail = sfartsData.getSpecificEditorialItem(id);
</cfscript>


</head>

<body>
<cfoutput>
<div data-role="page"  class="page-map" data-add-back-btn="true" style="width:100%; height:100%;">

	<div data-role="header"><h1>#editorialDetail.DispString# Highlight<br />
    <span style="font-size:12px; font-weight:300; text-align:center">By #editorialDetail.curatedBy#</span></h1></div>
	<div data-role="content">
    
     
		<div id="storyTitle" style=" text-align:center; font-size:18px; font-weight:bold; line-height:150%;">#editorialDetail.title#</div><br />
        <div id="story">
        <img src="#editorialDetail.imageName#" style="width:auto; height:auto; float:left; padding-right:10px; padding-bottom:2px;">
        #editorialDetail.storyText#<br />
        </div>
        <div id="details" style="clear:both;"><br />
        <a href="eventFinalDetail.cfm?event_num=#editorialDetail.Event#" data-role="button" data-mini="true" data-theme="b">Event Details</a>
        
        </div>
	
    
    
    </div>
    <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
</div>

</cfoutput>
</body>
</html>