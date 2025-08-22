<%@page import="com.Dao.Database"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Available Tickets</title>
    <style>
        /* Add your CSS here for table and general styles */
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
        .no-ticket {
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
            <h2>Available Tickets</h2>
        </div>

        <%
            // Step 1: Get current time (System Date) for comparison
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String currentDateTime = sdf.format(new Date());
            
            // Step 2: Establish connection to the database
            Connection con = Database.getConnection();

            // Step 3: Query flights data from the database
            String query = "SELECT flightId, flight_name, departure, arrival, source, destination, SeatsCapacity, available_seats FROM flights";
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            // Step 4: Check if any results were returned
            boolean hasData = false;
            while (rs.next()) {
                hasData = true;
                String flightId = rs.getString("flightId");
                String flightName = rs.getString("flight_name");
                String departure = rs.getString("departure");
                String arrival = rs.getString("arrival");
                String source = rs.getString("source");
                String destination = rs.getString("destination");
                int seatsCapacity = rs.getInt("SeatsCapacity");
                int availableSeats = rs.getInt("available_seats");

                // Step 5: Print flight data in a table row
                out.println("<table>");
                out.println("<tr><th>Flight ID</th><th>Flight Name</th><th>Departure Date</th><th>Arrival Date</th><th>Source</th><th>Destination</th><th>Available Seats</th></tr>");
                out.println("<tr>");
                out.println("<td>" + flightId + "</td>");
                out.println("<td>" + flightName + "</td>");
                out.println("<td>" + departure + "</td>");
                out.println("<td>" + arrival + "</td>");
                out.println("<td>" + source + "</td>");
                out.println("<td>" + destination + "</td>");
                out.println("<td>" + availableSeats + "</td>");
                out.println("</tr>");
                
                // Step 6: Check if the departure time is within 24 hours, then update available seats if needed
                if (departure != null && departure.equals(currentDateTime)) {
                    // Update available seats
                    String updateSeatsSQL = "UPDATE flights SET available_seats = ? WHERE flightId = ?";
                    PreparedStatement updateStmt = con.prepareStatement(updateSeatsSQL);
                    updateStmt.setInt(1, seatsCapacity); // Reset available seats to the capacity (or another logic)
                    updateStmt.setString(2, flightId);
                    int rowsAffected = updateStmt.executeUpdate();

                    if (rowsAffected > 0) {
                        out.println("<p>Seats updated for flight: " + flightName + "</p>");
                    } else {
                        out.println("<p>No update occurred for flight: " + flightName + "</p>");
                    }
                }
                
                out.println("</table>");
            }

            // Step 7: If no flights are found, display a message
            if (!hasData) {
                out.println("<p class='no-ticket'>No available tickets found.</p>");
            }
        %>

        <a href="Phome.jsp" class="btn">Back to Home</a>
    </div>

</body>
</html>
