<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #0056b3;
            margin-bottom: 30px;
        }

        .details, .payment-form {
            margin-bottom: 30px;
        }

        .details p, .payment-form p {
            font-size: 16px;
            margin: 10px 0;
        }

        .details b {
            color: #555;
        }

        .payment-form label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        .payment-form input[type="text"], .payment-form input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .payment-form input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 18px;
        }

        .payment-form input[type="submit"]:hover {
            background-color: #218838;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .footer a {
            text-decoration: none;
            color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Booking Confirmation</h2>

    <!-- Display booking details from session -->
    <div class="details">
        <p><b>Flight ID:</b> <%= session.getAttribute("flightId") %></p>
        <p><b>Flight Name:</b> <%= session.getAttribute("flightName") %></p>
        <p><b>Source:</b> <%= session.getAttribute("source") %></p>
        <p><b>Destination:</b> <%= session.getAttribute("destination") %></p>
        <p><b>Departure:</b> <%= session.getAttribute("departure") %></p>
        <p><b>Arrival:</b> <%= session.getAttribute("arrival") %></p>
        <p><b>Cost:</b> <%= session.getAttribute("cost") %></p>
        <p><b>Departure Date:</b> <%= session.getAttribute("departureDate") %></p>
    </div>

    <!-- Payment Form -->
    <div class="payment-form">
        <h3>Payment Details</h3>
        <form action="processPayment.jsp" method="post">
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" placeholder="Enter your card number" required>

            <label for="expDate">Expiration Date (MM/YY):</label>
            <input type="text" id="expDate" name="expDate" placeholder="MM/YY" required>

            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" name="cvv" placeholder="CVV" required>

            <!-- Hidden fields to send the booking data along with payment details -->
            <input type="hidden" name="flightId" value="<%= session.getAttribute("flightId") %>">
            <input type="hidden" name="flightName" value="<%= session.getAttribute("flightName") %>">
            <input type="hidden" name="source" value="<%= session.getAttribute("source") %>">
            <input type="hidden" name="destination" value="<%= session.getAttribute("destination") %>">
            <input type="hidden" name="departure" value="<%= session.getAttribute("departure") %>">
            <input type="hidden" name="arrival" value="<%= session.getAttribute("arrival") %>">
            <input type="hidden" name="cost" value="<%= session.getAttribute("cost") %>">
            <input type="hidden" name="departureDate" value="<%= session.getAttribute("departureDate") %>">

            <input type="submit" value="Pay Now">
        </form>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        <p>For any issues, please contact our <a href="contact.jsp">customer support</a>.</p>
    </div>
</div>

</body>
</html>
