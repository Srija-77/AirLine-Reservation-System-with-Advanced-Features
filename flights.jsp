<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Flight</title>
</head>
<body>
    <h2>Add Flight Details</h2>
    <form action="AddFlightServlet" method="post">
        <label>Flight Name:</label>
        <input type="text" name="flightName" required><br><br>

        <label>From:</label>
        <input type="text" name="source" required><br><br>

        <label>To:</label>
        <input type="text" name="destination" required><br><br>

        <label>Departure Time:</label>
        <input type="time" name="departure" required><br><br>

        <label>Arrival Time:</label>
        <input type="time" name="arrival" required><br><br>
        
        <label>Seats Capacity:</label>
        <input type="number" name="seats" required><br><br>
        
        <label>Seats Cost:</label>
        <input type="number" name="cost" required><br><br>
        

        <input type="submit" value="Add Flight">
    </form>

</body>
</html>