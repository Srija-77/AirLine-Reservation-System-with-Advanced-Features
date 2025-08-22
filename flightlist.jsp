<%@page import="com.Dao.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Flight Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f9f9f9;
        }
        h2 { text-align: center; }
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ccc;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) { background-color: #f2f2f2; }
    </style>
</head>
<body>

    <h2>Available Flight Details</h2>

    <table>
        <thead>
            <tr>
                <th>Flight ID</th>
                <th>Flight Name</th>
                <th>From</th>
                <th>To</th>
                <th>Departure</th>
                <th>Arrival</th>
            </tr>
        </thead>
        <tbody>
            <%
               Connection con=Database.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from flights");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            %>
            <tr>
                <td><%= rs.getInt(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(7) %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>