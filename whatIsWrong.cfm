<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>

<!--- It is a query for a specific date --->
       <!--- set variables for use in the code below --->
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

			
			
            <cfquery name="baseQuery" datasource="sfarts_CFX">
           SELECT     Event_Table.Event_Num, Event_Table.Date_Difference, ISNULL(Event_Table.Event_Phone, '') AS Event_Phone, 
                      dbo.clean_text(Event_Table.Event_Name) AS Event_Name, dbo.clean_text(Event_Table.Event_Description) AS Event_Description, 
                      Event_Table.Ticket_String, Event_Table.Date_String, Event_Table.Time_String, Org_Table.Org_Name, ISNULL(Org_Table.Org_Web, '') AS Org_Web, 
                      ISNULL(Venue_Table.Venue_address, '') AS Venue_Address, ISNULL(Venue_Table.Venue_City, '') AS Venue_City, Venue_Table.Venue_Name, 
                      ISNULL(Venue_Table.Venue_Phone, '') AS Venue_Phone, ISNULL(Event_Table.ticketLink, '') AS TicketLink, 
                      ISNULL(dbo.MakeYesNo(Event_Table.Child_Discount), 'NO') AS Child_Discount, ISNULL(dbo.MakeYesNo(Event_Table.Senior_Discount), 'NO') 
                      AS Senior_Discount, ISNULL(dbo.MakeYesNo(Event_Table.Student_Discount), 'NO') AS Student_Discount, 
                      ISNULL(dbo.MakeYesNo(Event_Table.TIXLink), 'NO') AS TixLink, ISNULL(dbo.MakeYesNo(Event_Table.TIXHalfPrice), 'NO') AS TIXHalfPrice, 
                      tbl_Neighborhoods.Neighborhood, [Discipline List].Discipline, [Discipline List_1].Discipline AS Discipline_2, Venue_Table.lat, Venue_Table.lon, 
                      ISNULL(Venue_Table.Venue_State, '') AS Venue_State, 
                      'http://www.sfarts.org/share/index.cfm?eventID=' + CAST(Event_Table.Event_Num AS VARCHAR(80)) AS shareURL
 from Venue_Table INNER JOIN
                      Org_Table INNER JOIN
                      Event_Table ON Org_Table.Org_Num = Event_Table.Org_Num ON Venue_Table.ID = Event_Table.venueID INNER JOIN
                      [Discipline List] ON Event_Table.ID = [Discipline List].ID INNER JOIN
                      [Discipline List] AS [Discipline List_1] ON Event_Table.ID2 = [Discipline List_1].ID LEFT OUTER JOIN
                      tbl_Neighborhoods ON Venue_Table.Venue_Neighborhood = tbl_Neighborhoods.neighborhoodID
WHERE     (Event_Table.Start_Date <= DATEADD(day, #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.End_Date >= DATEADD(day, 
                      #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.Performing_Arts_Event = 1) AND (Event_Table.[#Recordset2__num#] = 1) OR
                      (Event_Table.Start_Date <= DATEADD(day, #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.End_Date >= DATEADD(day, 
                      #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.[#Recordset2__day_string#] = 1) AND (Event_Table.Gallery_Museum_Event = 1) OR
                      (Event_Table.Start_Date <= DATEADD(day, #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.End_Date >= DATEADD(day, 
                      #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.Performing_Arts_Event = 1) AND (Event_Table.[#Recordset2__num#] = 1) OR
                      (Event_Table.Start_Date <= DATEADD(day, #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.End_Date >= DATEADD(day, 
                      #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.[#Recordset2__day_string#] = 1) AND (Event_Table.Gallery_Museum_Event = 1)
ORDER BY Event_Table.Date_Difference
                </cfquery>
                
                </head>

<body>
<cfoutput>
          
           SELECT     Event_Table.Event_Num, Event_Table.Date_Difference, ISNULL(Event_Table.Event_Phone, '') AS Event_Phone, 
                      dbo.clean_text(Event_Table.Event_Name) AS Event_Name, dbo.clean_text(Event_Table.Event_Description) AS Event_Description, 
                      Event_Table.Ticket_String, Event_Table.Date_String, Event_Table.Time_String, Org_Table.Org_Name, ISNULL(Org_Table.Org_Web, '') AS Org_Web, 
                      ISNULL(Venue_Table.Venue_address, '') AS Venue_Address, ISNULL(Venue_Table.Venue_City, '') AS Venue_City, Venue_Table.Venue_Name, 
                      ISNULL(Venue_Table.Venue_Phone, '') AS Venue_Phone, ISNULL(Event_Table.ticketLink, '') AS TicketLink, 
                      ISNULL(dbo.MakeYesNo(Event_Table.Child_Discount), 'NO') AS Child_Discount, ISNULL(dbo.MakeYesNo(Event_Table.Senior_Discount), 'NO') 
                      AS Senior_Discount, ISNULL(dbo.MakeYesNo(Event_Table.Student_Discount), 'NO') AS Student_Discount, 
                      ISNULL(dbo.MakeYesNo(Event_Table.TIXLink), 'NO') AS TixLink, ISNULL(dbo.MakeYesNo(Event_Table.TIXHalfPrice), 'NO') AS TIXHalfPrice, 
                      tbl_Neighborhoods.Neighborhood, [Discipline List].Discipline, [Discipline List_1].Discipline AS Discipline_2, Venue_Table.lat, Venue_Table.lon, 
                      ISNULL(Venue_Table.Venue_State, '') AS Venue_State, 
                      'http://www.sfarts.org/share/index.cfm?eventID=' + CAST(Event_Table.Event_Num AS VARCHAR(80)) AS shareURL
 from Venue_Table INNER JOIN
                      Org_Table INNER JOIN
                      Event_Table ON Org_Table.Org_Num = Event_Table.Org_Num ON Venue_Table.ID = Event_Table.venueID INNER JOIN
                      [Discipline List] ON Event_Table.ID = [Discipline List].ID INNER JOIN
                      [Discipline List] AS [Discipline List_1] ON Event_Table.ID2 = [Discipline List_1].ID LEFT OUTER JOIN
                      tbl_Neighborhoods ON Venue_Table.Venue_Neighborhood = tbl_Neighborhoods.neighborhoodID
WHERE     (Event_Table.Start_Date <= DATEADD(day, #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.End_Date >= DATEADD(day, 
                      #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.Performing_Arts_Event = 1) AND (Event_Table.[#Recordset2__num#] = 1) OR
                      (Event_Table.Start_Date <= DATEADD(day, #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.End_Date >= DATEADD(day, 
                      #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.[#Recordset2__day_string#] = 1) AND (Event_Table.Gallery_Museum_Event = 1) OR
                      (Event_Table.Start_Date <= DATEADD(day, #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.End_Date >= DATEADD(day, 
                      #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.Performing_Arts_Event = 1) AND (Event_Table.[#Recordset2__num#] = 1) OR
                      (Event_Table.Start_Date <= DATEADD(day, #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.End_Date >= DATEADD(day, 
                      #Recordset2__date_ahead#, { fn CURDATE() })) AND (Event_Table.[#Recordset2__day_string#] = 1) AND (Event_Table.Gallery_Museum_Event = 1)
ORDER BY Event_Table.Date_Difference
</cfoutput>
</body>
</html>