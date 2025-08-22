<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>FlyNow - Passenger Registration</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    * {
      box-sizing: border-box;
      padding: 0;
      margin: 0;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    .card {
      background-color: #ffffff;
      border-radius: 20px;
      padding: 40px;
      width: 450px;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
      position: relative;
    }

    .card::before {
      content: '';
      font-size: 40px;
      position: absolute;
      top: -25px;
      left: 20px;
    }

    .card h2 {
      text-align: center;
      color: #2c5364;
      margin-bottom: 20px;
      font-weight: 600;
    }

    .form-group {
      margin-bottom: 18px;
    }

    label {
      display: block;
      margin-bottom: 6px;
      color: #333;
      font-size: 14px;
      font-weight: 500;
    }

    input, select {
      width: 100%;
      padding: 10px 12px;
      border: 1px solid #ccc;
      border-radius: 10px;
      font-size: 14px;
      transition: 0.3s ease;
    }

    input:focus, select:focus {
      border-color: #00bcd4;
      outline: none;
      box-shadow: 0 0 5px rgba(0,188,212,0.3);
    }

    .btn-submit {
      width: 100%;
      padding: 12px;
      background: #00bcd4;
      border: none;
      color: white;
      font-size: 16px;
      font-weight: bold;
      border-radius: 10px;
      cursor: pointer;
      transition: 0.3s ease;
    }

    .btn-submit:hover {
      background: #0097a7;
    }

    .footer-text {
      margin-top: 10px;
      font-size: 12px;
      text-align: center;
      color: #666;
    }
  </style>
</head>
<body>

  <div class="card">
    <h2>FlyNow Passenger Registration</h2>
    <form action="register_passenger" method="POST">
      <div class="form-group">
        <label for="fullname">Full Name</label>
        <input type="text" id="fullname" name="fullname" required>
      </div>

      <div class="form-group">
        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" required>
      </div>

      <div class="form-group">
        <label for="phone">Phone Number</label>
        <input type="tel" id="phone" name="phone" required>
      </div>

      <div class="form-group">
        <label for="gender">Gender</label>
        <select id="gender" name="gender" required>
          <option value="" disabled selected>Select Gender</option>
          <option value="Male">Male</option>
          <option value="Female">Female</option>
          <option value="Other">Other</option>
        </select>
      </div>

      <div class="form-group">
        <label for="passport">Passport Number</label>
        <input type="text" id="passport" name="passport" required>
      </div>

      <div class="form-group">
        <label for="creditcard">Credit Card Number</label>
        <input type="text" id="creditcard" name="creditcard" maxlength="16" pattern="\d{16}" placeholder="1234 5678 9012 3456" required>
      </div>

      <div class="form-group">
        <label for="password">Create Password</label>
        <input type="password" id="password" name="password" required>
      </div>

      <button type="submit" class="btn-submit">Register & Book</button>
    </form>
    <div class="footer-text">Trusted by millions of travelers worldwide </div>
  </div>

</body>
</html>
