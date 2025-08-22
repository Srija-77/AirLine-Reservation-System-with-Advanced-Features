
<%@page import="com.Dao.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Ticket Details</title>
    <style>
        /* Global styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 1000px;
            margin: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 28px;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .no-booking {
            text-align: center;
            font-size: 18px;
            color: #888;
        }

        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            display: inline-block;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .header {
            background-color: #4CAF50;
            padding: 15px;
            text-align: center;
            border-radius: 10px 10px 0 0;
            color: white;
            font-size: 24px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="header">
            <h2>Your Booked Ticket Details</h2>
        </div>

        <%
            // Retrieve the passenger's email or ID from session
            String passengerEmail = (String) session.getAttribute("passenger");

            if (passengerEmail == null) {
                // If passenger is not logged in, redirect to login page
                response.sendRedirect("login.jsp");
            } else {
                // Establish a connection to the database
                Connection con = Database.getConnection();

                // Prepare the SQL query to get the ticket details for the logged-in passenger
                String sql = "SELECT b.booking_id, b.flight_id, b.flight_name, b.departure_date, b.arrival, b.source, b.destination, b.status, f.available_seats " +
                             "FROM bookings b " +
                             "JOIN flights f ON b.flight_id = f.flightId " +
                             "WHERE b.passenger_id = (SELECT passenger_id FROM passenger WHERE email = ?)";

                // Prepare the statement and execute the query
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, passengerEmail);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // Display the ticket details in a table
                    out.println("<table>");
                    out.println("<tr><th>Booking ID</th><th>Flight ID</th><th>Flight Name</th><th>Departure Date</th><th>Arrival Date</th><th>Source</th><th>Destination</th><th>Status</th><th>Available Seats</th></tr>");
                    do {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("booking_id") + "</td>");
                        out.println("<td>" + rs.getString("flight_id") + "</td>");
                        out.println("<td>" + rs.getString("flight_name") + "</td>");
                        out.println("<td>" + rs.getString("departure_date") + "</td>");
                        out.println("<td>" + rs.getString("arrival") + "</td>");
                        out.println("<td>" + rs.getString("source") + "</td>");
                        out.println("<td>" + rs.getString("destination") + "</td>");
                        out.println("<td>" + rs.getString("status") + "</td>");
                        out.println("<td>" + rs.getInt("available_seats") + "</td>");
                        out.println("</tr>");
                    } while (rs.next());
                    out.println("</table>");
                } else {
                    out.println("<p class='no-booking'>No bookings found for this passenger.</p>");
                }

                // Close the ResultSet, PreparedStatement, and Connection
                rs.close();
                ps.close();
                con.close();
            }
        %>

        <a href="Phome.jsp" class="btn">Back to Home</a>
    </div>

</body>
</html>
