<%@page import="com.Dao.Database"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body><%

String passenger=(String)session.getAttribute("passenger");
String flightId = request.getParameter("FlightId");
        String flightName = request.getParameter("flightname");
        String source = request.getParameter("Source");
        String destination = request.getParameter("Destination");
        String departure = request.getParameter("Departure");
        String arrival = request.getParameter("Arrival");
        String cost = request.getParameter("cost");
        String departureDate = request.getParameter("departure-date");
       // String passengerId = request.getParameter("passengerId");
       System.out.println(passenger+""+flightId+""+flightName);

        try {
            // Establish database connection
            Connection con = Database.getConnection();
            
            // SQL to insert booking into the database
            String sql = "INSERT INTO bookings VALUES (0,?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, flightId);
            ps.setString(2, flightName);
            ps.setString(3, source);
            ps.setString(4, destination);
            ps.setString(5, departure);
            ps.setString(6, arrival);
            ps.setString(7, cost);
            ps.setString(8, departureDate);
            ps.setString(9, passenger);
            ps.setString(10,"waiting");

            // Execute the query
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Booking successful, redirect to a confirmation page
               // HttpSession session = request.getSession();
                session.setAttribute("flightId", flightId);
                session.setAttribute("flightName", flightName);
                session.setAttribute("source", source);
                session.setAttribute("destination", destination);
                session.setAttribute("departure", departure);
                session.setAttribute("arrival", arrival);
                session.setAttribute("cost", cost);
                session.setAttribute("departureDate", departureDate);
                response.sendRedirect("bookingConfirmation.jsp");
            } else {
                // Booking failed, show an error message
                response.sendRedirect("bookingError.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            e.getMessage();
            response.sendRedirect("bookingError.jsp");
        } %>
</body>
</html>