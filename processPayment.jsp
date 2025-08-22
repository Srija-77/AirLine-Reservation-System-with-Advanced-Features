<%@page import="com.Dao.Database"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Processing Payment</title>
</head>
<body>

<h2>Processing Payment...</h2>

<%
    String passenger = (String) session.getAttribute("passenger");
    if (passenger == null) {
        // Handle session error (redirect to login page, for example)
        response.sendRedirect("login.jsp");
        return;
    }

    String cardNumber = request.getParameter("cardNumber");
    String expDate = request.getParameter("expDate");
    String cvv = request.getParameter("cvv");
    String flightId = request.getParameter("flightId");
    String flightName = request.getParameter("flightName");
    String source = request.getParameter("source");
    String destination = request.getParameter("destination");
    String departure = request.getParameter("departure");
    String arrival = request.getParameter("arrival");
    String cost = request.getParameter("cost");
    String departureDate = request.getParameter("departureDate");
    
    Connection con = Database.getConnection();
    String sql = "SELECT creditcard FROM passenger WHERE email = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, passenger);

    ResultSet rs = ps.executeQuery();
    PrintWriter o = response.getWriter();

    if (rs.next()) {
        String cardno = rs.getString(1);
        
        if (cardNumber != null && cardNumber.trim().equals(cardno.trim())) {
            sql = "UPDATE bookings SET Status = 'Ticket Confirmed' WHERE passenger_id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, passenger);
            int i = ps.executeUpdate();
            
            if (i > 0) {
            	String sql1 = "SELECT SeatsCapacity FROM flights WHERE source = ? AND destination = ? AND arrival = ?";
            	PreparedStatement ps2 = con.prepareStatement(sql1);
            	ps2.setString(1, source);
            	ps2.setString(2, destination);
            	ps2.setString(3, arrival);

            	ResultSet rs2 = ps2.executeQuery();
            	if (rs2.next()) {
            		System.out.println("Seats available before update: ");
            	    int seats = rs2.getInt(1);
            	    int availbseats = seats - 1;

            	    System.out.println("Seats available before update: " + seats);
            	    System.out.println("Seats available after update: " + availbseats);

            	    // Prepare and execute the update query
            	    String sql3 = "UPDATE flights SET Available_seats = '"+availbseats+"' WHERE source = ? AND destination = ? AND arrival = ?";
            	    PreparedStatement ps3 = con.prepareStatement(sql3);
            	    
            	    ps3.setString(1, source);
            	    ps3.setString(2, destination);
            	    ps3.setString(3, arrival);

            	    int rowsUpdated = ps3.executeUpdate();
            	    System.out.println("Rows updated: " + rowsUpdated);

            	    if (rowsUpdated > 0) {
            	        System.out.println("Available seats updated successfully.");
            	    } else {
            	        System.out.println("No rows updated. Check if the flight exists.");
            	    }
            	} else {
            	    System.out.println("No matching flight found to update available seats.");
            	
                    
                    o.println("<script type=\"text/javascript\">");
                    o.println("alert('Card Number Matched Successfully...');");
                    o.println("window.location='Hello.jsp';</script>");
                }
            } else {
                o.println("<script type=\"text/javascript\">");
                o.println("alert('Payment Failed.............');");
                o.println("window.location='processPayment.jsp';</script>");
            }
        } else {
            o.println("<script type=\"text/javascript\">");
            o.println("alert('Card Number Not Matched...');");
            o.println("window.location='processPayment.jsp';</script>");
        }
    }
%>

</body>
</html>
