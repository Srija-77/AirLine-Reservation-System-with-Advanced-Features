package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.Database;

/**
 * Servlet implementation class Passenger
 */
@WebServlet("/register_passenger")
public class Passenger extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Passenger() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String passport = request.getParameter("passport");
        String creditcard = request.getParameter("creditcard");
        String password = request.getParameter("password");

         

        try {
            // Make sure the MySQL Connector JAR is in your classpath
            Connection conn = Database.getConnection();

            String sql = "INSERT INTO passenger (fullname, email, phone, gender, passport, creditcard, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement   pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fullname);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, gender);
            pstmt.setString(5, passport);
            pstmt.setString(6, creditcard);
            pstmt.setString(7, password);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("success.html");
            } else {
                response.sendRedirect("error.html");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        } 
        }
	

}
