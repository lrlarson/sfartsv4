<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
<cfparam name="date_ahead" default="3">
			<cfparam name="day_string" default="Wednesday">
			<cfparam name="num" default="27">
			<cfparam name="disp_num" default="3">
			<CFSET today_date=#now()#>
            <CFSET date1=#now()#>
			
			<CFPARAM NAME="month" DEFAULT="DATEPART(m,date1)">
			<CFPARAM NAME="year" DEFAULT="DATEPART(yyyy,date1)">
			<CFPARAM NAME="day" DEFAULT="DATEPART(dd,date1)">
			<CFPARAM NAME="Discipline" DEFAULT="All_Events">	
            
            <!---  Calculate variables for date portion query  --->
       
            <CFSET future_date = #date1#>
			<CFSET type="d">
            <CFSET date_ahead=#Abs(DateDiff(type, future_date, today_date))#+1>
            <CFIF #Dateformat(today_date)# EQ #Dateformat(future_date)#>
            <CFSET date_ahead=#Abs(DateDiff(type, future_date, today_date))#>
            </CFIF>
            <CFSET target_date=#now()#+#date_ahead#>
            <CFSET day_string = #dateformat(target_date, "dddd")#>
            <cfset num = #dateformat(target_date, "d")#>
            <cfset num = "D" & num>
           
         	<!--- query for the date test--->
            
			<cfparam name="Recordset2__date_ahead" default="#date_ahead#">
		<cfparam name="Recordset2__day_string" default="#day_string#">
		<cfparam name="Recordset2__num" default="#num#">
		<cfparam name="Recordset2__disp_num" default="#disp_num#">

			
			
            <cfoutput>
SELECT     Event_Table.Event_Num, Event_Table.ID, Event_Table.ID2, Event_Table.Free_For_All, Event_Table.Date_Difference, Event_Table.Event_Phone, 
                      Event_Table.Event_Name, Event_Table.Event_Description, Event_Table.Ticket_String, Event_Table.Date_String, Event_Table.Time_String, Event_Table.Org_Num, 
                      Org_Table.Org_Name, Org_Table.Org_Web, Venue_Table.Venue_address, Venue_Table.Venue_City, Venue_Table.Venue_Zip, Venue_Table.Venue_Name, 
                      Venue_Table.Venue_Phone, Venue_Table.Venue_Neighborhood, Event_Table.ticketLink, Event_Table.Child_Discount, Event_Table.Senior_Discount, 
                      Event_Table.Student_Discount, Event_Table.TIXLink, Event_Table.TIXHalfPrice, Event_Table.Start_Date, Venue_Table.lat_lon, Venue_Table.lat, 
                      Venue_Table.lon, Venue_Table.instanceDistance
FROM         Venue_Table INNER JOIN
                      Org_Table INNER JOIN
                      Event_Table ON Org_Table.Org_Num = Event_Table.Org_Num ON Venue_Table.ID = Event_Table.venueID
WHERE     (Event_Table.Start_Date <= DATEADD(day, #Recordset2__date_ahead#, dbo.getPacificTime())) AND (Event_Table.End_Date >= DATEADD(day, 
                      #Recordset2__date_ahead# , dbo.getPacificTime())) AND (Event_Table.Performing_Arts_Event = 1) AND (Event_Table.[#Recordset2__num#] = 1) AND Event_Table.venueID <> 1618 AND ( (ID = 6) OR
                      (ID2 = 6) OR
                      (ID = 7) OR
                      (ID2 = 7) OR
                      (ID = 8) OR
                      (ID2 = 8) OR
                      (ID = 13) OR
                      (ID2 = 13))
                      OR
                      (Event_Table.Start_Date <= DATEADD(day, #Recordset2__date_ahead# , dbo.getPacificTime())) AND (Event_Table.End_Date >= DATEADD(day, 
                      #Recordset2__date_ahead# , dbo.getPacificTime())) AND (Event_Table.[#Recordset2__day_string#] = 1) AND (Event_Table.Gallery_Museum_Event = 1) AND Event_Table.venueID <> 1618 AND ( (ID = 6) OR
                      (ID2 = 6) OR
                      (ID = 7) OR
                      (ID2 = 7) OR
                      (ID = 8) OR
                      (ID2 = 8) OR
                      (ID = 13) OR
                      (ID2 = 13))
                      OR
                      (Event_Table.Start_Date <= DATEADD(day, #Recordset2__date_ahead#  , dbo.getPacificTime())) AND (Event_Table.End_Date >= DATEADD(day, 
                      #Recordset2__date_ahead# , dbo.getPacificTime())) AND (Event_Table.Performing_Arts_Event = 1) AND (Event_Table.[#Recordset2__num#] = 1) AND Event_Table.venueID <> 1618 AND ( (ID = 6) OR
                      (ID2 = 6) OR
                      (ID = 7) OR
                      (ID2 = 7) OR
                      (ID = 8) OR
                      (ID2 = 8) OR
                      (ID = 13) OR
                      (ID2 = 13))
                      OR
                      (Event_Table.Start_Date <= DATEADD(day, #Recordset2__date_ahead# , dbo.getPacificTime())) AND (Event_Table.End_Date >= DATEADD(day, 
                      #Recordset2__date_ahead# ,dbo.getPacificTime())) AND (Event_Table.[#Recordset2__day_string#] = 1) AND (Event_Table.Gallery_Museum_Event = 1) AND Event_Table.venueID <> 1618 AND ( (ID = 6) OR
                      (ID2 = 6) OR
                      (ID = 7) OR
                      (ID2 = 7) OR
                      (ID = 8) OR
                      (ID2 = 8) OR
                      (ID = 13) OR
                      (ID2 = 13))
ORDER BY Event_Table.Date_Difference
              </cfoutput>
</head>

<body>
</body>
</html>