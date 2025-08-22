<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight Booking</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f4f7;
            padding: 30px;
        }
        .form-container {
            max-width: 600px;
            margin: auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        .input-group {
            margin-bottom: 20px;
        }
        label {
            font-size: 14px;
            color: #333;
            margin-bottom: 8px;
            display: block;
        }
        input[type="text"], input[type="date"], input[type="number"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 6px;
            margin-top: 6px;
        }
        input[type="text"] {
            height: 40px;
        }
        .autocomplete-suggestions {
            border: 1px solid #ddd;
            border-top: none;
            max-height: 200px;
            overflow-y: auto;
            background-color: white;
            position: absolute;
            width: 100%;
            z-index: 10;
            border-radius: 0 0 6px 6px;
        }
        .autocomplete-suggestion {
            padding: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .autocomplete-suggestion:hover {
            background-color: #ddd;
        }
        button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>Flight Booking</h2>
        <form id="booking-form" action="BookFlight" method="Post">
            <!-- From Input -->
            <div class="input-group" style="position: relative;">
                <label for="from">From</label>
                <input type="text" id="from" name="from" placeholder="Enter departure location" autocomplete="off" required>
                <div id="from-suggestions" class="autocomplete-suggestions"></div>
            </div>

            <!-- To Input -->
            <div class="input-group" style="position: relative;">
                <label for="to">To</label>
                <input type="text" id="to" name="to" placeholder="Enter destination location" autocomplete="off" required>
                <div id="to-suggestions" class="autocomplete-suggestions"></div>
            </div>

            <!-- Departure Date -->
            <div class="input-group">
                <label for="departure-date">Departure Date</label>
                <input type="date" id="departure-date" name="departure-date" required>
            </div>

            <!-- Number of Passengers -->
            <!-- <div class="input-group">
                <label for="passengers">Number of Passengers</label>
                <input type="number" id="passengers" name="passengers" min="1" required>
            </div> -->

            <button type="submit">Book Flight</button>
        </form>
    </div>

    <!-- <script>
        // Sample locations
        const locations = ['New York', 'London', 'Paris', 'Tokyo', 'Dubai', 'Berlin', 'Los Angeles', 'Sydney', 'Mumbai'];

        // Function to show autocomplete suggestions
        function showSuggestions(inputId, suggestionsId, searchQuery) {
            const suggestionsContainer = document.getElementById(suggestionsId);
            suggestionsContainer.innerHTML = '';
            const filteredLocations = locations.filter(location => location.toLowerCase().includes(searchQuery.toLowerCase()));
            filteredLocations.forEach(location => {
                const suggestion = document.createElement('div');
                suggestion.classList.add('autocomplete-suggestion');
                suggestion.textContent = location;
                suggestion.addEventListener('click', () => {
                    document.getElementById(inputId).value = location;
                    suggestionsContainer.innerHTML = ''; // Hide suggestions after selection
                });
                suggestionsContainer.appendChild(suggestion);
            });
        }

        // Handle input for "From" and "To"
        document.getElementById('from').addEventListener('input', (e) => {
            const searchQuery = e.target.value;
            if (searchQuery.length > 0) {
                showSuggestions('from', 'from-suggestions', searchQuery);
            } else {
                document.getElementById('from-suggestions').innerHTML = '';
            }
        });

        document.getElementById('to').addEventListener('input', (e) => {
            const searchQuery = e.target.value;
            if (searchQuery.length > 0) {
                showSuggestions('to', 'to-suggestions', searchQuery);
            } else {
                document.getElementById('to-suggestions').innerHTML = '';
            }
        });

        // Handle form submission
        document.getElementById('booking-form').addEventListener('submit', function(e) {
            e.preventDefault();

            const from = document.getElementById('from').value;
            const to = document.getElementById('to').value;
            const departureDate = document.getElementById('departure-date').value;
            const passengers = document.getElementById('passengers').value;

            if (from && to && departureDate && passengers) {
                alert(`Flight booked from ${from} to ${to} on ${departureDate} for ${passengers} passengers.`);
            } else {
                alert('Please fill in all the fields.');
            }
        });
    </script> -->

</body>
</html>