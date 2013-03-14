<!doctype html>
<html>
<meta charset="UTF-8">
<title>Untitled Document</title>
<head>
<cfparam name="disp" default="6">

<cfscript>


</cfscript>

</head>

<body>
<div data-role="page" id="todaysEventsList" data-add-back-btn="true">
	<div data-role="header">
		<h1>Bookmarked Events</h1>
	</div>
<div data-role="content" data-add-back-btn="true" id="contentList">

 

</div>
 <div data-role="footer">
		<h4><a href="index.cfm" style="text-decoration:none; color:##FFF">SFArts.org</a></h4>
</div>
<script type="text/javascript">

$(document).ready(function(e) {
    console.log('document ready');
	//$('#ouputEvents').html('');
	var htmlString = '';	
	retrievedObject = localStorage.getItem('events');
	if (retrievedObject) {
	bookMarks = JSON.parse(retrievedObject)
	ul = document.createElement('ul')
	ul.setAttribute('data-role','listview');
	ul.setAttribute('id','list');
	for (var i=0;i<bookMarks.length;i++){
		console.log(bookMarks[i].eventName);
		htmlString += '<li><a href = "eventFinalDetailBookmarked.cfm?event_num=' + bookMarks[i].event_num + '">';
		htmlString += '<span class="summaryOrgName" style="font-weight:300">' + bookMarks[i].org_name ;
		htmlString += '</span><br>' + bookMarks[i].eventName + '</a></li>';
		}
	ul.innerHTML = htmlString;
	document.getElementById('contentList').appendChild(ul);
	}
});
</script>
</div>
</body>
</html>