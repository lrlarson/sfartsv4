<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>San Francisco Arts Events And Listings Calendar and Guide</title>

<script type="text/javascript">
window.location = "http://www.sfarts.org/mobile/index.cfm";

</script>
<meta name="viewport" content="width = 320">
<SCRIPT TYPE="text/javascript">var DID=12737;</SCRIPT>
<SCRIPT SRC="http://sniff.visistat.com/sniff.js" TYPE="text/javascript"></SCRIPT>

<META NAME ="title" CONTENT="San Francisco Arts Monthly">
<cfparam name="dispstring" default="Music">
<cfparam name="id" default="200">   
 
<CFSTOREDPROC procedure="dbo.procRSSGetEventData" datasource="sfarts_CFX">
  <CFPROCPARAM type="IN" dbvarname="@id" value="#id#" cfsqltype="cf_sql_integer">
  <CFPROCRESULT name="rsEventData">
</CFSTOREDPROC>

<CFSTOREDPROC procedure="dbo.procEditorialGetItems_RSS" datasource="sfarts_CFX">
  <CFPROCPARAM type="IN" dbvarname="@dispstring" value="#dispstring#" cfsqltype="CF_SQL_VARCHAR">
  <CFPROCRESULT name="rsPodStories">
</CFSTOREDPROC>
<style type="text/css">
<!--
body {

	font: 12px/1.5 Helvetica, Arial, 'Liberation Sans', FreeSans, sans-serif;
	color: #666;
	clear: both;
	width:400px;
	margin-right: 400px;
}
#header {
	height: 60px;
	width: 315px;
}
a:focus
{
	outline: 1px dotted invert;
}

hr
{
	border-color: #ccc;
	border-style: solid;
	border-width: 1px 0 0;
	clear: both;
	height: 0;
}

/* =Headings
--------------------------------------------------------------------------------*/

h1
{
	font-size: 25px;
}

h2
{
	font-size: 23px;
}
#wrapper #content .h2 p {
	font-size: 14px;
	font-weight: bold;
	color: #2BA1B7;
}

h3
{
	font-size: 21px;
}

h4
{
	font-size: 19px;
}

h5
{
	font-size: 17px;
}

h6
{
	font-size: 15px;
}

/* =Spacing
--------------------------------------------------------------------------------*/

ol
{
	list-style: decimal;
}

ul
{
	list-style: square;
}

li
{
	margin-left: 30px;
}
#content {
	height: auto;
	width: 240px;
	padding-left: 120px;
	padding-top: 10px;
}
#content a {
	color: #666666;
	text-decoration:none;
}

#content a:hover {
	color:#000;
	
}
#wrapper #left p {
	margin-top: 3px;
	margin-bottom: 3px;
}
#left {
	height: 300px;
	width: 100px;
	position: absolute;
	left: 15px;
	top: 110px;
	padding-left: 3px;
	font-weight: bold;
	color: #FFF;
}
#wrapper {
	height: 356px;
	width: 350px;
	clear: both;
	position: relative;
}
#wrapper #left p {
	color: #000;
	color: #2BA1B7;
}

#stories {
	margin-top: 3px;
	margin-bottom: 3px;
}
#content p {
	margin-top: 3px;
	margin-bottom: 3px;
}
#wrapper #left a {
		color: #2ba2b7;
	text-decoration:none;

}

#wrapper #left a:hover{
	color:#333;
}
-->
</style>
</head>

<body>

<div id="wrapper">
<hr width="100%" />
  <div id="header"><img src="rss/img/sfarts_logo_mobile.jpg" width="353" height="53" alt="SFarts" /></div>
<div id="content">

  <div class="h2">
  <cfoutput>
    <p>Featured #dispstring# Events:</p>
<br />
    </cfoutput>
  </div>

  <cfoutput query="rsPodStories">
  
  <p><a href="rss/rssstory.cfm?dispstring=#dispstring#&id=#rsPodstories.ID#">#rsPodstories.Title#</a></p>
	  <cfif rsPodStories.currentrow LT rsPodStories.recordcount>
        <hr width="100%" />
        </cfif>
  </cfoutput>

</div>
<div id="left">
  <p><a href="mobile.cfm?dispstring=Music">Music</a></p>
  <p><a href="mobile.cfm?dispstring=Dance">Dance</a></p>
  <p><a href="mobile.cfm?dispstring=Theater">Theater</a></p>
  <p><a href="mobile.cfm?dispstring=Museums">Museums</a></p>
  <p><a href="mobile.cfm?dispstring=Galleries">Galleries</a></p>
  <p><a href="mobile.cfm?dispstring=Festivals">Festivals</a></p>
  <p><a href="mobile.cfm?dispstring=Film/Video">Film/Video</a></p>
  <p><a href="mobile.cfm?dispstring=Children">Children</a></p>
  <p><a href="mobile.cfm?dispstring=More%20for%20Less">More for Less</a></p>
  <p><a href="mobile.cfm?dispstring=Literary%20Arts">Literary</a></p>
  <p><a href="mobile.cfm?dispstring=NightLife">NightLife</a></p>
</div>
</div>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-3368302-2");
pageTracker._trackPageview();
} catch(err) {}</script>
</body>
</html>