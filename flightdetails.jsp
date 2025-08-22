<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


        
<%


	if(request.getAttribute("result")!=null){
		ResultSet rs=(ResultSet) request.getAttribute("result");
		String uid=null;
		if(session.getAttribute("passenger")!=null){
			 uid=(String)session.getAttribute("passenger");
			 
		}else{
			/* System.out.println("session is null"); */
		}
		String date=(String)request.getAttribute("date");
		%>
		
		
		<table border="1" style=" padding: 20px;  " class="table table-bordered">
	<thead class="thHead">
					<tr>
					<th><b>FLight Id</b></th>
						<th><b>Flight Name</b></th>
						<th><b>Source </b></th>
						
						
						<th><b>Destination</b></th>
						<th><b>Departure</b></th>
						<th><b>Arrival</b></th>
						<th><b>Seats</b></th>
						<th><b>Ticket_Price</b></th>
						
					</tr>
				</thead>
				
				<%
				
				while(rs.next()){%>
				<tr style="color: black; width: 70%;">
	
		<td><%=rs.getInt(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getString(7) %></td>
		<td><%=rs.getInt(8) %></td>
		<td><%=rs.getInt(9) %></td>
		
		
		
		
		
						
					<td><h4><a href="Booking.jsp?FlightId=<%=rs.getString(2) %>&&flightname=<%=rs.getString(3)%>&&Source=<%=rs.getString(4)%>&&Destination=<%=rs.getString(5)%> &&Departure=<%=rs.getString(6)%>&&Arrival=<%=rs.getString(7)%>&&cost=<%=rs.getString(9)%>&&departure-date=<%=date%>">Book Ticket</a></h4></td>
						
						
		</tr>
					
				<% }
				
				%>
				
			

</table>
		
	<%}
	else{%>
	<p>No result found</p>	
<% 	}
	
	%>

                   



</body>
</html>