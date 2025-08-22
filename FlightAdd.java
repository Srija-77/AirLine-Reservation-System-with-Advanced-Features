package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FlightAdd
 */
@WebServlet("/AddFlightServlet")
public class FlightAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FlightAdd() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String flightName = request.getParameter("flightName");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String departure = request.getParameter("departure");
		String arrival = request.getParameter("arrival");
		int seats=Integer.parseInt(request.getParameter("seats"));
		int cost=Integer.parseInt(request.getParameter("cost"));
		int flightId = ThreadLocalRandom.current().nextInt(10000, 100000); // 5-digit
		System.out.println("Generated ID: " + flightId);

		System.out.println("Flight Added: " + flightName + " | " + source + " -> " + destination);
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MJWB04", "root", "root");
			//String fid = null;

			String sql = "INSERT INTO flights  VALUES (0,?, ?, ?, ?, ?, ?, ?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, flightId);
			stmt.setString(2, flightName);
			stmt.setString(3, source);
			stmt.setString(4, destination);
			stmt.setString(5, departure);
			stmt.setString(6, arrival);
			stmt.setInt(7, seats);
			stmt.setInt(8, cost);
			stmt.setInt(9, seats);
			int rows = stmt.executeUpdate();

			if (rows > 0) {
				request.setAttribute("message", "Flight added successfully!");
			response.getWriter().write(flightId+" "+ "Added Sucessfully");
			
			} else {
				request.setAttribute("message", "Failed to add flight.");
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Error: " + e.getMessage());
		}

		/*
		 * request.getRequestDispatcher("success.jsp").forward(request, response);
		 * request.setAttribute("message", "Flight added successfully!");
		 * request.getRequestDispatcher("success.jsp").forward(request, response);
		 */}

}
